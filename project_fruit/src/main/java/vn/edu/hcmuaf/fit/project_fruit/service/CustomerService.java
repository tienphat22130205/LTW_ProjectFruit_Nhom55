package vn.edu.hcmuaf.fit.project_fruit.service;


import vn.edu.hcmuaf.fit.project_fruit.dao.CustomerDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Customer;

import java.util.List;

public class CustomerService {
    private final CustomerDao customerDao = new CustomerDao();

    // Lấy tất cả khách hàng
    public List<Customer> getAllCustomers() {
        return customerDao.getAllCustomers();
    }

    // In ra thông tin tất cả khách hàng
    public void printAllCustomers() {
        customerDao.printAllCustomers();
    }

    // Lấy danh sách khách hàng theo phân trang
    public List<Customer> getCustomersByPage(int page, int recordsPerPage) {
        return customerDao.getCustomersByPage(page, recordsPerPage);
    }

    // Lấy tổng số bản ghi khách hàng
    public int getTotalRecords() {
        return customerDao.getTotalRecords();
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

        // Test 1: Lấy tất cả khách hàng
        System.out.println("Test 1: Lấy tất cả khách hàng");
        List<Customer> allCustomers = customerService.getAllCustomers();
        if (allCustomers != null && !allCustomers.isEmpty()) {
            System.out.println("Danh sách khách hàng:");
            for (Customer customer : allCustomers) {
                System.out.println("ID: " + customer.getIdCustomer());
                System.out.println("Tên: " + customer.getCustomerName());
                System.out.println("Số điện thoại: " + customer.getCustomerPhone());
                System.out.println("Địa chỉ: " + customer.getAddress());
                System.out.println("Email: " + customer.getEmail());
                System.out.println("----------------------------");
            }
        } else {
            System.out.println("Không có khách hàng nào.");
        }

        // Test 2: In ra thông tin tất cả khách hàng
        System.out.println("\nTest 2: In ra thông tin tất cả khách hàng");
        customerService.printAllCustomers();

        // Test 3: Lấy danh sách khách hàng theo phân trang
        System.out.println("\nTest 3: Lấy danh sách khách hàng theo phân trang");
        int page = 1; // Trang cần lấy
        int recordsPerPage = 2; // Số khách hàng mỗi trang
        List<Customer> paginatedCustomers = customerService.getCustomersByPage(page, recordsPerPage);
        if (paginatedCustomers != null && !paginatedCustomers.isEmpty()) {
            System.out.println("Danh sách khách hàng ở trang " + page + ":");
            for (Customer customer : paginatedCustomers) {
                System.out.println("ID: " + customer.getIdCustomer());
                System.out.println("Tên: " + customer.getCustomerName());
                System.out.println("Số điện thoại: " + customer.getCustomerPhone());
                System.out.println("Địa chỉ: " + customer.getAddress());
                System.out.println("Email: " + customer.getEmail());
                System.out.println("----------------------------");
            }
        } else {
            System.out.println("Không có khách hàng nào ở trang " + page + ".");
        }

        // Test 4: Lấy tổng số bản ghi khách hàng
        System.out.println("\nTest 4: Lấy tổng số bản ghi khách hàng");
        int totalRecords = customerService.getTotalRecords();
        System.out.println("Tổng số bản ghi khách hàng: " + totalRecords);
    }


}
