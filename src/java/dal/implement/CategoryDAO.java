/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.Categories;

/**
 *
 * @author lamph
 */
public class CategoryDAO extends GenericDAO<Categories> {

    @Override
    public List<Categories> findAll() {
        List<Categories> list = queryGenericDAO(Categories.class);
        return list;
    }

    @Override
    public int insert(Categories t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Categories findCateByProductId(int product_id) {
        String sql = "SELECT *\n"
                + "FROM Categories\n"
                + "WHERE category_id = (\n"
                + "    SELECT category_id\n"
                + "    FROM Products\n"
                + "    WHERE product_id = ?\n"
                + ")";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_id", product_id);
        List<Categories> list = queryGenericDAO(Categories.class, sql, parameterMap);
        return list.get(0);
    }
}
