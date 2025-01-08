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
}
