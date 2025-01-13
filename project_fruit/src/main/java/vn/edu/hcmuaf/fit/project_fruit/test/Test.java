package vn.edu.hcmuaf.fit.project_fruit.test;

import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;

import java.sql.Connection;
import java.sql.SQLException;

public class Test {
    public static void main(String[] args) {
        try (Connection connection = DbConnect.getConnection()) {
            if (connection != null) {
                System.out.println("Kết nối thành công!");
            } else {
                System.out.println("Kết nối thất bại!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
