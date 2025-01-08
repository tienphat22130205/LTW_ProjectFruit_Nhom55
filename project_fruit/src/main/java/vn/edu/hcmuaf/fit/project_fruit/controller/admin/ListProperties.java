package vn.edu.hcmuaf.fit.project_fruit.controller.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.project_fruit.dao.CustomerDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.FeedbackDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.SupplierDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Customer;
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
//--------------------------------------------------------------------------------------
        // Kiểm tra xem có nhà cung cấp không
        SupplierDao supplierDao = new SupplierDao();
        int supplierPage = 1;
        if (request.getParameter("supplierPage") != null) {
            supplierPage = Integer.parseInt(request.getParameter("supplierPage"));
        }

        int recordsPerPageSuppliers = 25;  // Số lượng nhà cung cấp hiển thị mỗi trang
        List<Supplier> suppliers = supplierDao.getSuppliersByPage(supplierPage, recordsPerPageSuppliers);
        int totalSuppliers = supplierDao.getTotalRecords();  // Lấy tổng số nhà cung cấp
        int supplierPages = (int) Math.ceil(totalSuppliers * 1.0 / recordsPerPageSuppliers);

        // Đưa danh sách nhà cung cấp vào request để hiển thị trong JSP
        request.setAttribute("suppliers", suppliers);
        request.setAttribute("supplierPages", supplierPages);
        request.setAttribute("currentSupplierPage", supplierPage);

        // Kiểm tra xem có nhà cung cấp không
        if (suppliers.isEmpty()) {
            request.setAttribute("message", "Không có nhà cung cấp nào.");
        }

        // --------------------------------------------------------------------------------------
        // Kiểm tra xem có khách hàng không
        CustomerDao customerDao = new CustomerDao();
        int customerPage = 1;
        if (request.getParameter("customerPage") != null) {
            customerPage = Integer.parseInt(request.getParameter("customerPage"));
        }

        int recordsPerPageCustomers = 10;  // Số lượng khách hàng hiển thị mỗi trang
        List<Customer> customers = customerDao.getCustomersByPage(customerPage, recordsPerPageCustomers);
        int totalCustomers = customerDao.getTotalRecords();  // Lấy tổng số khách hàng
        int customerPages = (int) Math.ceil(totalCustomers * 1.0 / recordsPerPageCustomers);

        // Đưa danh sách khách hàng vào request để hiển thị trong JSP
        request.setAttribute("customers", customers);
        request.setAttribute("customerPages", customerPages);
        request.setAttribute("currentCustomerPage", customerPage);

        // Kiểm tra xem có khách hàng không
        if (customers.isEmpty()) {
            request.setAttribute("customerMessage", "Không có khách hàng nào.");
        }


        // Chuyển tiếp tới JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin.jsp");
        dispatcher.forward(request, response);
    }


}
