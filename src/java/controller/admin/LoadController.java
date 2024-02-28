/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.implement.CategoryDAO;
import dal.implement.ColorDAO;
import dal.implement.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Categories;
import model.Colors;
import model.Products;

/**
 *
 * @author lamph
 */
public class LoadController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        ProductDAO pDAO = new ProductDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        ColorDAO colorDAO = new ColorDAO();
        String pid_raw = request.getParameter("edit_id");
        int pid = Integer.parseInt(pid_raw);
        Products p = pDAO.findById(pid);
        Colors color = colorDAO.findColorByProductId(pid);
        List<Categories> cList = cateDAO.findAll();
        request.setAttribute("categoryList", cList);
        request.setAttribute("p", p);
        request.setAttribute("co", color);
        request.getRequestDispatcher("view/admin/edit-product.jsp").forward(request, response);
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
