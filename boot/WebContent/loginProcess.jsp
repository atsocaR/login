<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	// ���̵� �� ��й�ȣ �Է� â���� id �� pass�� �޾ƿ´�
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	// null  �ʱ�ȭ  
	Connection con = null; // Connection -> DB ����
	PreparedStatement pstmt = null; // SQL ���� ó�� 
	ResultSet rs = null; // �˻�(select) �� ����� ����ִ� ����(Record Set : Table) : select
	String sql = "select * from member where id=?";

	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/Oracle11g");

		// JDBC ����̹� ����
		con = ds.getConnection();

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (pass.equals(rs.getString("pass"))) {
				session.setAttribute("id", id);

				out.println("<script>");
				out.println("alert('�α��� ����')");
				out.println("location.href='Main.jsp'");
				out.println("</script>");
			}
		}
		out.println("<script>");
		out.println("alert('�α��� ���� (ȸ������ �������� �̵�)');");
		out.println("location.href='joinForm.jsp'");
		out.println("</script>");
	} catch (Exception e) {
		e.printStackTrace();
	}
%>