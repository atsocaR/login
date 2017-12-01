<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	String id = null;

	if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}

	String info_id = request.getParameter("id");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from member where id=?";
	try {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracle11g");
		con = ds.getConnection();

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, info_id);
		rs = pstmt.executeQuery();

		rs.next();

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
<title>ȸ������ �ý��� ������ ���(ȸ������ ����)</title>
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
					<table border="1" width="240">
						<tr align="center">
							<td>���̵�</td>
							<td><%=rs.getString("id")%></td>
						</tr>

						<tr align="center">
							<td>��й�ȣ</td>
							<td><%=rs.getString("pass")%></td>
						</tr>

						<tr align="center">
							<td>��й�ȣ Ȯ��</td>
							<td><%=rs.getString("pass2")%></td>
						</tr>

						<tr align="center">
							<td>�ֹι�ȣ</td>
							<td><%=rs.getString("jumin")%></td>
						</tr>

						<tr align="center">
							<td>�̸�</td>
							<td><%=rs.getString("name")%></td>
						</tr>

						<tr align="center">
							<td>����</td>
							<td><%=rs.getString("age")%></td>
						</tr>

						<tr align="center">
							<td>����</td>
							<td><%=rs.getString("gender")%></td>
						</tr>

						<tr align="center">
							<td>�̸����ּ�</td>
							<td><%=rs.getString("email")%></td>
						</tr>

						<tr align="center">
							<td>����</td>
							<td><%=rs.getString("button_Year")%></td>
						</tr>

						<tr align="center">
							<td>����</td>
							<td><%=rs.getString("button_Month")%></td>
						</tr>

						<tr align="center">
							<td>����</td>
							<td><%=rs.getString("button_Day")%></td>
						</tr>

						<tr align="center">
							<td>���</td>
							<td>
								<%=rs.getString("like1")%>
								<%=rs.getString("like2")%>
								<%=rs.getString("like3")%>
								<%=rs.getString("like4")%>
								<%=rs.getString("like5")%>
							</td>
						</tr>
						
						<tr align="center">
							<td>�ڱ�Ұ�</td>
							<td><%=rs.getString("intro")%></td>
						</tr>


						<tr align="center">
							<td colspan="2"><a href="Member_list.jsp">����Ʈ�� ���ư���</a></td>
						</tr>
					</table>
				</center>


			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>

		<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>

</body>
</html>