package vn.edu.hcmuaf.fit.project_fruit.dao;

import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Supplier;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SupplierDao {
    public List<Supplier> getAll() {
        Statement s = DbConnect.get();  // Lấy kết nối từ DbConnect
        if (s == null) return new ArrayList<>();
        ResultSet rs;
        try {
            ArrayList<Supplier> suppliers = new ArrayList<>();
            // Câu lệnh SQL để lấy tất cả nhà cung cấp từ bảng 'suppliers' và 'category_products'
            String query = """
            SELECT s.id_supplier, s.name, s.address, s.email, s.phone_number, s.status, s.rating, c.name_category
            FROM suppliers s
            LEFT JOIN category_products c ON s.id_category = c.id_category
        """;
            rs = s.executeQuery(query);  // Thực thi câu lệnh SQL và lấy kết quả
            while (rs.next()) {
                // Tạo đối tượng Supplier và thêm vào danh sách, bao gồm cả name_category
                suppliers.add(new Supplier(
                        rs.getInt("id_supplier"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("status"),
                        rs.getDouble("rating"),
                        rs.getString("name_category") // Lấy thêm tên danh mục
                ));
            }
            System.out.println("Number of suppliers: " + suppliers.size());  // Log để kiểm tra số lượng nhà cung cấp
            return suppliers;  // Trả về danh sách nhà cung cấp
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();  // Nếu có lỗi, trả về danh sách trống
        }
    }
    // In ra thông tin của tất cả các nhà cung cấp
    public void printAllSuppliers() {
        List<Supplier> suppliers = getAll();
        for (Supplier supplier : suppliers) {
            System.out.println("Supplier ID: " + supplier.getId_supplier());
            System.out.println("Name: " + supplier.getName());
            System.out.println("Address: " + supplier.getAddress());
            System.out.println("Email: " + supplier.getEmail());
            System.out.println("Phone: " + supplier.getPhone_number());
            System.out.println("Status: " + supplier.getStatus());
            System.out.println("Rating: " + supplier.getRating());
            System.out.println("Category: " + supplier.getName_category());
            System.out.println("------------------------------");
        }
    }

    public static void main(String[] args) {
        SupplierDao supplierDao = new SupplierDao();
        supplierDao.printAllSuppliers();  // In ra tất cả nhà cung cấp
    }
}
