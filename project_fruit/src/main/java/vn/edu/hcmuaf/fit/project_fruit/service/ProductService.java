package vn.edu.hcmuaf.fit.project_fruit.service;

import vn.edu.hcmuaf.fit.project_fruit.dao.ProductDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Product;

import java.util.List;

public class ProductService {
    ProductDao productDao = new ProductDao();
    public List<Product> getAll(){
        return productDao.getAll();
    }
    public Product getDetails(int id) {
        ProductDao productDao = new ProductDao();
        return productDao.getById(id);
    }
    // Lấy sản phẩm theo danh mục
    public List<Product> getProductsByCategory(int categoryId) {
        return productDao.getProductsByCategory(categoryId); // Lấy sản phẩm theo danh mục
    }
    // Lấy sản phẩm theo khoảng id
    public List<Product> getProductsByIdRange(int startId, int endId) {
        return productDao.getProductsByIdRange(startId, endId);
    }
    // Thêm phương thức mới: Lấy sản phẩm ưu đãi trong tuần
    public List<Product> getWeeklyDiscountedProducts() {
        return productDao.getWeeklyDiscountedProducts();
    }
    public List<Product> searchProducts(String keyword) {
        return productDao.searchProductsByName(keyword);
    }
    public static void main(String[] args) {
        ProductService service = new ProductService();

        // Từ khóa cần tìm kiếm
        String keyword = "Cam";

        // Gọi phương thức searchProducts và nhận danh sách kết quả
        List<Product> searchResults = service.searchProducts(keyword);

        // In ra kết quả tìm kiếm
        if (searchResults != null && !searchResults.isEmpty()) {
            System.out.println("Search Results for keyword '" + keyword + "':");
            for (Product product : searchResults) {
                System.out.println("ID: " + product.getId_product() +
                        ", Name: " + product.getName() +
                        ", Price: " + product.getPrice() +
                        ", Discounted Price: " + product.getDiscountedPrice());
            }
        } else {
            System.out.println("No products found for keyword '" + keyword + "'.");
        }
    }

}

