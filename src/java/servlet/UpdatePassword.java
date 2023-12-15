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
@WebServlet(name = "UpdatePassword", urlPatterns = {"/UpdatePassword"})
public class UpdatePassword extends HttpServlet {

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
            String oldpwd = request.getParameter("oldPassword");
            String newpwd = request.getParameter("newPassword");
            String cfmpwd = request.getParameter("confirmPassword");
            if (!newpwd.equals(cfmpwd)) {
                out.print("<script> alert(\"两次密码不一致，请重试！ \");</script>");
                response.setHeader("refresh", "0,url=/MovieSellSystem/profile.jsp");
            } else if (newpwd.equals(cfmpwd) && oldpwd.equals(newpwd)) {
                out.print("<script> alert(\"新密码与原密码一致！ \");</script>");
                response.setHeader("refresh", "0,url=/MovieSellSystem/profile.jsp");
            } else {
                HttpSession session = request.getSession();
                String username = (String) session.getAttribute("username");
                String sql1 = "select password from user where name = '"+ username +"'";
                String sql2 = "UPDATE USER SET PASSWORD = '" + newpwd + "' WHERE NAME = '" + username + "'";
                Statement stmt = conn.createStatement();
                ResultSet rset = stmt.executeQuery(sql1);
                if(rset.next()){
                    String dbpwd = rset.getString("password");
                    System.out.println(dbpwd);
                    if(dbpwd.equals(oldpwd)){
                        stmt.executeUpdate(sql2);
                        out.print("<script> alert(\"成功更改！\");</script>");
                        response.setHeader("refresh", "0,url=/MovieSellSystem/profile.jsp");
                    }else{
                        out.print("<script> alert(\"旧密码输入错误！ \");</script>");
                        response.setHeader("refresh", "0,url=/MovieSellSystem/profile.jsp");
                    }
                }
            }
            dbm.closeConnection();
        } catch (SQLException ex) {
            Logger.getLogger(UpdatePassword.class.getName()).log(Level.SEVERE, null, ex);
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
