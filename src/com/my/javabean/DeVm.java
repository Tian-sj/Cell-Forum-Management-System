package com.my.javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;

import com.my.util.Database;

public class DeVm extends HttpServlet {
	private String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public int delete () {
		int flag = 0;
		try {
			Connection cn = Database.getConnection();
			String sql = "delete from With_audit_message where W_id = ?";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, id);
			flag = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
