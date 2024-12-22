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
        Statement s = DbConnect.get();
        if (s == null) return new ArrayList<>();
        ResultSet rs;
        try {
            ArrayList<Supplier> suppliers = new ArrayList<>();
            rs = s.executeQuery("SELECT * FROM suppliers");
            while (rs.next()) {
                suppliers.add(new Supplier(
                        rs.getInt("id_supplier"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("status"),
                        rs.getDouble("rating")
                ));
            }
            return suppliers;
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public Supplier getSupplierById(int id) {
        Statement s = DbConnect.get();
        if (s == null) return null;
        ResultSet rs;
        try {
            rs = s.executeQuery("SELECT * FROM suppliers WHERE id_supplier = " + id);
            if (rs.next()) {
                return new Supplier(
                        rs.getInt("id_supplier"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("status"),
                        rs.getDouble("rating")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
