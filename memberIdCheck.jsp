<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.member.MemberDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	MemberDAO dao = MemberDAO.getInstance();

	boolean result = dao.duplicateIdCheck(id);

	response.setContentType("text/html;charset=euc-kr");
	PrintWriter output = response.getWriter();

	if (result)
		output.println("0"); // 아이디 중복
	else
		output.println("1");

	out.close();
	%>
</body>
</html>