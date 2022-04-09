package com.my.javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;

import com.my.util.Database;

public class PostingReview extends HttpServlet {
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public int setDatabase_no() {
		int flag = 0;
		try {
			Connection cn = Database.getConnection();
			String sql = "update With_audit_message set audits = '审核没有通过' where W_id = ?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, id);
			flag = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public int setDatabase_yes() {
		int flag = 0;
		try {
			Connection cn = Database.getConnection();
			String sql = "select Title,Content,Posted_by_username,publish_date,Posted_by_user from With_audit_message where W_id = ? ";
			PreparedStatement ps1 = cn.prepareStatement(sql);
			ps1.setString(1, id);
			ResultSet rs = ps1.executeQuery();
			rs.next();
			sql = "insert into Visible_message(Title,Content,Posted_by_username,publish_date,zhiwei) values(?,?,?,?,?)";
			PreparedStatement ps2 = cn.prepareStatement(sql);
			ps2.setString(1,rs.getString(1));
			ps2.setString(2, rs.getString(2));
			ps2.setString(3, rs.getString(3));
			ps2.setString(4, rs.getString(4));
			ps2.setString(5, rs.getString(5));
			flag = ps2.executeUpdate();
			sql = "delete from With_audit_message where W_id = "+id+" ";
			ps1 = cn.prepareStatement(sql);
			ps1.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
