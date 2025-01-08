package vn.edu.hcmuaf.fit.project_fruit.dao.db;

import java.sql.*;

public class DbConnect {
    static String url = "jdbc:mysql://" + DbProperties.host() + ":"+ DbProperties.port() + "/" + DbProperties.dbname() + "?" + DbProperties.option();
    static Connection conn;

    public static Statement get(){
        try {
            if (conn == null || conn .isClosed()){
                makeConnect();
            }
            return conn.createStatement();
        } catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
            return null;
        }
    }
    // Trả về đối tượng PreparedStatement
    public static PreparedStatement getPreparedStatement(String query) {
        try {
            if (conn == null || conn.isClosed()) {
                makeConnect();
            }
            return conn.prepareStatement(query);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    private static void makeConnect() throws ClassNotFoundException , SQLException{
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, DbProperties.username(), DbProperties.password());
    }
}
