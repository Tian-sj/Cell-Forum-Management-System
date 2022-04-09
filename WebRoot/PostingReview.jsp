<%@page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.my.util.Database"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.my.util.StringEncoder"%>
<%String username =  request.getParameter("username");%>
<html>
	<head>
		<title>发帖审核</title>
		<link rel="stylesheet" type="text/css" href="CSS/PostingReview.css">
	</head>
<body style="background-color: #f1f1f1">
	<div class="kele">
		<a href="ManagerMain.jsp?ss=<%="" %>&username=<%=username %>">返回</a>
	</div>
	<div id="main">
		<%
    	Connection cn = Database.getConnection();
    	String sql = "select Title,Content,Posted_by_username,W_id from With_audit_message where audits = '待审核' order by W_id desc";
    	PreparedStatement ps = cn.prepareStatement(sql);
    	ResultSet rs = ps.executeQuery();
    	if(rs.isBeforeFirst()){
    	while(rs.next()){
     	%>
     	<table width="100%">
     		<tr>
     			<td width="10"><%=rs.getString(3) %></td>
     			<td width="60%">
     				<input type="text" readonly="true" style="border: 0px; outline:none; width: 100%;font-size: 20px;border: 0;background-color: #eeeeee; text-align: center"  value=<%=rs.getString(1) %>>
     				<textarea rows="15" cols="85" readonly="true" style="background-color: #eeeeee; border: 0px; outline:none; font-size: 15px"><%=StringEncoder.inDatabase(rs.getString(2)) %></textarea>
     			</td>
     			<td width="30%">
     				<table align="center">
     					<tr>
     						<td><a href="PostingReview.bin?judge=yes&id=<%=rs.getString(4) %>&username=<%=username %>"><img src="images/true.png"></a></td>
     					</tr>
     					<tr>
     						<td><a href="PostingReview.bin?judge=no&id=<%=rs.getString(4) %>&username=<%=username %>"><img src="images/false.png"></a></td>
     					</tr>
     				</table>
     			</td>
     		</tr>
     	</table>
     	<%}} else { %>
     	<font color="red" size="14">暂时没有需要审核的帖子。</font>
     	<%} %>
	</div>
</body>
</html>