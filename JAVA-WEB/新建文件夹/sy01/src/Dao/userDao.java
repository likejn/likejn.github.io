package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Bean.userBean;
import Utils.utils;

public class userDao {
	
	Connection conn = null;
	PreparedStatement pst = null;
	
	public void addUser(userBean user){
        try{
        	conn = utils.getConnection();
        	String sql = "insert into user(number,name,password) values (?,?,?)";
        	pst = conn.prepareStatement(sql);
        	pst.setString(1, user.getNumber());
        	pst.setString(2, user.getName());
        	pst.setString(3, user.getPassword());
        	pst.executeUpdate();
        }catch(SQLException e){
        	e.printStackTrace();
        }finally{
        	utils.close(conn);
        }
	}
	
}
