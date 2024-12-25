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
        String category = request.getParameter("category");
        if (category == null) {
            category = ""; // Nếu không có category, gán giá trị rỗng
        }

        ProductService service = new ProductService();

        // Lấy danh sách sản phẩm chia theo dòng
        List<Product> data1 = service.getProductsByIdRange(1, 7);
        List<Product> data2 = service.getProductsByIdRange(8, 15);
        List<Product> data3 = service.getProductsByIdRange(16, 25);
        List<Product> data4 = service.getProductsByIdRange(27, 36);
        List<Product> data5 = service.getProductsByIdRange(37, 46);
        List<Product> data6 = service.getProductsByIdRange(47, 56);
        List<Product> data7 = service.getProductsByIdRange(57, 66);
        List<Product> data8 = service.getProductsByIdRange(67, 76);
        List<Product> data9 = service.getProductsByIdRange(77, 86);
        List<Product> data10 = service.getProductsByIdRange(87, 96);

        // Gửi danh sách sản phẩm theo dòng đến JSP
        request.setAttribute("data1", data1);
        request.setAttribute("data2", data2);
        request.setAttribute("data3", data3);
        request.setAttribute("data4", data4);
        request.setAttribute("data5", data5);
        request.setAttribute("data6", data6);
        request.setAttribute("data7", data7);
        request.setAttribute("data8", data9);
        request.setAttribute("data9", data9);
        request.setAttribute("data10", data10);



        // Thêm thông báo nếu danh sách rỗng
        if (data1.isEmpty() && data2.isEmpty() && data3.isEmpty() && data4.isEmpty() &&
                data5.isEmpty() && data6.isEmpty() && data7.isEmpty() && data8.isEmpty() &&
                data9.isEmpty() && data10.isEmpty()) {
            request.setAttribute("message", "Không tìm thấy sản phẩm nào.");
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

        // Forward đến JSP
        request.getRequestDispatcher(destination).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Chuyển POST thành GET
    }
}

