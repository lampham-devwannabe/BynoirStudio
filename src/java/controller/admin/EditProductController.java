/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.implement.ColorDAO;
import dal.implement.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Products;

/**
 *
 * @author lamph
 */
public class EditProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        ProductDAO pDAO = new ProductDAO();
        ColorDAO colorDAO = new ColorDAO();
        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        String color = request.getParameter("color");
        String desc = request.getParameter("desc");
        String price_raw = request.getParameter("price");
        String cate_raw = request.getParameter("category");
        try {
            int id = Integer.parseInt(id_raw);
            double price = Double.parseDouble(price_raw);
            if (price < 0) {
                String invalid = "Invalid price";
                session.setAttribute("invalid", invalid);
                response.sendRedirect("manageProduct");
            } else {
                int cate = Integer.parseInt(cate_raw);
                pDAO.updateProduct(cate, name, price, desc, img, id);
                colorDAO.updateColor(color, id);
                response.sendRedirect("manageProduct");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
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
