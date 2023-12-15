/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DBM.DBM;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "UpdateUserInfo", urlPatterns = {"/UpdateUserInfo"})
public class UpdateUserInfo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            Class.forName("com.mysql.jdbc.Driver");
//            String jdbc_url = "jdbc:mysql://localhost:3306/mydb?useUnicode=true&characterEncoding=UTF-8";
//            String myuser = "root";
//            String password = "fjq159357";
//            Connection conn = DriverManager.getConnection(jdbc_url, myuser, password);
            DBM dbm = null;
            dbm.openConnection();
            Connection conn =  dbm.getConnection();
            
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            String udname = request.getParameter("username");
            String udphone = request.getParameter("phone");
            String udemail = request.getParameter("email");
            String sql1 = "select id from user where name = '"+ username +"'";
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(sql1);
            String id = rset.next()? rset.getString("id"): "0";
            String sql2 = "select count(name) from user where name = '"+ udname +"'";
            rset = stmt.executeQuery(sql2);
            if(rset.next()){
                int cnt = rset.getInt(1);
                if(cnt==1 && username.equals(udname) || cnt==0 && !username.equals(udname)){
                    String sql3 = "update user set name = '" + udname + "',phone = '" + udphone + "',email = '" + udemail + "' where id = " + id;
                    stmt.executeUpdate(sql3);
                    out.print("<script> alert(\"成功更新你的个人信息，请重新登录！\");</script>");
                    response.setHeader("refresh", "0,url=/MovieSellSystem/login.jsp");
                }else{
                    out.print("<script> alert(\"用户名已存在！\");</script>");
                    response.setHeader("refresh", "0,url=/MovieSellSystem/profile.jsp");
                }
            }
            dbm.closeConnection();;
        } catch (SQLException  ex) {
            Logger.getLogger(UpdateUserInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
