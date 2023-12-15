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


@WebServlet("/RegisterCheck")
public class RegisterCheck extends HttpServlet {

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
			out.print("<script> alert(\"验证码错误！ Code error!\");</script>");
			response.setHeader("refresh", "0,url=/MovieSellSystem/register.jsp");
		}
                // 用户名存在性校验  注册时用户权限为普通用户
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
                        String sql1 = "select name from user where name='" + username + "'";
                        Statement stmt1 = conn.createStatement();
                        ResultSet rset1 = stmt1.executeQuery(sql1);
                        String nameindb = rset1.next() ? rset1.getString(1) : "invalid";
                        if(!nameindb.equals("invalid")){
                            out.print("<script> alert(\"该用户已存在，请重新输入！ \");</script>");
                            response.setHeader("refresh", "0,url=/MovieSellSystem/register.jsp");
                        }else{
                            String sql2 = "INSERT INTO USER(NAME, PASSWORD) VALUE('" + username +"','"+ userpwd +"')";
                            Statement stmt2 = conn.createStatement();
                            stmt2.executeUpdate(sql2);
                            session.setAttribute("username", username);
                            session.setAttribute("admin", "no");
                            out.print("<script> alert(\"成功注册！ \");</script>");
                            response.setHeader("refresh", "0,url=/MovieSellSystem/index.jsp");
                        }
                        dbm.closeConnection();
                    } catch (SQLException ex) {
                        Logger.getLogger(Check.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
