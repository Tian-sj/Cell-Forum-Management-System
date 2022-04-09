package com.my.javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;

import com.my.util.Database;
import com.my.util.StringEncoder;

public class PostsShow_O extends HttpServlet {
	private String username;
	private String user;
	private String content;
	private String id;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = StringEncoder.inTextarea(content);
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int setDatabase(){
		int flag = 0;
		try {
			Connection cn = Database.getConnection();
			String sql = "insert into _reply(V_id,Reply_by_username,Reply_content,Reply_audit) values(?,?,?,?)";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, username);
			ps.setString(3, content);
			ps.setString(4, user);
			flag = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
