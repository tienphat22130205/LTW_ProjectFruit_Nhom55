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
    public List<Product> getRelatedProducts(int categoryId, int excludeProductId) {
        return productDao.getRelatedProducts(categoryId, excludeProductId);
    }
    public static void main(String[] args) {
        ProductService service = new ProductService();

        // ID của sản phẩm hiện tại (giả sử bạn muốn kiểm tra sản phẩm có ID = 1)
        int currentProductId = 1;

        // Lấy chi tiết sản phẩm để lấy `categoryId`
        Product currentProduct = service.getDetails(currentProductId);

        if (currentProduct != null) {
            // Lấy `categoryId` từ sản phẩm hiện tại
            int categoryId = currentProduct.getCategoryId();

            // Lấy danh sách sản phẩm liên quan
            List<Product> relatedProducts = service.getRelatedProducts(categoryId, currentProductId);

            // Kiểm tra và in danh sách sản phẩm liên quan
            if (relatedProducts != null && !relatedProducts.isEmpty()) {
                System.out.println("Related products for product ID " + currentProductId + ":");
                for (Product product : relatedProducts) {
                    System.out.println("ID: " + product.getId_product() +
                            ", Name: " + product.getName() +
                            ", Price: " + product.getPrice() +
                            ", Discounted Price: " + product.getDiscountedPrice() +
                            ", Category ID: " + product.getCategoryId());
                }
            } else {
                System.out.println("No related products found for product ID " + currentProductId);
            }
        } else {
            System.out.println("Product with ID " + currentProductId + " not found.");
        }
    }


}

