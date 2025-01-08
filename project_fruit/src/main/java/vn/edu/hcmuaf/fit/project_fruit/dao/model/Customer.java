package vn.edu.hcmuaf.fit.project_fruit.dao.model;

import java.util.Date;

public class Customer {
    private int idCustomer;
    private String customerName;
    private String customerPhone;
    private String address;
    private Date dateRegister;
    private String email;

    // Constructor, getters and setters
    public Customer(int idCustomer, String customerName, String customerPhone, String address, Date dateRegister, String email) {
        this.idCustomer = idCustomer;
        this.customerName = customerName;
        this.customerPhone = customerPhone;
        this.address = address;
        this.dateRegister = dateRegister;
        this.email = email;
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDateRegister() {
        return dateRegister;
    }

    public void setDateRegister(Date dateRegister) {
        this.dateRegister = dateRegister;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "idCustomer=" + idCustomer +
                ", customerName='" + customerName + '\'' +
                ", customerPhone='" + customerPhone + '\'' +
                ", address='" + address + '\'' +
                ", dateRegister=" + dateRegister +
                ", email='" + email + '\'' +
                '}';
    }
}