<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	String id = null;

	// ������ null�̰ų� ����id�� admin�̸�  
	if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from member";
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracle11g");
		con = ds.getConnection();

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>ȸ������ �ý��� ������ ���(ȸ����� ����)</title>
</head>


<body>

	<nav class="navbar navbar-default">
	<div class="navbar-header">

		<!-- ȭ���� �۾�����(�����) �޴���ư�� ����� Ŀ����  �޴��� ����-->
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">

			<!-- �޴���ư �ȿ� �۴�� 3�� ����(������) -->
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.jsp"> Welcome Hell </a>
	</div>

	<div class="collapse navbar-collapse" id=bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<%
				// �α��� �ȵǾ��� ��� - �α���, ȸ������ ��ư�� �����ش�.
				if (session.getAttribute("id") == null) 
				{
					out.println("<li><a href='loginForm.jsp'> �α��� </a></li>");
					out.println("<li><a href='joinForm.jsp'> ȸ������ </a></li>");
				} 
				
				// �α��� �Ǿ��� ��� - �α׾ƿ�, ������ ��ư�� �����ش�.
				else 
				{
					out.println("<li><a href='Main.jsp'> ���� �α����� </a></li>");
				}
			%>	
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false"> �����ϱ� <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<%
					// �α��� �ȵǾ��� ��� - �α���, ȸ������ ��ư�� �����ش�.
					if (session.getAttribute("id") == null) 
					{
						out.println("<li class='active'><a href='loginForm.jsp'> �α��� </a></li>");
						out.println("<li><a href='joinForm.jsp'> ȸ������ </a></li>");
					} 
					
					// �α��� �Ǿ��� ��� - �α׾ƿ�, ������ ��ư�� �����ش�.
					else 
					{
						out.println("<li><a href='Main.jsp'> ���� �α����� </a></li>");
					}
				%>
			</ul></li>
		</ul>
	</div>
	</nav>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">



				<center>
					<table border="1" width="220">
						<tr align="center">
							<td colspan="2">ȸ�����</td>
						</tr>
						<%
							while (rs.next()) {
						%>
						<tr align="center">
							<td><a href="Member_info.jsp?id=<%=rs.getString("id")%>">
									<%=rs.getString("id")%>
							</a></td>
							<td><a href="Member_delete.jsp?id=<%=rs.getString("id")%>">����</a>
							</td>
						</tr>
						<%
							}
						%>

					</table>
				</center>

			</div>
			<div class="col-lg-4"></div>
		</div>

		<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>