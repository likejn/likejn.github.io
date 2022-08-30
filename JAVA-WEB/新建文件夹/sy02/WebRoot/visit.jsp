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
  </head>
  
  <body>
    <table width="300px" border="1px">
		<tr>
			<td>学号</td>
			<td>姓名</td>
			<td>密码</td>
		</tr>
			<%							
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = null;
				String url = "jdbc:mysql://localhost:3306/computer";
				String user = "root";
				String password = "root";
				conn = DriverManager.getConnection(url,user,password);
				String sql = "select number,name,password from user";
				PreparedStatement pst = conn.prepareStatement(sql);
				ResultSet rs = pst.executeQuery();
				List<userBean> data = new ArrayList<userBean>();
				while (rs.next()) {
					data.add(new userBean(rs.getString("number"),rs.getString("name"), rs.getString("password")));
				}
				rs.close();
				pst.close();
				conn.close();
				for (userBean u : data){
			%>
			<tr>
				<td><%=u.getNumber()%></td>
				<td><%=u.getName()%></td>
				<td><%=u.getPassword()%></td>
			</tr>
			<%
				}
			%>
			
	</table>
	<a href="action.jsp">返回</a>
  </body>
</html>
