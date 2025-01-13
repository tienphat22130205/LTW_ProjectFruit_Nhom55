package vn.edu.hcmuaf.fit.project_fruit.dao;

import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Product;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.ProductImg;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.ProductList;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

    // Lấy toàn bộ danh sách sản phẩm
    public List<Product> getAll() {
        try {
            ArrayList<Product> products = new ArrayList<>();
            String query = """
            SELECT p.*, pr.percent_discount
            FROM products p
            LEFT JOIN promotions pr ON p.id_promotion = pr.id_promotion;
            """;
            PreparedStatement ps = DbConnect.getPreparedStatement(query);
            ResultSet rs = ps.executeQuery();
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
    // Lấy sản phẩm theo danh mục
    public List<Product> getProductsByCategory(int categoryId) {
        try {
            ArrayList<Product> products = new ArrayList<>();
            String query = """
            SELECT p.*, pr.percent_discount 
            FROM products p 
            LEFT JOIN promotions pr ON p.id_promotion = pr.id_promotion 
            WHERE p.id_category = ?
            """;
            PreparedStatement ps = DbConnect.getPreparedStatement(query);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
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
    public List<Product> getProductsByIdRange(int startId, int endId) {
        try {
            ArrayList<Product> products = new ArrayList<>();
            String query = """
            SELECT p.*, pr.percent_discount
            FROM products p
            LEFT JOIN promotions pr ON p.id_promotion = pr.id_promotion
            WHERE p.id_product BETWEEN ? AND ?
            """;
            PreparedStatement ps = DbConnect.getPreparedStatement(query);
            ps.setInt(1, startId);
            ps.setInt(2, endId);
            ResultSet rs = ps.executeQuery();
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
        try {
            ArrayList<ProductImg> images = new ArrayList<>();
            String query = "SELECT * FROM product_images WHERE id_product = ?";
            PreparedStatement ps = DbConnect.getPreparedStatement(query);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
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
    public List<Product> getWeeklyDiscountedProducts() {
        try {
            ArrayList<Product> products = new ArrayList<>();
            String query = """
                    SELECT p.*, pr.percent_discount
                    FROM products p
                    LEFT JOIN promotions pr ON p.id_promotion = pr.id_promotion
                    WHERE pr.start_date <= NOW() AND pr.end_date >= NOW()\s
                    AND pr.type = 'weekly';
        """;
            PreparedStatement ps = DbConnect.getPreparedStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                // Lấy danh sách hình ảnh của sản phẩm
                List<ProductImg> listImg = getImagesByProductId(rs.getInt("id_product"));

                // Tạo đối tượng Product
                Product product = new Product(
                        rs.getInt("id_product"),
                        rs.getString("product_name"),
                        listImg,
                        rs.getDouble("price"),
                        rs.getString("rating"),
                        rs.getDouble("percent_discount")
                );
                product.calculateDiscountedPrice(); // Tính giá sau giảm giá
                products.add(product);
            }
            return products;
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
    public List<Product> searchProductsByName(String keyword) {
        try {
            ArrayList<Product> products = new ArrayList<>();
            String query = """
        SELECT p.*, pr.percent_discount
        FROM products p
        LEFT JOIN promotions pr ON p.id_promotion = pr.id_promotion
        WHERE p.product_name LIKE ?;
        """;
            PreparedStatement ps = DbConnect.getPreparedStatement(query);
            ps.setString(1, "%" + keyword + "%"); // Tìm kiếm với từ khóa có chứa keyword
            ResultSet rs = ps.executeQuery();
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
    // Lấy sản phẩm theo ID
    public Product getById(int id) {
        try {
            String query = """
            SELECT p.*, pr.promotion_name, pr.percent_discount
            FROM products p
            LEFT JOIN promotions pr ON p.id_promotion = pr.id_promotion
            WHERE p.id_product = ?
            """;
            PreparedStatement ps = DbConnect.getPreparedStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                List<ProductImg> listImg = getImagesByProductId(rs.getInt("id_product"));
                System.out.println("Product found: " + rs.getString("product_name"));
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

                product.calculateDiscountedPrice();
                return product;
            } else {
                System.out.println("No product found in database for ID: " + id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Lấy tất cả sản phẩm từ cơ sở dữ liệu
    public List<ProductList> getAllProducts() {
        List<ProductList> productList = new ArrayList<>();
        String query = """
            SELECT p.id_product, p.product_name, p.price, p.origin, p.status, c.name_category 
            FROM products p
            JOIN category_products c ON p.id_category = c.id_category
            ORDER BY p.id_product ASC
        """;

        try (PreparedStatement ps = DbConnect.getPreparedStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductList product = new ProductList(
                        rs.getInt("id_product"),
                        rs.getString("product_name"),
                        rs.getString("name_category"),
                        rs.getDouble("price"),
                        rs.getString("origin"),
                        rs.getBoolean("status")
                );
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    // Phương thức phân trang
    public List<ProductList> getProductsByPage(int page, int recordsPerPage) {
        List<ProductList> productList = new ArrayList<>();
        String query = """
            SELECT p.id_product, p.product_name, p.price, p.origin, p.status, c.name_category 
            FROM products p
            JOIN category_products c ON p.id_category = c.id_category
            ORDER BY p.id_product ASC 
            LIMIT ?, ?
        """;

        try (PreparedStatement ps = DbConnect.getPreparedStatement(query)) {
            ps.setInt(1, (page - 1) * recordsPerPage);  // Tính offset
            ps.setInt(2, recordsPerPage);  // Giới hạn số bản ghi mỗi trang
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductList product = new ProductList(
                        rs.getInt("id_product"),
                        rs.getString("product_name"),
                        rs.getString("name_category"),
                        rs.getDouble("price"),
                        rs.getString("origin"),
                        rs.getBoolean("status")
                );
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }

    // Lấy tổng số sản phẩm để tính số trang
    public int getTotalRecords() {
        String query = "SELECT COUNT(*) FROM products";
        int totalRecords = 0;
        try (PreparedStatement ps = DbConnect.getPreparedStatement(query)) {
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalRecords = rs.getInt(1);  // Lấy giá trị COUNT(*) từ kết quả
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalRecords;
    }

    public static void main(String[] args) {
        ProductDao productDao = new ProductDao();

        // Kiểm tra phương thức lấy tất cả sản phẩm
        List<ProductList> allProducts = productDao.getAllProducts();
        System.out.println("All Products: ");
        for (ProductList productList : allProducts) {
            System.out.println("Product ID: " + productList.getId_product());
            System.out.println("Product Name: " + productList.getName());
            System.out.println("Product Category: " + productList.getCategoryName());
            System.out.println("Product Origin: " + productList.getOrigin());
            System.out.println("Product Price: " + productList.getPrice());
            System.out.println("Product Status: " + (productList.isStatus() ? "Còn Hàng" : "Hết Hàng"));
            System.out.println("--------------------------------------------");
        }
}
}
