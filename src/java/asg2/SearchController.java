/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg2;

import DB.HotelDAO;
import asg2.mdoel.ComplexObject;
import asg2.mdoel.Hotel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cwwong345
 */
public class SearchController extends HttpServlet {

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
        String hotel_name = request.getParameter("hotel_name");
        String startDate = request.getParameter("start");
        String endDate = request.getParameter("end");
        String country = request.getParameter("country");
        String city = request.getParameter("city");
        String star = request.getParameter("star");
        String numRoom = request.getParameter("numOfRoom");
        System.out.println("num room " + numRoom);
        String roomSize = request.getParameter("capacity");//no of people
        System.out.println("num ppl " + roomSize);
        String LowPrice = request.getParameter("lowerPrice");
        String UpperPrice = request.getParameter("upperPrice");

        HotelDAO hotelDAO = new HotelDAO();
        ArrayList<Hotel> hotelList = hotelDAO.searchHotel(hotel_name, startDate, endDate, city, star, roomSize, numRoom);
		System.out.println(hotelList.size());
        request.setAttribute("hotelList", hotelList);
        RequestDispatcher rd = request.getRequestDispatcher("/searchHotel.jsp");
        rd.forward(request, response);
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
