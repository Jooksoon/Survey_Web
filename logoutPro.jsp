<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그아웃 처리</title>
</head>
<body>
 <%
        session.invalidate(); // 모든세션정보 삭제
        response.sendRedirect("index.jsp"); // 로그인 화면으로 다시 돌아간다.
    %>
</body>
</html>