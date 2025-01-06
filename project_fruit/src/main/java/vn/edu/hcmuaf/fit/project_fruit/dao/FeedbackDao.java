package vn.edu.hcmuaf.fit.project_fruit.dao;
import vn.edu.hcmuaf.fit.project_fruit.dao.db.DbConnect;
import vn.edu.hcmuaf.fit.project_fruit.dao.model.Feedback;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDao {

    // Lấy tất cả các phản hồi và in ra
    public List<Feedback> getAllFeedback() {
        // Sử dụng getPreparedStatement từ DbConnect để lấy PreparedStatement
        PreparedStatement ps = DbConnect.getPreparedStatement("SELECT f.id_feedback, f.id_account, f.content, f.date_create, f.rating, " +
                "a.cus_name, p.product_name " +
                "FROM feedbacks f " +
                "JOIN accounts a ON f.id_account = a.id_account " +
                "JOIN products p ON f.id_product = p.id_product");

        if (ps == null) return new ArrayList<>();  // Nếu không thể tạo PreparedStatement, trả về danh sách trống

        List<Feedback> feedbackList = new ArrayList<>();
        ResultSet rs = null;

        try {
            rs = ps.executeQuery();  // Thực thi câu truy vấn

            // Lặp qua tất cả các bản ghi phản hồi và thêm vào danh sách
            while (rs.next()) {
                // Lấy thông tin phản hồi và tên khách hàng
                Feedback feedback = new Feedback(
                        rs.getInt("id_feedback"),
                        rs.getString("product_name"),  // Lấy tên sản phẩm
                        rs.getString("cus_name"),  // Thay thế id_account bằng cus_name
                        rs.getString("content"),
                        rs.getString("date_create"),
                        rs.getDouble("rating")
                );
                feedbackList.add(feedback);
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
        return feedbackList;  // Trả về danh sách phản hồi
    }

    public void printAllFeedback() {
        // Giả sử getAllFeedback() là phương thức lấy tất cả phản hồi từ cơ sở dữ liệu
        List<Feedback> feedbacks = getAllFeedback();

        // Lặp qua danh sách phản hồi và in ra thông tin
        for (Feedback feedback : feedbacks) {
            System.out.println("Feedback ID: " + feedback.getIdFeedback());
            System.out.println("Product Name: " + feedback.getProductName());
            System.out.println("Customer Name: " + feedback.getCusName());
            System.out.println("Content: " + feedback.getContent());
            System.out.println("Date Created: " + feedback.getDateCreate());
            System.out.println("Rating: " + feedback.getRating());
            System.out.println("------------------------------");
        }
    }

    // Main để kiểm tra và in ra dữ liệu
    public static void main(String[] args) {
        FeedbackDao dao = new FeedbackDao();
        dao.printAllFeedback(); // Gọi phương thức để in ra tất cả phản hồi
    }
}
