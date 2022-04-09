package com.my.javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;

import com.my.util.Database;

public class PostsDelete extends HttpServlet {
	private String rid;
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public int delete () {
		int flag = 0;
		try {
			Connection cn = Database.getConnection();
			String sql = "delete from _reply where R_id = ?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, rid);
			flag = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
