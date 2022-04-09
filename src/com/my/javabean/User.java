package com.my.javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;

import com.my.util.Database;


public class User extends HttpServlet {
	private String username;
	private String password;
	private String user;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public int login() {
		int flag = 0;
		try {
			Connection cn = Database.getConnection();
			String sql = "select username,password from "+ user +" where username=? and password=?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
				flag = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
