<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@page import="Bean.userBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String xh = request.getParameter("number");
	String xm = request.getParameter("name");
	String mm = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/computer";
	String user = "root";
	String password = "root";
	conn = DriverManager.getConnection(url,user,password);
	String sql = "update user set name=?,password=? where number=?";
	PreparedStatement pst = conn.prepareStatement(sql);
	pst.setString(1,xm);
	pst.setString(2,mm);
	pst.setString(3,xh);
	pst.executeUpdate();
	pst.close();
	conn.close();
%>
修改成功
<a href="action.jsp">返回</a>