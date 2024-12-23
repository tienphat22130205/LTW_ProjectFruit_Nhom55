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
    public List<Product> getProductsByCategory(String category) {
        return productDao.getProductsByCategory(category);
    }
}

