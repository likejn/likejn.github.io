<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@page import="Bean.userBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
  		String number = request.getParameter("number");
  		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		String url = "jdbc:mysql://localhost:3306/computer";
		String user = "root";
		String password = "root";
		conn = DriverManager.getConnection(url,user,password);
		String sql = "select number,name,password from user where number=?";
		if(conn!=null){
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1,number);
			ResultSet rs = pst.executeQuery();
			userBean u = new userBean();
				if(rs.next()){
					u.setNumber(rs.getString("number"));
					u.setName(rs.getString("name"));
					u.setPassword(rs.getString("password"));
				}
			rs.close();
			pst.close();
			conn.close();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<Script Language="JavaScript">
    function modi()
    {
    document.sform.action="modify.jsp?number=<%= u.getNumber()%>";
    }
    
    function dele()
    {
    document.sform.action="delete.jsp?number=<%= u.getNumber()%>";
    }
    </Script>
  </head>
  
  <body>
	<form name="sform">
		<table width="200px" border="1px">
			<tr>
				<td>学号</td>
				<td><input type="text" name="number" value="<%= u.getNumber()%>"></td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><input type="text" name="name" value="<%= u.getName()%>"></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="text" name="password" value="<%= u.getPassword()%>"></td>
			</tr>
			<tr>
				<td><input type="submit" value="修改" onClick="modi()"></td>
				<td><input type="submit" value="删除" onClick="dele()"></td>
			</tr>
		</table>			
	</form>	
<a href="action.jsp">返回</a>
  </body>
</html>
<%
	} 
%>

