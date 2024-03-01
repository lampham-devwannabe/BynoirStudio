/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.Bills;

/**
 *
 * @author lamph
 */
public class BillDAO extends GenericDAO<Bills> {

    @Override
    public List<Bills> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(Bills t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void deleteByUserId(int user_id) {
        String sql = "DELETE FROM [dbo].[Bills]\n"
                + "      WHERE [user_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user_id", user_id);
        deleteGenericDAO(sql, parameterMap);
    }
}
