/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.Products;

/**
 *
 * @author lamph
 */
public class ProductDAO extends GenericDAO<Products> {

    // return all products
    @Override
    public List<Products> findAll() {
        List<Products> list = queryGenericDAO(Products.class);
        return list;
    }

    @Override
    public int insert(Products t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    // return latest product
    public Products latestProduct() {
        String sql = "SELECT * FROM Products ORDER BY product_id DESC";
        parameterMap = new LinkedHashMap<>();
        List<Products> list = queryGenericDAO(Products.class, sql, parameterMap);
        return list.get(0);
    }

    // find product by category id
    public List<Products> findByCateId(int category_id) {
        String sql = "SELECT * FROM Products WHERE [category_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category_id", category_id);
        List<Products> list = queryGenericDAO(Products.class, sql, parameterMap);
        return list;
    }

    // find product by product id
    public Products findById(int product_id) {
        String sql = "SELECT * FROM Products WHERE [product_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_id", product_id);
        List<Products> list = queryGenericDAO(Products.class, sql, parameterMap);
        return list.get(0);
    }

    // find product by product name
    public List<Products> findByName(String keyword) {
        String sql = "SELECT * FROM Products WHERE product_name like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_name", "%" + keyword + "%");
        List<Products> list = queryGenericDAO(Products.class, sql, parameterMap);
        return list;
    }

    public void deleteProduct(int product_id) {
        String sql = "DELETE FROM [dbo].[Products]\n"
                + "      WHERE [product_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_id", product_id);
        deleteGenericDAO(sql, parameterMap);
    }

    public void deleteSizeByProductId(int product_id) {
        String sql = "DELETE FROM [dbo].[Products_Size]\n"
                + "      WHERE [product_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_id", product_id);
        deleteGenericDAO(sql, parameterMap);
    }

    public void insertProduct(int category_id, String product_name, Float product_price,
            String product_description, String img) {
        String sql = "INSERT INTO [dbo].[Products]\n"
                + "           ([category_id]\n"
                + "           ,[product_name]\n"
                + "           ,[product_price]\n"
                + "           ,[product_description]\n"
                + "           ,[img])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category_id", category_id);
        parameterMap.put("product_name", product_name);
        parameterMap.put("product_price", product_price);
        parameterMap.put("product_description", product_description);
        parameterMap.put("img", img);
        insertGenericDAO(sql, parameterMap);
    }

    public void updateProduct(int category_id, String product_name, double product_price,
            String product_description, String img, int product_id) {
        String sql = "UPDATE [dbo].[Products]\n"
                + "   SET [category_id] = ?\n"
                + "      ,[product_name] = ?\n"
                + "      ,[product_price] = ?\n"
                + "      ,[product_description] = ?\n"
                + "      ,[img] = ?\n"
                + " WHERE [product_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category_id", category_id);
        parameterMap.put("product_name", product_name);
        parameterMap.put("product_price", product_price);
        parameterMap.put("product_description", product_description);
        parameterMap.put("img", img);
        parameterMap.put("product_id", product_id);
        updateGenericDAO(sql, parameterMap);
    }
}
