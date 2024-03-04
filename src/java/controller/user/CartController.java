/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.implement.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Items;
import model.Products;
import org.apache.catalina.tribes.transport.nio.NioSender;

/**
 *
 * @author lamph
 */
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/common/user/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        // cart already exists a product 
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String id_raw = request.getParameter("pid");
        String num_raw = request.getParameter("num");
        ProductDAO pDAO = new ProductDAO();
        try {
            int id = Integer.parseInt(id_raw);
            int num = Integer.parseInt(num_raw);
            Products p = pDAO.findById(id);
            double price = p.getProduct_price() * 1.1;
            Items t = new Items(p, num, price);
            cart.addItemToCart(t);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        List<Items> list = cart.getItemList();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("view/user/detail/product-detail.jsp").forward(request, response);
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
