package vn.edu.hcmuaf.fit.project_fruit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.User;
import vn.edu.hcmuaf.fit.project_fruit.service.UserService;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Hiển thị trang login
        request.getRequestDispatcher("/user/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String email = request.getParameter("useremail");
        String password = request.getParameter("pass");

        // Kiểm tra thông tin đăng nhập
        User user = userService.validateUser(email, password);

        if (user != null) {
            // Đăng nhập thành công, lưu thông tin người dùng vào session
            request.getSession().setAttribute("user", user);

            // Kiểm tra role của người dùng và chuyển hướng tương ứng
            if ("admin".equals(user.getRole())) {
                // Nếu là admin, chuyển hướng đến trang admin
                response.sendRedirect(request.getContextPath() + "/admin/admin.jsp");
            } else {
                // Nếu không phải admin, chuyển hướng về trang chủ
                response.sendRedirect(request.getContextPath() + "/list-product");
            }
        } else {
            // Đăng nhập thất bại
            request.setAttribute("errorMessage", "Email hoặc mật khẩu không chính xác.");
            request.getRequestDispatcher("/user/login.jsp").forward(request, response); // Quay lại trang login
        }
    }
}


