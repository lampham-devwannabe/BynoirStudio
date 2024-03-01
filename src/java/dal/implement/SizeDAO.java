/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.List;
import model.Sizes;

/**
 *
 * @author lamph
 */
public class SizeDAO extends GenericDAO<Sizes> {
    
    @Override
    public List<Sizes> findAll() {
        List<Sizes> list = queryGenericDAO(Sizes.class);
        return list;
    }
    
    @Override
    public int insert(Sizes t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
