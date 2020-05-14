<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
String id=request.getParameter("id");
String pass=request.getParameter("password");

//db연결
String sql="select pwd from member where id=?"; //db의 아이디를 가져옴
Class.forName("oracle.jdbc.driver.OracleDriver");

//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String pw="123456";
Connection con=DriverManager.getConnection(url,user,pw);

//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs= pstmt.executeQuery();//select 실행

String ypass="";
int x=-1;
String msg="";
if(rs.next()){
	ypass=rs.getString("pwd"); //이곳에서의 비번과 db의 비번이 일치할때씀..
	if(ypass.equals(pass)) //일치할시에 나올메시지 =1
		x=1;
	else//id,pass 불일치시나오는 메세지 =0
		x=0;
}else{
	x=-1; //아이디가 존재하지않을때(아이디에맞는 비밀번호가안나올시) -1
}
System.out.println("xxxx : "+x);

if(x==1){ //로그인 성공시..
	session.setAttribute("sessionID", id);
	msg = "../MainForm.jsp"; //이쪽으로가라
}else if(x==0){
	msg = "loginForm.jsp?msg=0"; //이쪽도오류기때문에 msg의 0을담아서 loginForm.jsp로 돌아감
}else{ //-1 이뜰시에
	msg = "loginForm.jsp?msg=-1"; //로그인폼으로 돌아갈때 msg의 -1을 담아서 loginForm.jsp로돌아감
}
response.sendRedirect(msg);




%>