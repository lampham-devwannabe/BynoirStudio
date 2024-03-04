/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.implement.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author lamph
 */
public class SignupController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/user/home-page/signup.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        // create sesion
        HttpSession session = request.getSession();
        // UserDAO
        UserDAO uDAO = new UserDAO();
        // get value from signup form
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("pass");
        String re_pass = request.getParameter("repass");
        // checking if password and re-enter password matches
        if (password.equals(re_pass)) {
            Users u = uDAO.checkUnique(email);
            if (u == null) {
                // email has not been used
                uDAO.signUp(email, name, password);
                session.setAttribute("signUpSuccess", true);
                response.sendRedirect("home");
            } else {
                // email has been used
                String ms1 = "This email has already been used!";
                session.setAttribute("usedEmail", ms1);
                request.getRequestDispatcher("signup").forward(request, response);
            }
        } else {
            String ms = "Password not matching";
            session.setAttribute("notMatchingPass", ms);
            request.getRequestDispatcher("view/user/home-page/signup.jsp").forward(request, response);
        }
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
