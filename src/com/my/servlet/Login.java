package com.my.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.javabean.User;

public class Login extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("gbk");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String user = request.getParameter("user");
		String ss = request.getParameter("ss");
		User u = new User();
		u.setUsername(username);
		u.setPassword(password);
		u.setUser(user);
		int flag = u.login();
		if(username.equals(""))
			response.sendRedirect("Forum_login.jsp?error=no1");
		else if(password.equals(""))
			response.sendRedirect("Forum_login.jsp?error=no2");
		else if(username.length() > 16)
			response.sendRedirect("Forum_login.jsp?error=no3");
		else if(password.length() > 16)
			response.sendRedirect("Forum_login.jsp?error=no4");
		else {
			if(flag == 1) {
				if(user.equals("Manager")) {
					request.setAttribute(username,"username");
					request.setAttribute(ss,"ss");
					request.getRequestDispatcher("ManagerMain.jsp").forward(request,response);
				}
				else if(user.equals("Property")) {
					request.setAttribute(username,"username");
					request.setAttribute(ss,"ss");
					request.getRequestDispatcher("PropertyMain.jsp").forward(request,response);
				}
				else if(user.equals("Owners")){
					request.setAttribute(username,"username");
					request.setAttribute(ss,"ss");
					request.getRequestDispatcher("OwnersMain.jsp").forward(request,response);
				}
			} else{
				response.sendRedirect("Forum_login.jsp?error=yes");
			}
		}
	}
}
