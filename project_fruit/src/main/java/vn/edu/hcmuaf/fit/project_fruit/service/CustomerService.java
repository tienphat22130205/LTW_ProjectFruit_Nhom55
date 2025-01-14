package vn.edu.hcmuaf.fit.project_fruit.service;


import vn.edu.hcmuaf.fit.project_fruit.dao.CustomerDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Customer;

import java.util.List;

public class CustomerService {
    private final CustomerDao customerDao = new CustomerDao();

    // Phương thức lấy tất cả khách hàng
    public List<Customer> getAllCustomers() {
        return customerDao.getAllCustomers();  // Gọi phương thức lấy tất cả khách hàng từ CustomerDao
    }

    // Phương thức lấy khách hàng theo trang
    public List<Customer> getCustomersByPage(int page, int recordsPerPage) {
        return customerDao.getCustomersByPage(page, recordsPerPage);  // Gọi phương thức lấy khách hàng theo trang từ CustomerDao
    }

    // Phương thức lấy tổng số bản ghi khách hàng (dùng để tính số trang)
    public int getTotalRecords() {
        return customerDao.getTotalRecords();  // Gọi phương thức lấy tổng số bản ghi từ CustomerDao
    }
    // Lấy khách hàng theo ID
    public Customer getCustomerById(int customerId) {
        return customerDao.getCustomerById(customerId);
    }

    // Cập nhật thông tin khách hàng
    public boolean updateCustomerDetails(int customerId, String customerName, String customerPhone, String address) {
        return customerDao.updateCustomerDetails(customerId, customerName, customerPhone, address);
    }
    public static void main(String[] args) {
        CustomerService customerService = new CustomerService();

        // Test 1: Lấy thông tin khách hàng theo ID
        System.out.println("Test 1: Lấy thông tin khách hàng theo ID");
        int testCustomerId = 1; // Thay bằng ID khách hàng bạn muốn test
        Customer customer = customerService.getCustomerById(testCustomerId);
        if (customer != null) {
            System.out.println("Thông tin khách hàng:");
            System.out.println("ID: " + customer.getIdCustomer());
            System.out.println("Tên: " + customer.getCustomerName());
            System.out.println("Số điện thoại: " + customer.getCustomerPhone());
            System.out.println("Địa chỉ: " + customer.getAddress());
            System.out.println("Email: " + customer.getEmail());
        } else {
            System.out.println("Không tìm thấy khách hàng với ID: " + testCustomerId);
        }

//        // Test 2: Cập nhật thông tin khách hàng
//        System.out.println("\nTest 2: Cập nhật thông tin khách hàng");
//        int updateCustomerId = 1; // Thay bằng ID khách hàng bạn muốn cập nhật
//        String newName = "Nguyễn Văn B";
//        String newPhone = "0901234567";
//        String newAddress = "123 Đường ABC";
//
//        boolean isUpdated = customerService.updateCustomerDetails(updateCustomerId, newName, newPhone, newAddress);
//        if (isUpdated) {
//            System.out.println("Cập nhật thành công. Thông tin sau khi cập nhật:");
//            Customer updatedCustomer = customerService.getCustomerById(updateCustomerId);
//            if (updatedCustomer != null) {
//                System.out.println("ID: " + updatedCustomer.getIdCustomer());
//                System.out.println("Tên: " + updatedCustomer.getCustomerName());
//                System.out.println("Số điện thoại: " + updatedCustomer.getCustomerPhone());
//                System.out.println("Địa chỉ: " + updatedCustomer.getAddress());
//                System.out.println("Ngày đăng ký: " + updatedCustomer.getDateRegister());
//                System.out.println("Email: " + updatedCustomer.getEmail());
//            }
//        } else {
//            System.out.println("Cập nhật thất bại cho ID: " + updateCustomerId);
//        }
    }

}
