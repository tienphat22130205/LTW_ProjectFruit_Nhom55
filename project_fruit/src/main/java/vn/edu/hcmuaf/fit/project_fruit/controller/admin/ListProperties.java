package vn.edu.hcmuaf.fit.project_fruit.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.project_fruit.dao.SupplierDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Supplier;

import java.io.IOException;
import java.util.List;
@WebServlet(name = "ListProperties", value = "/admin")
public class ListProperties extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy danh sách nhà cung cấp từ SupplierDao
        SupplierDao supplierDao = new SupplierDao();
        List<Supplier> suppliers = supplierDao.getAll();

        // Kiểm tra xem dữ liệu có rỗng không
        if (suppliers.isEmpty()) {
            request.setAttribute("message", "Không có nhà cung cấp nào.");
        }

        // Truyền danh sách nhà cung cấp tới JSP
        request.setAttribute("suppliers", suppliers);

        // Chuyển hướng tới trang admin.jsp
        request.getRequestDispatcher("/admin/admin.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Chuyển POST thành GET
    }

}
