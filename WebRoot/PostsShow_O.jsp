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
			<a href="OwnersMain.jsp?ss=<%="" %>&username=<%=request.getParameter("username") %>">返回</a>
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
				<font size="20"><a href="#hf">回复</a></font>
				<br/><br/><br/>
			<hr/>
			<%
				sql = "select Reply_audit,Reply_by_username,Reply_content from _reply where V_id = "+ request.getParameter("id") +" order by R_id";
				ps = cn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
			 %>
			<table width="100%" border="1">
				<tr align="center">
					<td width="20%"><%=rs.getString(1)%>:<%=rs.getString(2) %></td>
					<td width="80%">
     					<textarea rows="15" cols="95" readonly="true" style="border: 0px; outline:none; font-size: 15px"><%=StringEncoder.inDatabase(rs.getString(3)) %></textarea>
					</td>
				</tr>
			</table>
			<%} %>
			<div style="background-image:url('images/form.jpg');">
				<form action="PostsShow_O.bin" method="post" onsubmit="return Check();">
					<input type="hidden" name = "username" value=<%=request.getParameter("username") %>>
					<input type="hidden" name = "user" value="业主">
					<input type="hidden" name = "id" value=<%=request.getParameter("id") %>>
					<br/>
					<div id = "hf"></div>
					<br/><br/>
					<textarea rows="15" cols="85" name="content" style="background-color: #eeeeee; border: 0; font-size: 20px" id="C"></textarea><br/><br/>
					<input style="background-image:url('images/submit.jpg'); cursor: pointer; width: 85px; height: 35px; border: 0;" type="submit" value=" ">
			</form>
			</div>
		</div>
	</body>
</html>