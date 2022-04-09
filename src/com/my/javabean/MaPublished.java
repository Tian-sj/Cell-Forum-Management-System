package com.my.javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;

import com.my.util.Database;
import com.my.util.StringEncoder;

public class MaPublished extends HttpServlet {
	private String title;
	private String content;
	private String username;
	private String user;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = StringEncoder.inTextarea(content);
	}
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
	public int setDatabase() {
		int flag = 0;
		SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
		String nowTime = sdf.format(new Date());
		try {
			Connection cn = Database.getConnection();
			String sql = "insert into Visible_message(Title,Content,Posted_by_username,publish_date,zhiwei) values(?,?,?,?,?)";
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, username);
			ps.setString(4, nowTime);
			ps.setString(5, user);
			flag = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
