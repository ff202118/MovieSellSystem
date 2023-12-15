/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DBM.DBM;
import bean.Movie;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class Search extends HttpServlet {

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
            String bookname = request.getParameter("bookname");
            System.out.println(bookname);
            String sql = "select * from movie where name='" + bookname + "'";
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(sql);
            HttpSession session = request.getSession();
            String adminflag = (String) session.getAttribute("admin");
            
            if (adminflag.equals("no")) {
                if (rset.next()) {
                    Movie movie = new Movie(rset.getString("name"), rset.getString("direct"), rset.getString("publisher"), rset.getDouble("sellPrice"), rset.getInt("stock"));
                    request.setAttribute("book",movie);
                    RequestDispatcher rd = request.getRequestDispatcher("search.jsp?moviename="+movie.getName()+"");
                    rd.forward(request, response);
                } else {
                    System.out.println("找不到此电影！");
                    request.setAttribute("book", new Movie());
                    RequestDispatcher rd = request.getRequestDispatcher("search.jsp?moviename="+null+"");
                    rd.forward(request, response);
                }
            } else if (adminflag.equals("yes")) {
                if (rset.next()) {
                    Movie movie = new Movie(rset.getString("name"), rset.getString("direct"), rset.getString("publisher"), rset.getDouble("sellPrice"), rset.getDouble("prePrice") ,rset.getInt("stock"));
                    request.setAttribute("book", movie);
                    RequestDispatcher rd = request.getRequestDispatcher("searchadmin.jsp?moviename="+movie.getName()+"");
                    rd.forward(request, response);
                } else {
                    System.out.println("找不到此电影！");
                    request.setAttribute("book", new Movie());
                    session.setAttribute("bkname", "null");
                    RequestDispatcher rd = request.getRequestDispatcher("searchadmin.jsp");
                    rd.forward(request, response);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
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
