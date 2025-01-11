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
    public static void main(String[] args) {
        ProductService service = new ProductService();

        List<Product> weeklyDiscountedProducts = service.getWeeklyDiscountedProducts();
        if (weeklyDiscountedProducts != null && !weeklyDiscountedProducts.isEmpty()) {
            System.out.println("Weekly Discounted Products:");
            for (Product product : weeklyDiscountedProducts) {
                System.out.println("ID: " + product.getId_product() + // Hoặc getId()
                        ", Name: " + product.getName() +
                        ", Price: " + product.getPrice() +
                        ", Discounted Price: " + product.getDiscountedPrice());
            }
        } else {
            System.out.println("No weekly discounted products found.");
        }
    }

}

