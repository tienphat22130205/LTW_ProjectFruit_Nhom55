package vn.edu.hcmuaf.fit.project_fruit.dao;

import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Promotions;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PromotionsDao {
    public List<Promotions> getAll() {
        Statement s = DbConnect.get();
        if (s == null) return new ArrayList<>();
        ResultSet rs;
        try {
            ArrayList<Promotions> promotions = new ArrayList<>();
            rs = s.executeQuery("SELECT * FROM promotions");
            while (rs.next()) {
                promotions.add(new Promotions(
                        rs.getInt("id_promotion"),
                        rs.getString("promotion_name"),
                        rs.getString("describe_1"),
                        rs.getString("start_date"),
                        rs.getString("end_date"),
                        rs.getString("percent_discount")
                ));
            }
            return promotions;
        } catch (SQLException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public Promotions getPromotionById(int id) {
        Statement s = DbConnect.get();
        if (s == null) return null;
        ResultSet rs;
        try {
            rs = s.executeQuery("SELECT * FROM promotions WHERE id_promotion = " + id);
            if (rs.next()) {
                return new Promotions(
                        rs.getInt("id_promotion"),
                        rs.getString("promotion_name"),
                        rs.getString("describe_1"),
                        rs.getString("start_date"),
                        rs.getString("end_date"),
                        rs.getString("percent_discount")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
