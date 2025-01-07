package vn.edu.hcmuaf.fit.project_fruit.controller.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.project_fruit.dao.cart.Cart;
import vn.edu.hcmuaf.fit.project_fruit.dao.cart.CartProduct;

import java.io.IOException;

@WebServlet(name = "Update", value = "/update-cart")
public class Update extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("pid"));
        int change = Integer.parseInt(request.getParameter("change"));

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {
            CartProduct product = cart.getProductById(productId);
            if (product != null) {
                cart.update(productId, product.getQuantity() + change);
                session.setAttribute("cart", cart);
            }
        }

        response.sendRedirect("show-cart");
    }
}
