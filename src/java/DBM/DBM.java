/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBM;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lenovo
 */
public class DBM {

    private static final String JDBCURL = "jdbc:mysql://localhost:3306/mydb?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWORD = "fjq159357";
    private static Connection conn;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBM.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static Connection getConnection(){
        return conn;
    }
    public static void openConnection() throws SQLException {
        if (conn == null) {
            conn = DriverManager.getConnection(JDBCURL, USER, PASSWORD);
        }
    }

    public static void closeConnection() throws SQLException {
        if (conn != null) {
            conn.close();
            conn = null;
        }
    }

    public static PreparedStatement prepareStatement(String sql)
            throws SQLException {
        openConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        return pstmt;
    }

    public static void setParameters(PreparedStatement pstmt, Object... params)
            throws SQLException {
        for (int i = 0; i < params.length; i++) {
            Object param = params[i];
            if (param == null) {
                pstmt.setNull(i + 1, Types.NULL);
            } else if (param instanceof Boolean) {
                pstmt.setBoolean(i + 1, (boolean) param);
            } else if (param instanceof Integer) {
                pstmt.setInt(i + 1, (int) param);
            } else if (param instanceof Double) {
                pstmt.setDouble(i + 1, (double) param);
            } else if (param instanceof String) {
                pstmt.setString(i + 1, (String) param);
            } else {
                pstmt.setObject(i + 1, Types.OTHER);
            } //可以根据需要继续添加其他类型……
        }
    }

    //执行更新
    public static int executeUpdate(String sql, Object... params) throws SQLException {
        PreparedStatement pstmt = prepareStatement(sql);
        setParameters(pstmt, params);
        return pstmt.executeUpdate();
    }

    //执行查询
    public static ResultSet executeQuery(String sql, Object... params)
            throws SQLException {
        PreparedStatement pstmt = prepareStatement(sql);
        setParameters(pstmt, params);
        return pstmt.executeQuery();
    }
}