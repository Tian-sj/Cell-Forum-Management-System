package com.my.javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;

import com.my.util.Database;

public class AccountUp extends HttpServlet {
	private String username;
	private String password;
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
	public int setDb_O() {
		int flag = 0;
		try {
			Connection cn = Database.getConnection();
			String sql = "update Owners set password = ? where username=?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, username);
			flag = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public int setDb_P() {
		int flag = 0;
		try {
			Connection cn = Database.getConnection();
			String sql = "update Property set password = ? where username=?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, username);
			flag = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}

