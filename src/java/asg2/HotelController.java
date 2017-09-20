/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg2;

import DB.HotelDAO;
import asg2.mdoel.Account;
import asg2.mdoel.Hotel;
import asg2.mdoel.Room;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Simon
 */
public class HotelController extends HttpServlet {

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
        String hid = request.getParameter("hid");
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        String action = request.getParameter("action");
        response.setContentType("text/html;charset=UTF-8");
        if (action != null && action.equals("searchRoominDateRange")) {
            String dateFrom = request.getParameter("dateFrom");
            String dateTo = request.getParameter("dateTo");
            String capacity = request.getParameter("capacity");
            HotelDAO hotelDAO = new HotelDAO();
            ArrayList<Room> rl = hotelDAO.getRoom(hid, capacity, dateFrom, dateTo);
            String json = new Gson().toJson(rl);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.write(json);
            }
        } else if (null != request.getParameter("hid")) {
            HotelDAO hotelDAO = new HotelDAO();
            Hotel hotel = hotelDAO.getHotelDetail(hid);
            ArrayList<Room> rl = hotelDAO.getRoom(hid);
            request.setAttribute("hotel", hotel);
            request.setAttribute("roomList", rl);
            Account ac = (Account) request.getSession().getAttribute("ac");

            if (action == null) {
                HttpSession session = request.getSession();
                Account sessionAC = (Account) session.getAttribute("ac");
                if (sessionAC != null &&sessionAC.getHid()!=null) {
                    session.setAttribute("isManager", sessionAC.getHid().contains(hid));
                }
                RequestDispatcher rd = request.getRequestDispatcher("/hotel.jsp");
                rd.forward(request, response);
            } else if (ac.getUser_type().equals("Manager") || ac.getUser_type().equals("ChiefManager")) {
                if (request.getParameter("action").equals("edit")) {
                    RequestDispatcher rd = request.getRequestDispatcher("/editHotel.jsp");
                    rd.forward(request, response);
                } else if (action.equals("update")) {
                    String h_name = request.getParameter("hotel");
                    String h_description = request.getParameter("desc");
                    String address = request.getParameter("addr");
                    String star = request.getParameter("star");
                    hotel.setH_name(h_name);
                    hotel.setH_description(h_description);
                    hotel.setAddress(address);
                    hotel.setStar(Integer.parseInt(star));
                    hotel.setRecommend(request.getParameter("recommend"));
                    System.out.println(request.getParameter("recommend"));
                    for (Room r : rl) {
                        int rid = r.getRid();
                        r.setRoom_type(request.getParameter("room_type_" + rid));
                        r.setTotal_no(Integer.parseInt(request.getParameter("total_no_" + rid)));
                        r.setCapacity(Integer.parseInt(request.getParameter("capacity_" + rid)));
                        r.setUnitprice(Integer.parseInt(request.getParameter("unitprice_" + rid)));
                        r.setDescription(request.getParameter("description_" + rid));
                        r.setRecommend(Integer.parseInt(request.getParameter("recommend_" + rid)));
                    }

                    hotelDAO.updateHotel(hotel);
                    hotelDAO.updateRoom(rl);

                    response.sendRedirect("HotelController.do?hid=" + hid);
                }
            } else {
                response.sendRedirect("index.jsp");
            }

        } else if (null != request.getParameter("city") && null != request.getParameter("country")) {
            HotelDAO hotelDAO = new HotelDAO();
            ArrayList al = hotelDAO.getHotelList(city);
            request.setAttribute("hotel", ((Hotel) al.get(0)).getH_name());
            request.setAttribute("desc", ((Hotel) al.get(0)).getH_description());
            request.setAttribute("addr", ((Hotel) al.get(0)).getAddress());
            request.setAttribute("lat", ((Hotel) al.get(0)).getLatitude());
            request.setAttribute("long", ((Hotel) al.get(0)).getLongitude());
            RequestDispatcher rd = request.getRequestDispatcher("/hotel.jsp");
            rd.forward(request, response);

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
