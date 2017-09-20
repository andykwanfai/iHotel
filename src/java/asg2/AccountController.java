/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asg2;

import DB.AccountDAO;
import DB.Encrypter;
import DB.JMailer;
import asg2.mdoel.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
 * @author Simon
 */
public class AccountController extends HttpServlet {

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
        String message;
        String action = request.getParameter("action");
        String firstName = request.getParameter("First Name");
        String lastName = request.getParameter("Last Name");
        String mail = request.getParameter("Email");
        String password = request.getParameter("Password");
        String mphash = Encrypter.encrypt(mail + password);
        String hash = request.getParameter("hash");
        System.out.println(mphash);
        if (action.equals("reg")) {
            response.setContentType("text/html;charset=UTF-8");
            //if(accountExist())
            AccountDAO accountDAO = new AccountDAO();
            int rows = 0;
            try {
                rows = accountDAO.createAC(mail, mphash, firstName, lastName);
            } catch (SQLException ex) {
                if (ex.getErrorCode() == 2627 || ex.getErrorCode() == 1062) {
                    request.setAttribute("errorMessage", "Email has already been registered.");
                    RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
                    rd.forward(request, response);
                }
            }

            if (rows == 1) {
                JMailer mailer = new JMailer();
                mailer.charSet = "utf-8";
                mailer.from = "advcl06@gmail.com";
                mailer.host = "smtp.gmail.com";//or your mail SMTP server
                mailer.subject = "Welcome to iHotel. Activate now to make your reservation!";
                mailer.body = "Dear Customer, </br></br>Make your reservation with our hot deal today by clicking the link below to activate your account.</br></br>"
                        + "<a link=\"http://localhost:8084/CS4280_iHotel/AccountController.do?action=act&hash=" + mphash + "></a>"
                        + "</br></br>"
                        + "Best Wishes,</br></br>"
                        + "IHotel CS Team";
                mailer.smtpAuth = true;
                mailer.addAddress(mail);
                //mailer.addBCC("son@gmail.com");
                mailer.setHTML(true);
                mailer.send();
                message = "Please activate your account through the activation mail.";
                request.setAttribute("message", message);
                RequestDispatcher rd = request.getRequestDispatcher("/activated.jsp");
                rd.forward(request, response);
            }
        } else if (action.equals("login")) {
            String index_page = "/index.jsp";
            HttpSession session = request.getSession();
            AccountDAO accountDAO = new AccountDAO();
            Account ac = accountDAO.loginAC(mail, mphash);
            if (ac != null) {
                session.setAttribute("ac", ac);
                response.sendRedirect(index_page);
            } else {
                System.out.println("wrong password");
                request.setAttribute("errorMessage", "Invalid user or password");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        } else if (action.equals("fpw")) {
            int rows;
            response.setContentType("text/html;charset=UTF-8");
            AccountDAO accountDAO = new AccountDAO();
            rows = accountDAO.ExistingAC(mail);
            if (rows == 1) {
                String mailHash = Encrypter.encrypt(mail);
                JMailer mailer = new JMailer();
                mailer.charSet = "utf-8";
                mailer.from = "advcl06@gmail.com";
                mailer.host = "smtp.gmail.com";//or your mail SMTP server
                mailer.subject = "Password Recovery";
                mailer.body = "Dear Customer, </br></br>Change your account password by clicking the link below.</br></br>"
                        + "<a link=\"/recoverPassword.do?hash=" + mailHash + "></a>"
                        + "</br></br>"
                        + "Best Wishes,</br></br>"
                        + "IHotel CS Team";
                mailer.smtpAuth = true;
                mailer.addAddress(mail);
                //mailer.addBCC("son@gmail.com");
                mailer.setHTML(true);
                mailer.send();
            }
        } else if (action.equals("act")) {
            int rows;
            AccountDAO accountDAO = new AccountDAO();
            rows = accountDAO.activateAC(hash);
            if (rows == 1) {
                message = "Account Acivated successfully";
            } else {
                message = "The activation link is invalid";
            }
            request.setAttribute("message", message);
            RequestDispatcher rd = request.getRequestDispatcher("/activated.jsp");
            rd.forward(request, response);
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
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
