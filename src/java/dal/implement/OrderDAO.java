/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.List;
import model.Cart;
import model.Items;
import model.Orders;
import model.Products;
import model.Users;

/**
 *
 * @author lamph
 */
public class OrderDAO extends GenericDAO<Orders> {

    @Override
    public List<Orders> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(Orders t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int addOrder(Users u, Cart c) {
        LocalDate currentDate = java.time.LocalDate.now();
        String date = currentDate.toString();
        String sql = "INSERT INTO [dbo].[Orders]\n"
                + "           ([user_id]\n"
                + "           ,[order_date]\n"
                + "           ,[total_money])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user_id", u.getUser_id());
        parameterMap.put("order_date", date);
        parameterMap.put("total_money", c.getTotalMoney() + 30000);
        return insertGenericDAO(sql, parameterMap);
    }

    public int getOrderId() {
        String sql = "SELECT TOP 1[order_id]\n"
                + "      ,[user_id]\n"
                + "      ,[order_date]\n"
                + "      ,[total_money]\n"
                + "  FROM [dbo].[Orders]\n"
                + "  ORDER BY [order_id] DESC";
        parameterMap = new LinkedHashMap<>();
        List<Orders> list = queryGenericDAO(Orders.class, sql, parameterMap);
        int order_id = list.get(0).getOrder_id();
        return order_id;
    }

    public void addOrderDetail(Cart c) {
        for (Items i : c.getItemList()) {
            parameterMap = new LinkedHashMap<>();
            String sql = "INSERT INTO [dbo].[Orders_Detail]\n"
                    + "           ([order_id]\n"
                    + "           ,[product_id]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            parameterMap.put("order_id", c.getId());
            parameterMap.put("product_id", i.getProduct().getProduct_id());
            parameterMap.put("quantity", i.getQuantity());
            parameterMap.put("price", i.getPrice());
            insertGenericDAO(sql, parameterMap);
        }
    }

    public static void main(String[] args) {
        try {
            OrderDAO dao = new OrderDAO();
            Users u = new Users(2, "lam@gmail.com", "lam", "123", false);
            Cart c = new Cart();
            Products p = new Products(5, 5, "test", 25000, "...", "");
            Items i = new Items(p, 3, p.getProduct_price() * 1.2);
            c.addItemToCart(i);
            int oid = dao.addOrder(u, c);
            c.setId(oid);
            dao.addOrderDetail(c);
            System.out.println("Done");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
