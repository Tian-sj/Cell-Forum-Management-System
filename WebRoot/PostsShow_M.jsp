<%@page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.my.util.Database"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.my.util.StringEncoder"%>
<html>
	<head>
		<%
			Connection cn = Database.getConnection();
			String sql = "select Title,Posted_by_username,Content from Visible_message where V_id = "+ request.getParameter("id") +"";
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
		 %>
		<title><%=rs.getString(1) %></title>
		<link rel="stylesheet" type="text/css" href="CSS/PostsShow.css">
		<script type="text/javascript">
			function Check()
			{  
			    if ( document.getElementById("C").value=="") 
			    {
			        alert('请输入回复内容!'); 
			        return false;
			    }
				 return true;
			}
		</script>
	</head>
	<body style="background-color: #f1f1f1">
		<div class="kele">
			<a href="ManagerMain.jsp?ss=<%="" %>&username=<%=request.getParameter("username") %>">返回</a>
		</div>
		<div id="main">
			<table width="100%" border="1">
				<tr align="center">
					<td width="20%"><%=rs.getString(2) %></td>
					<td width="80%">
						<input type="text" readonly="true" style="border: 0px; outline:none; width: 100%;font-size: 20px;border: 0; text-align: center"  value=<%=rs.getString(1) %>>
     					<textarea rows="15" cols="95" readonly="true" style="border: 0px; outline:none; font-size: 15px"><%=StringEncoder.inDatabase(rs.getString(3)) %></textarea>
					</td>
				</tr>
			</table>
				<br/><br/><br/>
				<font size="20">回复帖子如下</font>
				<br/><br/><br/>
			<hr/>
			<%
				sql = "select Reply_audit,Reply_by_username,Reply_content,R_id from _reply where V_id = "+ request.getParameter("id") +" order by R_id";
				ps = cn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
			 %>
			<table width="100%" border="1">
				<tr align="center">
					<td width="20%"><%=rs.getString(1)%>:<%=rs.getString(2) %></td>
					<td width="70%">
     					<textarea rows="15" cols="85" readonly="true" style="border: 0px; outline:none; font-size: 15px"><%=StringEncoder.inDatabase(rs.getString(3)) %></textarea>
					</td>
					<td><a href="PostsDelete.bin?id=<%=request.getParameter("id") %>&username=<%=request.getParameter("username") %>&rid=<%=rs.getString(4) %>">删除</a></td>
				</tr>
			</table>
			<%} %>
		</div>
	</body>
</html>