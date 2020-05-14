<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp!</title>
<link rel="stylesheet" href="../css/join_style.css" />
<script>
	function checkValue() {
		inputForm=eval("document.loginInfo"); //form자체를 가지고오는것
		if(!inputForm.id.value){ //이 밸류(td안에들어있는 인풋속 아이디)값이 없다면..
			alert("아이디입력")
			inputForm.id.focus(); //아이디,비번중 아이디를먼저포커스해줘서 창띄워줌
			return false;
	}	
		if(!inputForm.password.value){ //이 밸류(td안에들어있는 인풋속 패스워드)값이 없다면..
			alert("비밀번호입력")
			inputForm.password.focus();
			return false;
	}
}
	function goJoinForm() {
		location.href="../joinus/join.jsp"; //이곳에서 펑션처리해서 가입창으로 돌아감
	}
</script>
</head>
<body>
<div id="wrap">
	<form action="loginProc.jsp" name="loginInfo" method="post"
	onsubmit="return checkValue()" > <!-- 서브밋이눌르면 펑션으로 돌아가라 --> 
		<!-- 이미지추가 -->
		<img src="../img/welcome.jpg" id="wel_img" />
		<br /><br />
		<table>
			<tr>
				<td bgcolor="skyblue">아이디</td>
				<td> <input type="text" name="id" maxlength="50" /> </td>
			</tr>
			<tr>
				<td bgcolor="skyblue">비밀번호</td>
				<td> <input type="password" name="password" maxlength="50" /> </td>
			</tr>
		</table>
		<br />
		<input type="submit" value="login" />
		<input type="button" value="join" onclick="goJoinForm()" />	<!-- 가입창으로 돌아가기위한 펑션준비 -->
	</form>
	<%
	String msg = request.getParameter("msg");
	if(msg!=null && msg.equals("0")){
		out.println("<br>");
		out.println("<font color='red' size='5'>비밀번호확인</font>");
	}
	else if(msg!=null && msg.equals("-1")){
		out.println("<br>");
		out.println("<font color='red' size='5'>아이디확인</font>");
	}
		
	%>
</div>
</body>
</html>