package vn.edu.hcmuaf.fit.project_fruit.dao;

import com.sun.tools.javac.Main;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;
import vn.edu.hcmuaf.fit.project_fruit.dao.db.JdbiConnect;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Product;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.ProductImg;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

    // Lấy toàn bộ danh sách sản phẩm
    public List<Product> getAll() {
        Statement s = DbConnect.get();
        if (s == null) return new ArrayList<>();
        try {
            ArrayList<Product> products = new ArrayList<>();
            String query = """
            SELECT p.*, pr.percent_discount
            FROM products p
            LEFT JOIN promotions pr ON p.id_promotion = pr.id_promotion;
        """;
            ResultSet rs = s.executeQuery(query);
            while (rs.next()) {
                // Lấy danh sách hình ảnh của sản phẩm
                List<ProductImg> listImg = getImagesByProductId(rs.getInt("id_product"));

                // Thêm sản phẩm vào danh sách
                Product product = new Product(
                        rs.getInt("id_product"),
                        rs.getString("product_name"),
                        listImg,
                        rs.getDouble("price"),
                        rs.getString("rating"),
                        rs.getDouble("percent_discount")
                );
                // Tính giá sau khi giảm
                product.calculateDiscountedPrice();

                // Thêm sản phẩm vào danh sách
                products.add(product);
            }
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
//        Jdbi jdbi = JdbiConnect.get();
//        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM products").mapToBean(Product.class).list());
    }
    // Lấy sản phẩm theo danh mục
    public List<Product> getProductsByCategory(String category) {
        Statement s = DbConnect.get();
        if (s == null) return new ArrayList<>();
        try {
            ArrayList<Product> products = new ArrayList<>();
            String query = "SELECT p.*, pr.percent_discount " +
                    "FROM products p " +
                    "LEFT JOIN promotions pr ON p.id_promotion = pr.id_promotion " +
                    "WHERE p.id_category = ( " +
                    "SELECT id_category FROM category_products WHERE name_category = '" + category + "' " +
                    ")";
            ResultSet rs = s.executeQuery(query);
            while (rs.next()) {
                List<ProductImg> listImg = getImagesByProductId(rs.getInt("id_product"));
                Product product = new Product(
                        rs.getInt("id_product"),
                        rs.getString("product_name"),
                        listImg,
                        rs.getDouble("price"),
                        rs.getString("rating"),
                        rs.getDouble("percent_discount")
                );
                product.calculateDiscountedPrice();
                products.add(product);
            }
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    // Lấy danh sách hình ảnh của sản phẩm từ bảng product_images
    private List<ProductImg> getImagesByProductId(int productId) {
        Statement s = DbConnect.get();
        if (s == null) return new ArrayList<>();
        try {
            ArrayList<ProductImg> images = new ArrayList<>();
            ResultSet rs = s.executeQuery("SELECT * FROM product_images WHERE id_product = " + productId);
            while (rs.next()) {
                ProductImg img = new ProductImg(
                        rs.getInt("id_image"),
                        rs.getString("url"),
                        rs.getBoolean("main_image")
                );
                if (img != null) {
                    images.add(img);
                    System.out.println("Found image: " + img.getUrl() + " for product ID: " + productId);
                }
            }
            return images;
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    // Lấy sản phẩm theo ID
    public Product getById(int id) {
        Statement s = DbConnect.get();
        if (s == null) return null;
        try {
            ResultSet rs = s.executeQuery("""
            SELECT p.*, pr.promotion_name, pr.percent_discount
            FROM products p
            LEFT JOIN promotions pr ON p.id_promotion = pr.id_promotion
            WHERE p.id_product = """ + id);
            if (rs.next()) {
                // Lấy danh sách hình ảnh của sản phẩm
                List<ProductImg> listImg = getImagesByProductId(rs.getInt("id_product"));
                System.out.println("Product found: " + rs.getString("product_name"));
                // Trả về sản phẩm
                // Tạo đối tượng sản phẩm
                Product product = new Product(
                        rs.getInt("id_product"),
                        rs.getString("product_name"),
                        listImg,
                        rs.getDouble("price"),
                        rs.getString("rating"),
                        rs.getBoolean("status"),
                        rs.getString("describe_1"),
                        rs.getInt("quantity"),
                        rs.getString("origin"),
                        rs.getString("entry_date"),
                        rs.getString("shelf_life"),
                        rs.getString("warranty_period"),
                        rs.getString("characteristic"),
                        rs.getString("preserve_product"),
                        rs.getString("use_prodcut"),
                        rs.getString("benefit"),
                        rs.getString("promotion_name"),
                        rs.getDouble("percent_discount")
                );

                // Tính giá sau khi giảm
                product.calculateDiscountedPrice();

                // Trả về sản phẩm
                return product;
            } else {
                System.out.println("No product found in database for ID: " + id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDao dao = new ProductDao();
        Product product = dao.getById(1); // ID của sản phẩm cần kiểm tra

        if (product != null) {
            System.out.println("Product details:");
            System.out.println("Name: " + product.getName());
            System.out.println("Original Price: " + product.getPrice());
            System.out.println("Discounted Price: " + product.getDiscountedPrice());
            System.out.println("Promotion: " + product.getPromotionName());
            System.out.println("Discount Percent: " + product.getPercentDiscount());
        } else {
            System.out.println("No product found.");
        }
    }

}
