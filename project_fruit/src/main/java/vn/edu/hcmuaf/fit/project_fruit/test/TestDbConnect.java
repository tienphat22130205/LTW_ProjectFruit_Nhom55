package vn.edu.hcmuaf.fit.project_fruit.test;

import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;

import java.beans.Statement;
import java.sql.ResultSet;

public class TestDbConnect {
    public static void main(String[] args) {
        try {
            Statement s = (Statement) DbConnect.get();
            if (s != null) {
                System.out.println("Kết nối thành công!");
                ResultSet rs = ((java.sql.Statement) s).executeQuery("SELECT * FROM products");
                while (rs.next()) {
                    System.out.println("Sản phẩm: " + rs.getString("name"));
                }
            } else {
                System.out.println("Kết nối thất bại.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
