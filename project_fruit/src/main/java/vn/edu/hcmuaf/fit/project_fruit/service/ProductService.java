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
        ProductDao dao = new ProductDao();

        // ID sản phẩm cần kiểm tra
        int productId = 1;

        // Lấy thông tin chi tiết sản phẩm
        Product product = service.getDetails(productId);
        if (product != null) {
            System.out.println("Product found: " + product.getName());

            // Lấy categoryId từ ProductDao
            int categoryId = dao.getCategoryIdByProductId(productId);
            if (categoryId != -1) {
                // Lấy sản phẩm liên quan
                List<Product> relatedProducts = service.getRelatedProducts(categoryId, productId);

                if (!relatedProducts.isEmpty()) {
                    System.out.println("Related products:");
                    for (Product related : relatedProducts) {
                        System.out.println("- " + related.getName() + " | Price: " + related.getDiscountedPrice());
                    }
                } else {
                    System.out.println("No related products found for product ID " + productId);
                }
            } else {
                System.out.println("Category not found for product ID " + productId);
            }
        } else {
            System.out.println("Product not found with ID " + productId);
        }
    }


}

