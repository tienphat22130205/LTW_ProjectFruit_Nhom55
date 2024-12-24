package vn.edu.hcmuaf.fit.project_fruit.dao;

import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.User;

import java.sql.*;

public class UserDao {

    // Lấy thông tin người dùng qua email và mật khẩu
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        String query = "SELECT * FROM accounts WHERE email = ? AND password = ?";
        try (PreparedStatement ps = DbConnect.getPreparedStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                // Nếu tìm thấy người dùng, tạo đối tượng User và trả về
                user = new User(
                        rs.getInt("id_account"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("role")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;  // Trả về null nếu không tìm thấy người dùng
    }
}
