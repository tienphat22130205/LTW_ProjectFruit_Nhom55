package vn.edu.hcmuaf.fit.project_fruit.controller.admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.project_fruit.dao.CustomerDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.FeedbackDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.ProductDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.SupplierDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.*;
import vn.edu.hcmuaf.fit.project_fruit.service.CustomerService;
import vn.edu.hcmuaf.fit.project_fruit.service.ProductService;

import java.io.IOException;
import java.util.List;
@WebServlet(name = "ListProperties", value = "/admin")
public class ListProperties extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FeedbackDao feedbackDao = new FeedbackDao();
        CustomerService customerService = new CustomerService();
        ProductService productService = new ProductService();

        // Lấy số trang từ request, mặc định là trang 1 nếu không có
        int page = 1;
        int recordsPerPage = 500;  // Số lượng feedback hiển thị mỗi trang
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
        //------------------------------------------------------------------------
        // Khách hàng gần đây
        List<Customer> recentCustomers = customerService.getRecentCustomers();
        request.setAttribute("recentCustomers", recentCustomers);
        // -------------------------------------------------------------------------
        List<Product> bestSellingProducts = productService.getBestSellingProducts(); // Hàm này trả về các sản phẩm bán chạy nhất
        request.setAttribute("bestSellingProducts", bestSellingProducts);
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

        int recordsPerPageCustomers = 200;  // Số lượng khách hàng hiển thị mỗi trang
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
        //-------------------------------------------------------------------
        ProductDao productDao = new ProductDao();
        int productPage = 1;

// Kiểm tra nếu có thông số "productPage" trong request (dùng để phân trang)
        if (request.getParameter("productPage") != null) {
            productPage = Integer.parseInt(request.getParameter("productPage"));
        }

        int recordsPerPageProducts = 150;  // Số lượng sản phẩm hiển thị mỗi trang
        List<ProductList> products = productDao.getProductsByPage(productPage, recordsPerPageProducts);

        // Lấy tổng số sản phẩm
        int totalProducts = productDao.getTotalRecords();

        // Tính số trang cần thiết để hiển thị
        int productPages = (int) Math.ceil(totalProducts * 1.0 / recordsPerPageProducts);

        // Đưa danh sách sản phẩm vào request để hiển thị trong JSP
        request.setAttribute("products", products);
        request.setAttribute("productPages", productPages);
        request.setAttribute("currentProductPage", productPage);

        // Kiểm tra nếu không có sản phẩm nào
        if (products.isEmpty()) {
            request.setAttribute("productMessage", "Không có sản phẩm nào.");
        }




        // Chuyển tiếp tới JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin.jsp");
        dispatcher.forward(request, response);
    }


}
