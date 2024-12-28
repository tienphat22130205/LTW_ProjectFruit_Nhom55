package vn.edu.hcmuaf.fit.project_fruit.controller.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.project_fruit.dao.FeedbackDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.SupplierDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Feedback;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Supplier;

import java.io.IOException;
import java.util.List;
@WebServlet(name = "ListProperties", value = "/admin")
public class ListProperties extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FeedbackDao feedbackDao = new FeedbackDao();
        List<Feedback> feedbacks = feedbackDao.getAllFeedback();

        // Lấy danh sách nhà cung cấp từ SupplierDao
        SupplierDao supplierDao = new SupplierDao();
        List<Supplier> suppliers = supplierDao.getAll();

        // Đưa danh sách feedback vào request để hiển thị trong JSP
        request.setAttribute("feedback", feedbacks);

        // Kiểm tra xem dữ liệu nhà cung cấp có rỗng không
        if (suppliers.isEmpty()) {
            request.setAttribute("message", "Không có nhà cung cấp nào.");
        }

        // Truyền danh sách nhà cung cấp tới JSP
        request.setAttribute("suppliers", suppliers);

        // Chuyển tiếp đến JSP để hiển thị cả hai phần
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin.jsp");
        dispatcher.forward(request, response);
    }

}
