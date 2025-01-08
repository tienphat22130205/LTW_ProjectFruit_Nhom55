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
        String email = request.getParameter("useremail");
        String password = request.getParameter("pass");

        // Xác thực người dùng
        User user = new UserService().validateUser(email, password);

        if (user != null) {
            // Lưu user vào session
            request.getSession().setAttribute("user", user);

            // Chuyển hướng theo vai trò
            if ("admin".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/admin");
            } else if ("user".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/home");
            } else {
                // Nếu vai trò không hợp lệ, chuyển đến unauthorized
                response.sendRedirect(request.getContextPath() + "/unauthorized");
            }
        } else {
            // Đăng nhập thất bại
            request.setAttribute("errorMessage", "Email hoặc mật khẩu không chính xác.");
            request.getRequestDispatcher("/user/login.jsp").forward(request, response);
        }
    }
}


