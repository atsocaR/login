<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = null; // null �ʱ�ȭ
	if (session.getAttribute("id") != null) { // ������ ��� �Ǿ��ٸ� id�� ������ ����
		id = (String) session.getAttribute("id");
		
	} else {
		out.println("<script>"); // �ƴ϶�� loginForm.jsp �̵�
		out.println("alert('�α��� ����');");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>ȸ������ �ý��� ���� ������</title>
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


	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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


				<!-- <script> alert('�α��� ����'); </script> -->
				<h3>�α��� ��: <%=id%>
				</h3>
				<%
					if (id.equals("admin")) // �����ڸ� ����
					{
				%>
						<tr>
							<td align="center"><br>
								<button type="button" onclick="location.href='Member_list.jsp' ">
									�����ڸ�� ����(ȸ�����)
								</button> <br> <br>
							</td>
						</tr>
				<%
					}
				%>

			</div>
			<div class="col-lg-4"></div>
		</div>
		</div>
		

		<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>