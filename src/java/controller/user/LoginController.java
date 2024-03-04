/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.implement.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author lamph
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/user/home-page/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        // create UserDAO
        UserDAO uDAO = new UserDAO();
        // get session
        HttpSession session = request.getSession();
        // get input value from login.jsp
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String r = request.getParameter("remember");
        // create 3 cookies: store email, password and remember me status
        Cookie c1 = new Cookie("c_email", email);
        Cookie c2 = new Cookie("c_pass", password);
        Cookie c3 = new Cookie("c_rem", r);
        if (r != null) {
            // user chose to remember account 
            c1.setMaxAge(60*60*24*7);
            c2.setMaxAge(60*60*24*7);
            c3.setMaxAge(60*60*24*7);
        } else {
            c1.setMaxAge(0);
            c2.setMaxAge(0);
            c3.setMaxAge(0);
        }
        // save cookies into browser
        response.addCookie(c1);
        response.addCookie(c2);
        response.addCookie(c3);
        Users u = uDAO.login(email, password);
        if (u == null) {
            String ms = "Wrong email or password";
            session.setAttribute("ms", ms);
            request.getRequestDispatcher("view/user/home-page/login.jsp").forward(request, response);
        } else {
            session.setAttribute("currentLogin", u);
            response.sendRedirect("home");
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
