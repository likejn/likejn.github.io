<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@page import="Bean.userBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
	String number = request.getParameter("number");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = null;
	String url = "jdbc:mysql://localhost:3306/computer";
	String user = "root";
	String password = "root";
	conn = DriverManager.getConnection(url,user,password);
	String sql = "delete from user where number=?";
	PreparedStatement pst = conn.prepareStatement(sql);
	pst.setString(1, number);
	pst.executeUpdate();
	pst.close();
	conn.close();
%>
删除成功
<a href="action.jsp">返回</a>