package vn.edu.hcmuaf.fit.project_fruit.dao;

import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Supplier;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SupplierDao {

    // Lấy tất cả nhà cung cấp và in ra
    public List<Supplier> getAllSuppliers() {
        PreparedStatement ps = DbConnect.getPreparedStatement("""
            SELECT s.id_supplier, s.name, s.address, s.email, s.phone_number, s.status, s.rating, c.name_category
            FROM suppliers s
            LEFT JOIN category_products c ON s.id_category = c.id_category
            ORDER BY s.id_supplier ASC
        """);

        if (ps == null) return new ArrayList<>();  // Nếu không thể tạo PreparedStatement, trả về danh sách trống

        List<Supplier> suppliers = new ArrayList<>();
        ResultSet rs = null;

        try {
            rs = ps.executeQuery();  // Thực thi câu truy vấn

            // Lặp qua tất cả các bản ghi và thêm vào danh sách
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
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();  // Nếu có lỗi, trả về danh sách trống
        } finally {
            // Đảm bảo đóng ResultSet và PreparedStatement sau khi sử dụng
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return suppliers;  // Trả về danh sách nhà cung cấp
    }

    // Lấy nhà cung cấp theo trang và số bản ghi mỗi trang
    public List<Supplier> getSuppliersByPage(int page, int recordsPerPage) {
        List<Supplier> suppliers = new ArrayList<>();
        String query = """
            SELECT s.id_supplier, s.name, s.address, s.email, s.phone_number, s.status, s.rating, c.name_category
            FROM suppliers s
            LEFT JOIN category_products c ON s.id_category = c.id_category
            ORDER BY s.id_supplier ASC
            LIMIT ?, ?  -- Phân trang
        """;

        try (PreparedStatement ps = DbConnect.getPreparedStatement(query)) {
            ps.setInt(1, (page - 1) * recordsPerPage);  // Tính offset
            ps.setInt(2, recordsPerPage);  // Giới hạn số bản ghi mỗi trang

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                suppliers.add(new Supplier(
                        rs.getInt("id_supplier"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("status"),
                        rs.getDouble("rating"),
                        rs.getString("name_category") // Lấy tên danh mục
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return suppliers;
    }

    // Phương thức lấy tổng số bản ghi để tính số trang
    public int getTotalRecords() {
        String query = "SELECT COUNT(*) FROM suppliers";
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

    // In ra thông tin của tất cả các nhà cung cấp
    public void printAllSuppliers() {
        List<Supplier> suppliers = getAllSuppliers();
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

    // Main để kiểm tra và in ra dữ liệu
    public static void main(String[] args) {
        SupplierDao supplierDao = new SupplierDao();

        // Test phân trang
        int page = 1;
        int recordsPerPage = 25;
        List<Supplier> suppliersPage = supplierDao.getSuppliersByPage(page, recordsPerPage);


        for (Supplier supplier : suppliersPage) {
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

        // Lấy tổng số bản ghi để tính số trang
        int totalRecords = supplierDao.getTotalRecords();
        System.out.println("Total Suppliers: " + totalRecords);
    }
}
