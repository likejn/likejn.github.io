package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.userBean;
import Dao.userDao;

public class login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String xh = req.getParameter("number");
		String mm = req.getParameter("password");
		userDao userdao = new userDao();
		userBean user = userdao.login(xh, mm);
		if(user!=null){
			System.out.println("登录成功");
			req.getRequestDispatcher("action.jsp").forward(req, resp);
		}
		else{
			System.out.println("用户名或密码错误");
			resp.sendRedirect("index.jsp");
		}
	}

}
