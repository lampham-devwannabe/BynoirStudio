/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import javax.sound.sampled.Line;
import model.Users;
import org.apache.catalina.User;

/**
 *
 * @author lamph
 */
public class UserDAO extends GenericDAO<Users> {

    @Override
    public List<Users> findAll() {
        String sql = "SELECT [user_id]\n"
                + "      ,[user_email]\n"
                + "      ,[user_fullname]\n"
                + "      ,[user_password]\n"
                + "      ,[admin]\n"
                + "  FROM [BynoirDB].[dbo].[Users]";
        List<Users> list = queryGenericDAO(Users.class);
        return list;
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
        boolean admin = false;
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([user_email]\n"
                + "           ,[user_fullname]\n"
                + "           ,[user_password]\n"
                + "           ,[admin])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user_email", email);
        parameterMap.put("user_fullname", name);
        parameterMap.put("user_password", password);
        parameterMap.put("admin", admin);
        insertGenericDAO(sql, parameterMap);
    }

    public Users findByUserId(int id) {
        String sql = "SELECT [user_id]\n"
                + "      ,[user_email]\n"
                + "      ,[user_fullname]\n"
                + "      ,[user_password]\n"
                + "      ,[admin]\n"
                + "  FROM [BynoirDB].[dbo].[Users]\n"
                + "  WHERE [user_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user_id", id);
        List<Users> list = queryGenericDAO(Users.class, sql, parameterMap);
        return list.get(0);
    }

    public void updateRole(int id, boolean role) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [admin] = ?\n"
                + " WHERE [user_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("admin", role);
        parameterMap.put("user_id", id);
        updateGenericDAO(sql, parameterMap);
    }

    public void deleteById(int id) {
        String sql = "DELETE FROM [dbo].[Users]\n"
                + "      WHERE [user_id] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("user_id", id);
        deleteGenericDAO(sql, parameterMap);
    }
}
