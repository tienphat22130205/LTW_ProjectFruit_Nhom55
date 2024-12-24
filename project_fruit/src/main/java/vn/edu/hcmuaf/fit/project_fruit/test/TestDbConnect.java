package vn.edu.hcmuaf.fit.project_fruit.test;

import vn.edu.hcmuaf.fit.project_fruit.dao.UserDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.User;

import java.beans.Statement;
import java.sql.ResultSet;

public class TestDbConnect {
    public static void main(String[] args) {
        UserDao userDao = new UserDao();
        String testEmail = "tienphat111@gmail.com"; // Thay đổi email và mật khẩu cho phù hợp
        String testPassword = "00015"; // Mật khẩu của người dùng cần kiểm tra

        User user = userDao.getUserByEmailAndPassword(testEmail, testPassword);

        if (user != null) {
            System.out.println("User found: " + user.getPassword());
        } else {
            System.out.println("No user found with the given credentials.");
        }
    }
}
