package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.userBean;
import Dao.userDao;

public class register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String xh = req.getParameter("number");
		String xm = req.getParameter("name");
		String mm = req.getParameter("password");
		userBean user = new userBean();
		user.setNumber(xh);
		user.setName(xm);
		user.setPassword(mm);
		userDao userdao = new userDao();
		if(userdao.findUser(user)==false){
			resp.sendRedirect("fail.jsp");
		}
		else{
			userdao.addUser(user);
			req.getRequestDispatcher("succ.jsp").forward(req, resp);
		}
	}

}
