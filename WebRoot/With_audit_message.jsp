<%@page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.my.util.Database"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%String username = request.getParameter("username"); %>
<html>
	<head>
		<title>���������</title>
		<link rel="stylesheet" type="text/css" href="CSS/With_audit_message.css">
	</head>
	<body style="background-color: #f1f1f1">
		<div class="kele">
			<a href="OwnersMain.jsp?ss=<%="" %>&username=<%=username %>">����</a>
		</div>
		<div id="main">
			<table width="100%" align="center" class="hovertable">
			<tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
				<th width="70%">����</th>
				<th width="20%">���״̬</th>
				<th width="10%">&nbsp;</th>
			</tr>
			<%
				Connection cn = Database.getConnection();
				String sql = "select W_id,Title,audits from With_audit_message where Posted_by_username = ? and Posted_by_user = 'ҵ��' and audits <> 'ͨ��'";
				PreparedStatement ps = cn.prepareStatement(sql);
				ps.setString(1,username);
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
			 %>
			 <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
			 	<td width="70%" align="center"><%=rs.getString(2) %></td>
			 	<td width="20%" align="center"><%=rs.getString(3) %></td>
			 	<td width="10%" align="center"><a href="DeleteVm.bin?id=<%=rs.getString(1) %>&username=<%=username %>">ɾ��</a></td>
			 </tr>
			 <%} %>
			</table>
		</div>
	</body>
</html>