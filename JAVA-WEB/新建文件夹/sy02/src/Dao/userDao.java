package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import Bean.userBean;
import Utils.utils;

public class userDao {
	
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	public boolean findUser(userBean user){
        try{
        	conn = utils.getConnection();
        	String sql = "select * from user where number='"+user.getNumber()+"'";
        	pst = conn.prepareStatement(sql);
//        	pst.setString(1, user.getNumber());
        	rs = pst.executeQuery();
        	if(rs.next()){
        		System.out.println("用户已注册");
        		conn.close();
        		return false;
        	}
        }catch(SQLException e){
        	e.printStackTrace();
        }finally{
        	utils.close(conn);
        }
		return true;
	}
	
	public void addUser(userBean user){
        try{
        	conn = utils.getConnection();
        	String sql = "insert into user(number,name,password) values (?,?,?)";
        	pst = conn.prepareStatement(sql);
        	pst.setString(1, user.getNumber());
        	pst.setString(2, user.getName());
        	pst.setString(3, user.getPassword());
        	pst.executeUpdate();
        	System.out.println("注册成功");
        }catch(SQLException e){
        	e.printStackTrace();
        }finally{
        	utils.close(conn);
        }
	}
	
	public userBean login(String number, String password){
        userBean u = null;
        try {
            conn = utils.getConnection();
            String sql = "select * from user where number=? and password=?";
            pst = conn.prepareStatement(sql);
            pst.setString(1,number);
            pst.setString(2,password);
            rs = pst.executeQuery();
            if(rs.next()){
            	u = new userBean();
                u.setNumber(rs.getString("number"));
                u.setPassword(rs.getString("password"));
            }
        }catch(SQLException e){
        	e.printStackTrace();
        }finally{
        	utils.close(conn);
        }
            return u;
    }
	
}
