package vn.edu.hcmuaf.fit.project_fruit.service;

import vn.edu.hcmuaf.fit.project_fruit.dao.SupplierDao;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Supplier;

import java.util.List;

public class SupplierService {

    private SupplierDao supplierDao = new SupplierDao();

    // Lấy tất cả các nhà cung cấp
    public List<Supplier> getAll() {
        return supplierDao.getAll();
    }
}
