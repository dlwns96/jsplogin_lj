<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>logOutProc.jsp!</title>
</head>
<body>
<%
session.invalidate();
response.sendRedirect("loginForm.jsp");
%>
</body>
</html>