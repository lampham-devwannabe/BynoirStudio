/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.implement.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Items;
import model.Products;

/**
 *
 * @author lamph
 */
public class ProcessController extends HttpServlet {

    // increase/decrease quantity of a item servlet
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        // cart already existed
        if (o != null) {
            cart = (Cart) o;
        } else { // create new cart
            cart = new Cart();
        }
        String num_raw = request.getParameter("num").trim();
        String id_raw = request.getParameter("pid");
        int id, num;
        try {
            id = Integer.parseInt(id_raw);
            num = Integer.parseInt(num_raw);
            if (num == -1 && cart.getItemQuantityInCart(id) <= 1) {
                cart.removeItemFromCart(id);
            } else {
                ProductDAO pDAO = new ProductDAO();
                Products p = pDAO.findById(id);
                double price = p.getProduct_price() * 1.1;
                Items t = new Items(p, num, price);
                cart.addItemToCart(t);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        List<Items> list = cart.getItemList();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("view/common/user/cart.jsp").forward(request, response);
    }

    // delete item from cart servlet
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        // cart already existed 
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String id_raw = request.getParameter("pid");
        int pid = Integer.parseInt(id_raw);
        cart.removeItemFromCart(pid);
        List<Items> list = cart.getItemList();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("view/common/user/cart.jsp").forward(request, response);
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
