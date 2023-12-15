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


@WebServlet("/Check")
public class Check extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
                System.out.println(code);
		HttpSession session = request.getSession();
		String randStr = (String)session.getAttribute("randStr");
                response.setContentType("text/html; charset=utf-8");
                response.setCharacterEncoding("utf-8");
                PrintWriter out = response.getWriter();
                // 验证码校验
		if(!code.equals(randStr)) {
			System.out.println("code.equals(randStr)");
			out.print("<script> alert(\"验证码错误！\");</script>");
			response.setHeader("refresh", "0,url=/MovieSellSystem/login.jsp");
		}
                // 用户名及密码校验
                else{
                    try {
//                        Class.forName("com.mysql.jdbc.Driver");
//                        String jdbc_url = "jdbc:mysql://localhost:3306/mydb?useUnicode=true&characterEncoding=UTF-8";
//                        String myuser = "root";
//                        String password = "fjq159357";
//                        Connection conn = DriverManager.getConnection(jdbc_url, myuser, password);
                        
                        DBM dbm = null;
                        dbm.openConnection();
                        Connection conn =  dbm.getConnection();
            
                        String username = request.getParameter("username");
                        String userpwd = request.getParameter("password");
                        String sql = "select authority from user where name='" + username + "' and password='" + userpwd + "'";
                        Statement stmt = conn.createStatement();
                        ResultSet rset = stmt.executeQuery(sql);
                        int authority = rset.next() ? rset.getInt(1) : -1;
                        dbm.closeConnection();
                        if(authority == -1){      // 用户名或密码错误
                            out.print("<script> alert(\"用户名或密码错误！\");</script>");
                            response.setHeader("refresh", "0,url=/MovieSellSystem/login.jsp");
                        }else if(authority == 0){ // 普通用户 index.jsp
                            session.setAttribute("username", username);
                            session.setAttribute("admin", "no");
                            response.sendRedirect("AllMovies");   
                        }else if(authority == 1){ // 管理员 indexadmin.jsp
                            session.setAttribute("username", username);
                            session.setAttribute("admin", "yes");
                            response.sendRedirect("AllMovies");
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(Check.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
