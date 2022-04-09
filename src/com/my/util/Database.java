package com.my.util;
import java.sql.*;


public class Database {
	public static Connection getConnection()
	{
		Connection cn = null;
		try
		{
			Class.forName("org.gjt.mm.mysql.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Forum","root","123456");		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cn;
	}
}
