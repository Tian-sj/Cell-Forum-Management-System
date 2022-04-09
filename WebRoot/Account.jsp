<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.my.util.Database"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%
	String username = request.getParameter("username");
 %>
<html>
	<head>
		<title>账号管理</title>
		<link rel="stylesheet" type="text/css" href="CSS/Account.css">
	</head>
	<body style="background-image: url('images/Account.jpg')">
		<div class="kele">
			<a href="ManagerMain.jsp?ss=<%="" %>&username=<%=username %>">返回</a>
		</div>
		<div id="main">
			<form action="AccountDe.bin" method="post">
				<table width="50%" align="center">
					<tr>
						<th colspan="4">物业</th>
					</tr>
					<%
						Connection cn = Database.getConnection();
						String sql = "select username,password from Property";
						PreparedStatement ps = cn.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						while(rs.next()){ 
					 %>
					 <tr>
					 	<td><input type="hidden" value=<%=rs.getString(1) %> name="user"></td>
					 	<td><input type="hidden" value=<%=username %> name="username"></td>
					 	<td><input type="hidden" value="w" name="zhiwei"></td>
					 </tr>
					 <tr>
					 	<td>
					 		账号:<input type="text" class="edit_contain" value=<%=rs.getString(1) %> disabled="disabled">
					 	</td>
					 	<td>
					 		密码:<input type="text" class="edit_contain" value=<%=rs.getString(2) %> disabled="disabled">
					 	</td>
					 	<td>
					 		<input type="button" class="edit_border" value="编辑" onclick="javascript:window.location.href='AccountUp.jsp?username=<%=username %>&user=<%=rs.getString(1) %>&pass=<%=rs.getString(2) %>&z=1'">
					 	</td>
					 	<td>
					 		<input type="submit" class="edit_border" value="删除">
					 	</td>
					 </tr>
					 <%} %>
				</table>
			</form>
			<form action="AccountDe.bin" method="post">
				<table width="50%" align="center">
					<tr>
						<th colspan="4">业主</th>
					</tr>
					<%
						sql = "select username,password from Owners";
						ps = cn.prepareStatement(sql);
						rs = ps.executeQuery();
						while(rs.next()){ 
					 %>
					 <tr>
					 	<td><input type="hidden" value=<%=rs.getString(1) %> name="user"></td>
					 	<td><input type="hidden" value=<%=username %> name="username"></td>
					 	<td><input type="hidden" value="y" name="zhiwei"></td>
					 </tr>
					 <tr>
					 	<td>
					 		账号:<input type="text" class="edit_contain" value=<%=rs.getString(1) %> disabled="disabled">
					 	</td>
					 	<td>
					 		密码:<input type="text" class="edit_contain" value=<%=rs.getString(2) %> disabled="disabled">
					 	</td>
					 	<td>
					 		<input type="button" class="edit_border" value="编辑" onclick="javascript:window.location.href='AccountUp.jsp?username=<%=username %>&user=<%=rs.getString(1) %>&pass=<%=rs.getString(2) %>&z=0'">
					 	</td>
					 	<td>
					 		<input type="submit" class="edit_border" value="删除">
					 	</td>
					 </tr>
					 <%} %>
				</table>
			</form>
		</div>
	</body>
</html>
<script> 
	var errori ='<%=request.getParameter("error")%>';
	if(errori=='no'){
		alert("该账号有帖子存在，请先删除帖子!");
	}
</script>