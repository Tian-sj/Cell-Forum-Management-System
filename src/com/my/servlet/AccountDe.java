package com.my.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AccountDe extends HttpServlet {

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
		request.getParameter("gbk");
		String username = request.getParameter("username");
		String user = request.getParameter("user");
		String zhiwei = request.getParameter("zhiwei");
		
		if(zhiwei.equals("w"))
			zhiwei = "物业";
		else if(zhiwei.equals("y"))
			zhiwei = "业主";
		
		com.my.javabean.AccountDe ad = new com.my.javabean.AccountDe();
		ad.setUsername(user);
		ad.setZhiwei(zhiwei);
		
		if(ad.judge() == 0) {
			request.setAttribute(username,"username");
			request.getRequestDispatcher("Account.jsp?error=no").forward(request,response);
		} else if(ad.judge() == 1){
			if(ad.setDelete() > 0) {
				request.setAttribute(username,"username");
				request.getRequestDispatcher("Account.jsp").forward(request,response);
			}
		}
	}

}
