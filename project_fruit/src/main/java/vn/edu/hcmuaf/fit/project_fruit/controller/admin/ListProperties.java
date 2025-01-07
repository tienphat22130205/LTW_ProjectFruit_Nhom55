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

        // Lấy số trang từ request, mặc định là trang 1 nếu không có
        int page = 1;
        int recordsPerPage = 17;  // Số lượng feedback hiển thị mỗi trang
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        // Lấy danh sách feedback và phân trang
        List<Feedback> feedbacks = feedbackDao.getFeedbacksByPage(page, recordsPerPage);
        int noOfRecords = feedbackDao.getTotalRecords();  // Lấy tổng số bản ghi
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);

        // Đưa danh sách feedback vào request để hiển thị trong JSP
        request.setAttribute("feedback", feedbacks);  // Chỉ cần gọi một lần
        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);

        // Kiểm tra xem có nhà cung cấp không
        SupplierDao supplierDao = new SupplierDao();
        List<Supplier> suppliers = supplierDao.getAll();
        if (suppliers.isEmpty()) {
            request.setAttribute("message", "Không có nhà cung cấp nào.");
        }
        request.setAttribute("suppliers", suppliers);

        // Chuyển tiếp tới JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin.jsp");
        dispatcher.forward(request, response);
    }


}
