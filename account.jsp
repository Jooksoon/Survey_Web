<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*,DB.connection.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String s_id = (String) session.getAttribute("sessionID");
DBConnection db = new DBConnection();
Connection conn = db.getConnection();

PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "SELECT * FROM user WHERE id=?";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, s_id);
rs = pstmt.executeQuery();
%>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript">
	// 비밀번호 확인 체크
	function newpwCheck(){
		if(document.getElementById("newpass").value !=document.getElementById("newpassre").value){
			document.getElementById("newpack").innerHTML = '새 비밀번호가 일치하지 않습니다.';
			document.getElementById("newpack").style.color='red';
		}
	}
	</script>
<title>내정보</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="gtiwrap">
		<img id="gti" src="img/gt.jpg" />
	</div>
	<div id="pagewrap">
		<div id="plm">
			<div id="gplmt">&nbsp&nbsp&nbsp마이페이지</div>
			<div id="gplmc1" onclick="location.href='account.jsp';">&nbsp&nbsp&nbsp내정보관리</div>
			<div id="gplmc2" onclick="location.href='mileage.jsp';">&nbsp&nbsp&nbsp적립금관리</div>
		</div>
		<!--
        -->
		<div id="pd">
			<div id="pdtt">마이페이지</div>
			<div id="pdtd">내 정보관리</div>
			<div id="pd3">
				<%
				if (s_id == null) {
					response.sendRedirect("loginForm.jsp");
				} else {
				%>
				<form name="update_form" action="updatePro.jsp" method="post">
					<table>
						<%
						if (rs.next()) {
						%>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id"
								value="<%=rs.getString("id")%>" readonly/></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pw"
								value="<%=rs.getString("password")%>"/></td>
						</tr>
						<tr>
							<td>새 비밀번호</td>
							<td><input type="password" name="newpw" id="newpass"/></td>
						</tr>
						<tr>
							<td>새 비밀번호 확인</td>
							<td><input type="password" name="newpwre" id="newpassre" onchange="newpwCheck()"/>&nbsp;<span id="newpack"></span></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="username" value="<%=rs.getString("name")%>" readonly/></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="date" name="birthdate" value="<%=rs.getString("birthday")%>"/></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" value="<%=rs.getString("email")%>"/></td>
						</tr>
						<tr>
							<td>핸드폰</td>
							<td><input type="text" name="phone" value="<%=rs.getString("phone_number")%>"/></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><input type="text" name="gender" value="<%=rs.getString("sex")%>"/></td>
						</tr>
						<%}%>
					</table>
					<input type="submit" value="수정">
				</form>
				<%}%>
				<button>패널가입하기</button>
			</div>
		</div>
	</div>
	<div id="footer">
		[62265] 광주광역시 광산구 첨단내촌로 70번길 55(월계동 769-4) 404호<br>T :
		062-374-7011 F : 062-374-7013 E : polinsight@gmail.com<br> <br>COPYRIGHT(C)
		2019 POLINSIGHT. ALL RIGHTS RESERVED
	</div>
</body>
</html>