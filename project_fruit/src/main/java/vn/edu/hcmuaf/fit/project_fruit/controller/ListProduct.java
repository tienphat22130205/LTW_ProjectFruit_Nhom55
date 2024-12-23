package vn.edu.hcmuaf.fit.project_fruit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Product;
import vn.edu.hcmuaf.fit.project_fruit.service.ProductService;


import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListProduct", value = "/list-product")
public class ListProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gọi DAO để lấy danh sách sản phẩm
        String category = request.getParameter("category");
        if (category == null) {
            category = ""; // Nếu không có category, gán giá trị rỗng
        }

        ProductService service = new ProductService();
        List<Product> data;

        if (!category.isEmpty()) {
            // Lấy sản phẩm theo danh mục
            data = service.getProductsByCategory(category);
        } else {
            // Lấy toàn bộ sản phẩm (trang chủ)
            data = service.getAll();
        }

        // Gửi danh sách sản phẩm đến JSP
        request.setAttribute("data", data);
        if (data.isEmpty()) {
            request.setAttribute("message", "Không tìm thấy sản phẩm nào trong danh mục này.");
        }
        // Điều hướng đến trang phù hợp
        String destination = "/index.jsp"; // Default to home page
        switch (category) {
            case "traicayhomnay":
                destination = "/product/traicayhomnay.jsp";
                break;
            case "traicayvietnam":
                destination = "/product/traicayvietnam.jsp";
                break;
            case "traicaynhapkhau":
                destination = "/product/traicaynhapkhau.jsp";
                break;
            case "traicaycatsan":
                destination = "/product/traicaycatsan.jsp";
                break;
            case "quatangtraicay":
                destination = "/product/quatangtraicay.jsp";
                break;
            case "hopquanguyencat":
                destination = "/product/hopqua.jsp";
                break;
            case "traicaysaykho":
                destination = "/product/traicaysaykho.jsp";
                break;
            case "muttraicay":
                destination = "/product/muttraicay.jsp";
                break;
        }

        // Forward đến trang tương ứng
        request.getRequestDispatcher(destination).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Không sử dụng doPost trong trường hợp này
    }

}
