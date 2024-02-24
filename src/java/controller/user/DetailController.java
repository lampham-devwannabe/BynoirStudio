/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.implement.CategoryDAO;
import dal.implement.ColorDAO;
import dal.implement.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Categories;
import model.Colors;
import model.Products;

/**
 *
 * @author lamph
 */
public class DetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        ProductDAO pDAO = new ProductDAO();
        CategoryDAO cateDAO = new CategoryDAO();
        ColorDAO colorDAO = new ColorDAO();
        HttpSession session = request.getSession();
        String id_raw = request.getParameter("product_id");
        int product_id;
        try {
            product_id = Integer.parseInt(id_raw);
            Products p = pDAO.findById(product_id);
            Categories cate = cateDAO.findCateByProductId(product_id);
            Colors color = colorDAO.findColorByProductId(product_id);
            session.setAttribute("detail", p);
            session.setAttribute("cateDetail", cate);
            session.setAttribute("color", color);
            request.getRequestDispatcher("view/user/detail/product-detail.jsp").forward(request, response);
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
