<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta name="viewport" content="width=device-width" , initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<title>ȸ������ �ý��� ȸ������ ������</title>
		
		<script>
        function sendIt() 
        {
             //���̵� �Է¿��� �˻�
            if (document.joinForm.id.value == "") {
                alert("���̵� �Է����� �ʾҽ��ϴ�.")
                document.joinForm.id.focus()
                return
            }
 
 
            //���̵� ��ȿ�� �˻� (�����ҹ���, ���ڸ� ���)
            for (i = 0; i < document.joinForm.id.value.length; i++) {
                ch = document.joinForm.id.value.charAt(i)
                if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) {
                    alert("���̵�� �ҹ���, ���ڸ� �Է°����մϴ�.")
                    document.joinForm.id.focus()
                    document.joinForm.id.select()
                    return
                }
            }
 
 
            //���̵� ���� ������� �ʱ�
            if (document.joinForm.id.value.indexOf(" ") >= 0) {
                alert("���̵� ������ ����� �� �����ϴ�.")
                document.joinForm.id.focus()
                document.joinForm.id.select()
                return
            }
 
 
            //���̵� ���� üũ (6~12��)
            if (document.joinForm.id.value.length < 6 || document.joinForm.id.value.length > 12) {
                alert("���̵� 6~12�ڱ��� �Է����ּ���.")
                document.joinForm.id.focus()
                document.joinForm.id.select()
                return
            }
 
 
            //��й�ȣ �Է¿��� üũ
            if (document.joinForm.pass.value == "") {
                alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.")
                document.joinForm.pass.focus()
                return
            }
 
 
            //��й�ȣ ���� üũ(4~8�� ���� ���)
            if (document.joinForm.pass.value.length < 4 || document.joinForm.pass.value.length > 8) {
                alert("��й�ȣ�� 4~8�ڱ��� �Է����ּ���.")
                document.joinForm.pass.focus()
                document.joinForm.pass.select()
                return
            }
 
 
            //��й�ȣ�� ��й�ȣ Ȯ�� ��ġ���� üũ
            if (document.joinForm.pass.value != document.joinForm.pass2.value) {
                alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�")
                document.joinForm.pass.value = ""
                document.joinForm.pass2.value = ""
                document.joinForm.pass.focus()
                return
            }
 
 /* 
             //�ֹι�ȣ ���� �˻� 
            str = document.joinForm.jumin.value
 
            hap = 0
            hap = hap + parseInt(str.charAt(0)) * 2
            hap = hap + parseInt(str.charAt(1)) * 3
            hap = hap + parseInt(str.charAt(2)) * 4
            hap = hap + parseInt(str.charAt(3)) * 5
            hap = hap + parseInt(str.charAt(4)) * 6
            hap = hap + parseInt(str.charAt(5)) * 7
            hap = hap + parseInt(str.charAt(6)) * 8
            hap = hap + parseInt(str.charAt(7)) * 9
            hap = hap + parseInt(str.charAt(8)) * 2
            hap = hap + parseInt(str.charAt(9)) * 3
            hap = hap + parseInt(str.charAt(10)) * 4
            hap = hap + parseInt(str.charAt(11)) * 5
 
            z = (hap % 11)
            z = 11 - z
 
            if (z == 10) { z = 0 }
            if (z == 11) { z = 1 }
 
            if (z != parseInt(str.charAt(12))) {
                alert("Ʋ�� �ֹε�Ϲ�ȣ�Դϴ�.")
                document.joinForm.jumin.value = ""
                return
            }  
  */
 
            // �����ּ� �����˻�
            var emailRegex = new RegExp(/^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/);
 
            if (!emailRegex.test(document.joinForm.email.value)) {
                alert("�ùٸ� ���� �ּҰ� �ƴմϴ�.");
                document.joinForm.email.value = "";
                return
            }
 
 
            // //�����ּ� �����˻�
            // function MailCheck() 
            // {
            //     var Check = false;
            //     Check = MailCheckRegex();
            //     if (!Check) return false;
 
            //     alert("�����ּҰ� �ùٸ��� �ԷµǾ����ϴ�.");
            //     return Check;
            // }
 
            // function MailCheckRegex() 
            // {
            //     var objEmail = document.getElementById("email");
            //     var objRegex = new RegExp(/^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/);
            //     if (!objRegex.test(objEmail.value)) 
            //     {
            //         alert("�ùٸ� ���� �ּҰ� �ƴմϴ�.");
            //         objEmail.value = "";
            //         objEmail.focus();
            //         return false;
            //     }
            //     return true;
            // }
 
 
 
            // //���� üũ ���� Ȯ��
            // if (document.f.se[0].checked == false && document.f.se[1].checked == false) {
            //     alert("������ üũ�� �ּ���")
            //     return
            // }
 
            document.joinForm.submit()
        }
 
    </script>
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
				aria-expanded="false"> �޴���ư <span class="caret"></span></a>
				
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
	<!-- 
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">

 -->


	<form action="joinProcess.jsp" name="joinForm" method="post">
		<center>
			<table width="500" align="center" border="1" cellspacing="0"
				cellpadding="0">

				<tr>
					<td height="40" align="center" style="color: thistle"
						bgcolor="black" colspan="2"><b>ȸ�� ���� ������</b></td>
				</tr>
				
				<tr>
					<td style="color: white;" bgcolor="black" align="center">���̵�</td>

					<td><input type="text" name="id" /></td>
				</tr>


				<tr>
					<td style="color: white;" bgcolor="black" align="center">��й�ȣ</td>

					<td><input type="password" name="pass" /></td>
				</tr>

				<tr>
					<td style="color: white;" bgcolor="black" align="center">��й�ȣ
						Ȯ��</td>

					<td><input type="password" name="pass2" /></td>
				</tr>

				<tr>
					<td style="color: white;" bgcolor="black" align="center">�ֹι�ȣ</td>

					<td><input type="password" name="jumin" /></td>
				</tr>


				<tr>
					<td height="40" align="center" bgcolor="#aaaaaa" colspan="2">
						<b>���� �Ż� ����</b>
					</td>
				</tr>


				<tr>
					<td bgcolor="#aaaaaa" align="center">�̸�</td>

					<td><input type="text" name="name" /></td>
				</tr>


				<tr>
					<td bgcolor="#aaaaaa" align="center">����</td>

					<td><input type="text" name="age" maxlength="2" /></td>
				</tr>



				<tr>
					<td bgcolor="#aaaaaa" align="center">�̸����ּ�</td>

					<td><input type="text" name="email"></td>
				</tr>


				<tr>
					<td bgcolor="#aaaaaa" align="center">����</td>


					<td><input type="text" name="button_Year"> �� <select
						name="button_Month">
							<option value="01"> 01 </option>
							<option value="02"> 02 </option>
							<option value="03"> 03 </option>
							<option value="04"> 04 </option>
							<option value="05"> 05 </option>
							<option value="06"> 06 </option>
							<option value="07"> 07 </option>
							<option value="08"> 08 </option>
							<option value="09"> 09 </option>
							<option value="10"> 10 </option>
							<option value="11"> 11 </option>
							<option value="12"> 12 </option>

					</select> �� <select name="button_Day">
							<option value="01"> 01 </option>
							<option value="02"> 02 </option>
							<option value="03"> 03 </option>
							<option value="04"> 04 </option>
							<option value="05"> 05 </option>
							<option value="06"> 06 </option>
							<option value="07"> 07 </option>
							<option value="08"> 08 </option>
							<option value="09"> 09 </option>
							<option value="10"> 10 </option>
							<option value="11"> 11 </option>
							<option value="12"> 12 </option>
							<option value="13"> 13 </option>
							<option value="14"> 14 </option>
							<option value="15"> 15 </option>
							<option value="16"> 16 </option>
							<option value="17"> 17 </option>
							<option value="18"> 18 </option>
							<option value="19"> 19 </option>
							<option value="20"> 20 </option>
							<option value="21"> 21 </option>
							<option value="22"> 22 </option>
							<option value="23"> 23 </option>
							<option value="24"> 24 </option>
							<option value="25"> 25 </option>
							<option value="26"> 26 </option>
							<option value="27"> 27 </option>
							<option value="28"> 28 </option>
							<option value="29"> 29 </option>
							<option value="30"> 30 </option>
							<option value="31"> 31 </option>
					</select> ��</td>
				</tr>


				<tr>
					<td bgcolor="#aaaaaa" align="center">����</td>

					<td><input type="radio" name="gender" value="��"
						checked="checked" /> ���� <input type="radio" name="gender"
						value="��" />����</td>
				</tr>

				<tr>
					<td bgcolor="#aaaaaa" align="center">���ɺо�</td>

					<td>
						<input name="like1" type="checkbox" value="html"> html 
						<input name="like2" type="checkbox" value="java"> java 
						<input name="like3" type="checkbox" value="c++"> C++
						<input name="like4" type="checkbox" value="c#"> C# 
						<input name="like5" type="checkbox" value="python"> Python
					</td>
				</tr>

				<tr>
					<td bgcolor="#aaaaaa" align="center">�ڱ�Ұ�</td>

					<td><textarea name="intro" rows="10" cols="50"> </textarea></td>
				</tr>



				<tr>
					<td colspan="2" align="center"><br>
						<button type="button" onclick="location.href='javascript:sendIt()' "> ȸ������ </button>
				   <!-- <button type="button" onclick="location.href='javascript:joinForm.submit()' "> ȸ������ </button> -->
						<br><br>
					</td>

					<!-- �ٸ� ���
	 					<td colspan="2" align="center"><a
							href="javascript:joinForm.submit()">ȸ������</a>&nbsp;&nbsp; <a
							href="javascript:joinForm.reset()">�ٽ��ۼ�</a>
						</td>
 						-->
				</tr>
			</table>
		</center>
	</form>


	<!-- 
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div> -->

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>