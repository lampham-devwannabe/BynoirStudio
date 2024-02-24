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

    @Override
    public List<Products> findAll() {
        List<Products> list = queryGenericDAO(Products.class);
        return list;
    }

    @Override
    public int insert(Products t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Products latestProduct() {
        String sql = "SELECT * FROM Products ORDER BY product_id DESC";
        parameterMap = new LinkedHashMap<>();
        List<Products> list = queryGenericDAO(Products.class, sql, parameterMap);
        return list.get(0);
    }

    public List<Products> findByCateId(int category_id) {
        String sql = "SELECT * FROM Products WHERE [category_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category_id", category_id);
        List<Products> list = queryGenericDAO(Products.class, sql, parameterMap);
        return list;
    }

    public Products findById(int product_id) {
        String sql = "SELECT * FROM Products WHERE [product_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_id", product_id);
        List<Products> list = queryGenericDAO(Products.class, sql, parameterMap);
        return list.get(0);
    } 
}