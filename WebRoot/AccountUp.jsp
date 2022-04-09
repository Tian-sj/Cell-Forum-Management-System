<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="CSS/Account.css">
	</head>
	<body style="background-image: url('images/Account.jpg')"> 
		<div id="main">
			<form action="AccountUp.bin" method="post">
				<input type="hidden" name="username" value=<%=request.getParameter("username") %>>
				<input type="hidden" name="z" value=<%=request.getParameter("z") %>>
				<table align="center" border="1">
					<tr>
						<td>’À∫≈:</td>
						<td><input type="text" class="edit_contain" value=<%=request.getParameter("user") %> readonly="readonly" name="user" ></td>
					</tr>
					<tr>
						<td>√‹¬Î:</td>
						<td><input type="text" class="edit_contain"  placeholder=<%=request.getParameter("pass") %> name="pass"></td>
					</tr>
				</table>
				<input type="submit" value="Ã·Ωª" >
			</form>
		</div>
	</body>
</html>