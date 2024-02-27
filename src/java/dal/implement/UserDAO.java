/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.Users;

/**
 *
 * @author lamph
 */
public class UserDAO extends GenericDAO<Users> {

    @Override
    public List<Users> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(Users t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Users login(String email, String password) {
        String sql = "SELECT * \n"
                + "FROM Users\n"
                + "WHERE user_email = ?\n"
                + "AND user_password = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user_email", email);
        parameterMap.put("user_password", password);
        List<Users> list = queryGenericDAO(Users.class, sql, parameterMap);
        return list.isEmpty() ? null : list.get(0);
    }

    public Users checkUnique(String email) {
        String sql = "SELECT * \n"
                + "FROM Users\n"
                + "WHERE user_email = ?\n";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user_email", email);
        List<Users> list = queryGenericDAO(Users.class, sql, parameterMap);
        return list.isEmpty() ? null : list.get(0);
    }

    public void signUp(String email, String name, String password) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([user_email]\n"
                + "           ,[user_fullname]\n"
                + "           ,[user_password]\n"
                + "           ,[isAdmin])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,0)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user_email", email);
        parameterMap.put("user_fullname", name);
        parameterMap.put("user_password", password);
        insertGenericDAO(sql, parameterMap);
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        dao.signUp("lam@gmail.com", "lam", "123");
        System.out.println("Done");
    }
}
