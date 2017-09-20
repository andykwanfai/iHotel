/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg2;

import DB.HotelDAO;
import DB.OrderDAO;
import asg2.mdoel.Account;
import asg2.mdoel.ComplexObject;
import asg2.mdoel.Hotel;
import asg2.mdoel.Order;
import asg2.mdoel.Room;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cwwong345
 */
public class OrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if (action != null && action.equals("inputReserveInfo")) {
            String dateFrom = request.getParameter("date_from");
            String dateTo = request.getParameter("date_to");
            String amount = request.getParameter("amount");
            String rid = request.getParameter("rmid");
            Order order = new Order();
            order.setDate_from(dateFrom);
            order.setDate_to(dateTo);
            order.setQuantity(Integer.parseInt(amount));
            order.setRid(Integer.parseInt(rid));
            HotelDAO hotelDAO = new HotelDAO();
            Hotel hotel = new Hotel();
            Room room = new Room();
            room = hotelDAO.getRoomDetail(rid).get(0);
            hotel = hotelDAO.getHotelDetail(String.valueOf(room.getHid()));
            int nights = order.calDay(dateFrom, dateTo);
            Account ac = (Account) session.getAttribute("ac");
            double discount = 1.0;
            if (ac != null) {
                discount = Double.parseDouble(ac.getDiscount());
            }
            order.setSubPrice(order.calculatePrice(room.getUnitprice(), nights, Integer.parseInt(amount)));
            order.setFinalPrice(order.getSubPrice() * discount * 1.15);

            session.setAttribute("order", order);
            //request.setAttribute("order", order);
            request.setAttribute("hotel", hotel);
            request.setAttribute("room", room);
            request.setAttribute("nights", nights);
            RequestDispatcher rd = request.getRequestDispatcher("/order.jsp");
            rd.forward(request, response);
        } else if (action != null && action.equals("PayByVisa")) {
            String firstName = request.getParameter("contact_person_first_name");
            String lastName = request.getParameter("contact_person_last_name");
            Order ordSess = (Order) session.getAttribute("order");
            String dateFrom = ordSess.getDate_from();
            String dateTo = ordSess.getDate_to();
            int amount = ordSess.getQuantity();
            int rid = ordSess.getRid();
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String card = request.getParameter("card");
            String paymentMethod = request.getParameter("paymentmethod");
            double finalPrice = ordSess.getFinalPrice();
            String status = "Unpaid";
            String remarks = request.getParameter("remarks");
            OrderDAO orderDAO = new OrderDAO();
            Order order = new Order();
            order.setFirst_name(firstName);
            order.setLast_name(lastName);
            order.setDate_from(dateFrom);
            order.setDate_to(dateTo);
            order.setQuantity(amount);
            order.setRid(rid);
            order.setEmail(email);
            order.setCredit_card_no(card);
            //order.setPhoneNum(phone);
            order.setCredit_card_type(paymentMethod);
            order.setFinalPrice(finalPrice);
            order.setStatus(status);
            int row = 0;
            try {
                row = orderDAO.createOrder(order);
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
                        RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
            request.setAttribute("message", "Your payment has been success. ");
            rd.forward(request, response);
        } else if (action != null && action.equals("PayByPayPal")) {
            String firstName = request.getParameter("contact_person_first_name");
            String lastName = request.getParameter("contact_person_last_name");
            Order ordSess = (Order) session.getAttribute("order");
            String dateFrom = ordSess.getDate_from();
            String dateTo = ordSess.getDate_to();
            int amount = ordSess.getQuantity();
            int rid = ordSess.getRid();
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String card = request.getParameter("card");
            String paymentMethod = request.getParameter("paymentmethod");
            double finalPrice = ordSess.getFinalPrice();
            String status = "Unpaid";
            String remarks = request.getParameter("remarks");
            OrderDAO orderDAO = new OrderDAO();
            Order order = new Order();
            order.setFirst_name(firstName);
            order.setLast_name(lastName);
            order.setDate_from(dateFrom);
            order.setDate_to(dateTo);
            order.setQuantity(amount);
            order.setRid(rid);
            order.setEmail(email);
            order.setCredit_card_no(card);
            //order.setPhoneNum(phone);
            order.setCredit_card_type(paymentMethod);
            order.setFinalPrice(finalPrice);
            order.setStatus(status);
            int row = 0;
            try {
                row = orderDAO.createOrder(order);
            } catch (SQLException ex) {
                Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else if(action!=null&&action.equals("vieworder")){
            Order order = new Order();
            OrderDAO orderDAO = new OrderDAO();
            Account ac = (Account)session.getAttribute("ac");
            ArrayList<ComplexObject> complexObjectList = orderDAO.getUserOrder(ac.getEmail());
            request.setAttribute("complexObjectList", complexObjectList);
            RequestDispatcher rd = request.getRequestDispatcher("/modifyBooking.jsp");
            rd.forward(request, response);
            return;
        }else if(action!=null&&action.equals("cancelorder")){
            OrderDAO orderDAO = new OrderDAO();
            int booking_id = Integer.parseInt(request.getParameter("booking_id"));
            Account ac = (Account)session.getAttribute("ac");
            int row = orderDAO.deleteUserOrder(booking_id,ac.getEmail());
        }
        else if (request.getRequestURL() != null) {
            System.out.println("redirect from paypal:" + request.getRequestURL());
            RequestDispatcher rd = request.getRequestDispatcher("/success.jsp");
            request.setAttribute("message", "Your payment has been success. ");
            rd.forward(request, response);
            return;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
