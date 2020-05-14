<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MainForm.jsp</title>
</head>
<body>
	<h2>MainForm.jsp</h2>
	<b> <font size="3" color="skyblue">메인화면입니다</font> </b>
	<%
		if(session.getAttribute("sessionID")==null){ //가져온 세션아이디가 널인지? 로그인이안된상태..
			//맞다면 로그인화면다시으로 이동
			response.sendRedirect("login/loginForm.jsp");
		}else{//널이 아닐경우..
	%>
	 <!-- html 영역 --> <h3><font color="red"><%=session.getAttribute("sessionID") %></font>님 로그인 되었습니다.</h3>
	 <br /><br />
	 <input type="button" value="Logout" onclick="logoutProc();" /> <!-- 버튼으로 logout생성하고 펑션으로처리할준비 -->
	<% 
		}
	%>
</body>
</html>