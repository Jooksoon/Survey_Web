<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*,DB.connection.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	
	<%
	String s_id = (String) session.getAttribute("sessionID");
	String pw = request.getParameter("newpw");
	String email = request.getParameter("email");

	DBConnection db = new DBConnection();
	Connection conn = db.getConnection();
	PreparedStatement pstmt = null;

	String sql = "UPDATE user SET password=? , email=? WHERE id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pw);
	pstmt.setString(2, email);
	pstmt.setString(3, s_id);

	int rs = pstmt.executeUpdate();

	if (rs > 0) {
		out.println("<script language='javascript'>");
		out.println("alert('정보수정 성공')");
		out.println("location.href='Account.jsp'");
		out.println("</script>");
	} else {
		out.println("<script language='javascript'>");
		out.println("alert('정보수정 실패')");
		out.println("location.href='LoginForm.jsp'");
		out.println("</script>");
	}
	%>
</body>
</html>