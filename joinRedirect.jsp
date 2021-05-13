<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page contentType="text/html; charset=utf-8"%>

	<%
	// Redirect16.jsp

	// 데이터 수신

	String id = request.getParameter("user_id");
	String password = request.getParameter("user_pw");
	String name = request.getParameter("user_name");
	String phone = request.getParameter("user_tel");
	String mail1 = request.getParameter("user_email1");
	String mail2 = request.getParameter("user_email2");
	String gender = request.getParameter("user_sex");
	String birth = request.getParameter("user_birth");

	String rec = request.getParameter("user_rec");

	
	//check ~!!!
	// 결과 데이터 재전송 →sendRedirect() 메소드 사용
	// ※ response 객체의 주요 메소드 중 하나인 『sendRedirect(String location)』
	//    : 지정된 URL(location)로 요청을 재전송한다.
	// 리퀘스트가 이자리에서 소멸되기 대문에Receive16.jsp까지 이어서 넘어가질 않는다
	response.sendRedirect("joinPro.jsp?id=" + id + "&password=" + password + "&name=" + name + "&phone=" + phone + "&mail1=" + mail1  + "&mail2=" + mail2
			 + "&gender=" + gender  + "&birth=" + birth);

	//session.setAttribute("message", result);

	// 리다이렉트
	%>
</body>
</html>

