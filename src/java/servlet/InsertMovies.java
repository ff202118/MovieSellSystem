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
@WebServlet(name = "InsertMovies", urlPatterns = {"/InsertMovies"})
public class InsertMovies extends HttpServlet {

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
            String bookname = null;
            String author = null;
            String press = null;
            String sellPrice = null;
            String purchasePrice = null;
            String stock = null;
            
            bookname = request.getParameter("bookname");
            author = request.getParameter("author");
            press = request.getParameter("press");
            sellPrice = request.getParameter("sellPrice");
            purchasePrice = request.getParameter("purchasePrice");
            stock = request.getParameter("stock");
            
            if("".equals(bookname))
                  bookname=null;
            if("".equals(author))
                  author=null;
            if("".equals(press))
                  press=null;
            if("".equals(sellPrice))
                  sellPrice="0";
            if("".equals(purchasePrice))
                 purchasePrice="0";
            if("".equals(stock))
                  stock="0";
            
            
            if(bookname!=null){
                String sql = "insert into movie(name,direct,publisher,sellPrice,prePrice,stock) values ('"+bookname+"','"+author+"','"+press+"',"+sellPrice+","+purchasePrice+","+stock+")";
                Statement stmt = conn.createStatement();
                stmt.executeUpdate(sql);
                out.print("<script> alert(\"成功插入电影信息\");</script>");
                response.setHeader("refresh", "0,url=/MovieSellSystem/GetAllMovies");
            }else{
                out.print("<script> alert(\"电影名不可为空\");</script>");
                 response.setHeader("refresh", "0,url=/MovieSellSystem/GetAllMovies");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DeleteAccount.class.getName()).log(Level.SEVERE, null, ex);
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
