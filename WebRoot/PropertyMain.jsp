<%@page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.my.util.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<html>
	<head>
		<title>��̳��ҳ</title>
		<link rel="stylesheet" type="text/css" href="CSS/OwnerMain.css">
		<script type="text/javascript">
			var a = <%=request.getParameter("username")%>;
			if(a = 'null')
				window.location.href="Forum_login.jsp";
		</script>
	</head>
	<body style="background-color: #f1f1f1">
		<div id="ct"></div>
	    <form action="PropertyMainSS.bin" method="post">
	    	<input type="hidden" name = "username" value=<%=request.getParameter("username") %>>
	    	<table align="center">
	    	<tr>
	    		<td width="60%">
	    			<input type="text" id="text" name="ss" placeholder="��������">
	    		</td>
	    		<td width="10%">
	    			<input type="submit" class="button" value="����">
	    		</td>
	    	</tr>
	    </table>	
	    </form>
		<div id="main">
			<div id="background"></div>
			<ul id="menu">
				<li><a href="#ct">����</a></li>
				<li style="float: right"><a class="active" href="Forum_login.jsp">��ҵ:<%=request.getParameter("username")%>&nbsp;�˳���¼</a></li>
			</ul>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
			<table width="100%">
				<tr>
					<th width="10%">����ʱ��</th>
					<th width="80%">����</th>
					<th width="10%">�û�</th>
				</tr>
			</table>
			
			<% 
				String ss = request.getParameter("ss");
				Connection cn = Database.getConnection();
				String sql = "select publish_date,Title,zhiwei,substring(Content,1,10),Posted_by_username,V_id from Visible_message where Title like '%"+ss+"%' order by publish_date desc";
				PreparedStatement ps = cn.prepareStatement(sql); 
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
			%>
			<table width="100%">
				<tr>
					<td align="center" width="10%" rowspan="2"><%=rs.getString(1) %></td>
					<td width="10%" rowspan="2">&nbsp;</td>
					<td width="70%"><a href="PostsShow_P.jsp?id=<%=rs.getString(6) %>&username=<%=request.getParameter("username")%>&ss=<%=ss %>"><%=rs.getString(2) %></a></td>
					<td align="center"  width="10%"><%=rs.getString(3) %></td>
				</tr>
				<tr>
					<td width="70%"><%=rs.getString(4) %></td>
					<td align="center" width="10%"><%=rs.getString(5) %></td>
				</tr>
			</table>
			<hr/>
			<%} %>
		</div>
	</body>
</html>