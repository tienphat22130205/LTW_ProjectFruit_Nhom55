package vn.edu.hcmuaf.fit.project_fruit.test;

import vn.edu.hcmuaf.fit.project_fruit.dao.UserDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.User;

import java.beans.Statement;
import java.sql.ResultSet;import org.mindrot.jbcrypt.BCrypt;

public class TestDbConnect {

        public static void main(String[] args) {
            String plainPassword = "00001"; // Mật khẩu gốc bạn muốn sử dụng
            String hashedPassword = BCrypt.hashpw(plainPassword, BCrypt.gensalt());
            System.out.println("Hashed password: " + hashedPassword);
        }
    }

