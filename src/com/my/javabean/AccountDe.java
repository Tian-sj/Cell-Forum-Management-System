package com.my.javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;

import com.my.util.Database;

public class AccountDe extends HttpServlet {
	private String username;
	private String zhiwei;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getZhiwei() {
		return zhiwei;
	}
	public void setZhiwei(String zhiwei) {
		this.zhiwei = zhiwei;
	}
	public int judge() {
		int flag = 0;
		try {
			Connection cn = Database.getConnection();
			String sql = "select V_id from Visible_message where Posted_by_username = ? and zhiwei = ?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, zhiwei);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				flag = 0;
			} else 
				flag = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public int setDelete() {
		int flag = 0;
		try {
			Connection cn = Database.getConnection();
			if(zhiwei.equals("业主")) {
				String sql = "delete from Owners where username=?";
				PreparedStatement ps = cn.prepareStatement(sql);
				ps.setString(1, username);
				flag = ps.executeUpdate();
			} else if(zhiwei.equals("物业")){
				String sql = "delete from Property where username=?";
				PreparedStatement ps = cn.prepareStatement(sql);
				ps.setString(1, username);
				flag = ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
