package vn.edu.hcmuaf.fit.project_fruit.service;

import vn.edu.hcmuaf.fit.project_fruit.dao.UserDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.User;

public class UserService {
    private final UserDao userDao = new UserDao();

    public User validateUser(String email, String password) {
        // Lấy user từ database
        User user = userDao.getUserByEmailAndPassword(email, password);

        // Nếu không tìm thấy user hoặc thông tin không khớp
        if (user == null) {
            return null;
        }

        // Kiểm tra vai trò hợp lệ
        if (!"admin".equals(user.getRole()) && !"user".equals(user.getRole())) {
            System.out.println("Vai trò không hợp lệ: " + user.getRole());
            return null; // Trả về null nếu vai trò không hợp lệ
        }

        // Trả về user hợp lệ
        return user;
    }
}
