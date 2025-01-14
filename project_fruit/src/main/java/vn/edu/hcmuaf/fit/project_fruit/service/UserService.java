package vn.edu.hcmuaf.fit.project_fruit.service;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.project_fruit.dao.UserDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.User;

public class UserService {
    private final UserDao userDao = new UserDao();

    public User validateUser(String email, String password) {
        // Lấy user từ database
        User user = userDao.getUserByEmailAndPassword(email, null); // Không kiểm tra mật khẩu trong query

        if (user == null) {
            System.out.println("Không tìm thấy user với email: " + email);
            return null;
        }

        // Kiểm tra mật khẩu bằng BCrypt
        if (!BCrypt.checkpw(password, user.getPassword())) {
            System.out.println("Mật khẩu không chính xác.");
            return null;
        }

        // Kiểm tra vai trò hợp lệ
        if (!"admin".equals(user.getRole()) && !"user".equals(user.getRole())) {
            System.out.println("Vai trò không hợp lệ: " + user.getRole());
            return null;
        }

        return user; // Trả về user nếu hợp lệ
    }
    public boolean registerUser(String email, String password, String confirmPassword, String fullName) {
        if (userDao.isEmailExists(email)) {
            System.out.println("Email đã tồn tại: " + email);
            return false;
        }

        if (!password.equals(confirmPassword)) {
            System.out.println("Mật khẩu xác nhận không khớp");
            return false;
        }

        // Hash mật khẩu
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Tạo đối tượng User mới
        User newUser = new User();
        newUser.setEmail(email);
        newUser.setPassword(hashedPassword);
        newUser.setRole("user"); // Vai trò mặc định là "user"

        // Gọi DAO để thêm người dùng mới
        return userDao.registerUser(newUser, fullName);
    }



        public static void main(String[] args) {
            UserService userService = new UserService();
            // Test case 1: Email đã tồn tại
            System.out.println("Test case 1: Email đã tồn tại");
            boolean result1 = userService.registerUser("existing_email@example.com", "password123", "password123", "User One");
            System.out.println("Kết quả: " + (result1 ? "Thành công" : "Thất bại"));

            // Test case 2: Mật khẩu xác nhận không khớp
            System.out.println("\nTest case 2: Mật khẩu xác nhận không khớp");
            boolean result2 = userService.registerUser("new_email@example.com", "password123", "password321", "User Two");
            System.out.println("Kết quả: " + (result2 ? "Thành công" : "Thất bại"));

            // Test case 3: Đăng ký thành công
            System.out.println("\nTest case 3: Đăng ký thành công");
            boolean result3 = userService.registerUser("new_user@example.com", "password123", "password123", "User Three");
            System.out.println("Kết quả: " + (result3 ? "Thành công" : "Thất bại"));

            // Test case 4: Email không hợp lệ
            System.out.println("\nTest case 4: Email không hợp lệ");
            boolean result4 = userService.registerUser("invalid_email_format", "password123", "password123", "User Four");
            System.out.println("Kết quả: " + (result4 ? "Thành công" : "Thất bại"));
        }
    }

