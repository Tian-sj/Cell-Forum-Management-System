package com.my.javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;

import com.my.util.Database;

public class DeletePosts extends HttpServlet {
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public int setDelete() {
		int flag = 0;
		try {
			Connection cn = Database.getConnection();
			String sql = "delete from Visible_message where V_id = "+ id +"";
			PreparedStatement ps = cn.prepareStatement(sql);
			flag = ps.executeUpdate();
			sql = "delete from _reply where V_id = "+ id +"";
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
