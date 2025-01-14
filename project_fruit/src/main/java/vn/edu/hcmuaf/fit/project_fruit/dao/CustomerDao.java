package vn.edu.hcmuaf.fit.project_fruit.dao;
import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDao {

    // Lấy tất cả các khách hàng và in ra
    public List<Customer> getAllCustomers() {
        // Sử dụng getPreparedStatement từ DbConnect để lấy PreparedStatement
        PreparedStatement ps = DbConnect.getPreparedStatement("SELECT c.id_customer, c.customer_name, c.customer_phone, c.address, a.create_date, a.email " +
                "FROM customers c " +
                "JOIN accounts a ON c.id_customer = a.id_customer " +
                "ORDER BY c.id_customer ASC");

        if (ps == null) return new ArrayList<>();  // Nếu không thể tạo PreparedStatement, trả về danh sách trống

        List<Customer> customerList = new ArrayList<>();
        ResultSet rs = null;

        try {
            rs = ps.executeQuery();  // Thực thi câu truy vấn

            // Lặp qua tất cả các bản ghi khách hàng và thêm vào danh sách
            while (rs.next()) {
                // Lấy thông tin khách hàng từ bảng customers và bảng accounts
                Customer customer = new Customer(
                        rs.getInt("id_customer"),
                        rs.getString("customer_name"),  // Lấy tên khách hàng từ bảng accounts
                        rs.getString("customer_phone"),
                        rs.getString("address"),
                        rs.getDate("create_date"),
                        rs.getString("email")
                );
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đảm bảo đóng ResultSet và PreparedStatement sau khi sử dụng
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customerList;  // Trả về danh sách khách hàng
    }

    // Phương thức in ra thông tin tất cả khách hàng
    public void printAllCustomers() {
        // Giả sử getAllCustomers() là phương thức lấy tất cả khách hàng từ cơ sở dữ liệu
        List<Customer> customers = getAllCustomers();

        // Lặp qua danh sách khách hàng và in ra thông tin
        for (Customer customer : customers) {
            System.out.println("Customer ID: " + customer.getIdCustomer());
            System.out.println("Customer Name: " + customer.getCustomerName());
            System.out.println("Customer Phone: " + customer.getCustomerPhone());
            System.out.println("Address: " + customer.getAddress());
            System.out.println("Date Registered: " + customer.getDateRegister());
            System.out.println("Email: " + customer.getEmail());
            System.out.println("------------------------------");
        }
    }

    // Phương thức lấy khách hàng theo trang
    public List<Customer> getCustomersByPage(int page, int recordsPerPage) {
        List<Customer> customerList = new ArrayList<>();
        String query = "SELECT c.id_customer, c.customer_name, c.customer_phone, c.address, a.create_date, a.email " +
                "FROM customers c " +
                "JOIN accounts a ON c.id_customer = a.id_customer " +
                "ORDER BY c.id_customer ASC " +
                "LIMIT ?, ?";  // Phân trang ở đây

        try (PreparedStatement ps = DbConnect.getPreparedStatement(query)) {
            ps.setInt(1, (page - 1) * recordsPerPage);  // Tính offset
            ps.setInt(2, recordsPerPage);  // Giới hạn số bản ghi mỗi trang

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                customerList.add(new Customer(
                        rs.getInt("id_customer"),
                        rs.getString("customer_name"),
                        rs.getString("customer_phone"),
                        rs.getString("address"),
                        rs.getDate("create_date"),
                        rs.getString("email")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    // Phương thức lấy tổng số bản ghi để tính số trang
    public int getTotalRecords() {
        String query = "SELECT COUNT(*) FROM customers";
        int totalRecords = 0;
        try (PreparedStatement ps = DbConnect.getPreparedStatement(query)) { // Sử dụng getPreparedStatement
            ResultSet rs = ps.executeQuery();  // Thực thi câu lệnh SQL
            if (rs.next()) {
                totalRecords = rs.getInt(1);  // Lấy giá trị COUNT(*) từ kết quả
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRecords;
    }
    public Customer getCustomerById(int customerId) {
        String query = "SELECT c.id_customer, c.customer_name, c.customer_phone, c.address, a.email " +
                "FROM customers c " +
                "JOIN accounts a ON c.id_customer = a.id_customer " +
                "WHERE c.id_customer = ?";
        try (PreparedStatement ps = DbConnect.getPreparedStatement(query)) {
            ps.setInt(1, customerId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Customer(
                            rs.getInt("id_customer"),
                            rs.getString("customer_name"),
                            rs.getString("customer_phone"),
                            rs.getString("address"),
                            null, // Không còn sử dụng date_register
                            rs.getString("email")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean updateCustomerDetails(int customerId, String customerName, String customerPhone, String address) {
        String query = "UPDATE customers SET customer_name = ?, customer_phone = ?, address = ? WHERE id_customer = ?";
        try (PreparedStatement ps = DbConnect.getPreparedStatement(query)) {
            ps.setString(1, customerName);
            ps.setString(2, customerPhone);
            ps.setString(3, address);
            ps.setInt(4, customerId);

            return ps.executeUpdate() > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Main để kiểm tra và in ra dữ liệu
    public static void main(String[] args) {
        CustomerDao dao = new CustomerDao();
        dao.printAllCustomers(); // Gọi phương thức để in ra tất cả khách hàng
    }
}
