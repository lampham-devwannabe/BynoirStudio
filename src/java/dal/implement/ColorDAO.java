/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.Colors;

/**
 *
 * @author lamph
 */
public class ColorDAO extends GenericDAO<Colors> {

    @Override
    public List<Colors> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(Colors t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Colors findColorByProductId(int product_id) {
        String sql = "SELECT * \n"
                + "FROM Colors\n"
                + "WHERE product_id = (\n"
                + "	SELECT product_id\n"
                + "	FROM Products\n"
                + "	WHERE product_id = ?\n"
                + ")";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_id", product_id);
        List<Colors> list = queryGenericDAO(Colors.class, sql, parameterMap);
        return list.get(0);
    }

    public void deleteByProductId(int product_id) {
        String sql = "DELETE FROM [dbo].[Colors]\n"
                + "      WHERE [product_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_id", product_id);
        deleteGenericDAO(sql, parameterMap);
    }

    public void insertByProductId(int product_id, String color) {
        String sql = "INSERT INTO [dbo].[Colors]\n"
                + "           ([product_id]\n"
                + "           ,[color])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_id", product_id);
        parameterMap.put("color", color);
        insertGenericDAO(sql, parameterMap);
    }

    public void updateColor(String color, int product_id) {
        String sql = "UPDATE [dbo].[Colors]\n"
                + "   SET [product_id] = ?\n"
                + "      ,[color] = ?\n"
                + " WHERE [product_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("product_id", product_id);
        parameterMap.put("color", color);
        updateGenericDAO(sql, parameterMap);
    }
}
