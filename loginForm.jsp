<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>폴인사이트</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<meta name="viewport"
	content="user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width" />
<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.id.value) {
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.password.value) {
			alert("비밀번호를 입력하세요");
			inputForm.password.focus();
			return false;
		}
	}

	// 회원가입 버튼 클릭시 회원가입 화면으로 이동
	function goJoinForm() {
		location.href = "join.jsp";
	}

	function submitForm() {
		loginform.submit();
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="loginwrapdiv">
		<div id="loginjoinselect">
			<span id="loginbtn" onclick="location.href='loginForm.jsp';">로그인</span><span
				id="joinbtn" onclick="location.href='join.jsp';">회원가입</span>
		</div>
		<div id="logintitle">폴인사이트에 오신 것을 환영합니다.</div>
		<form name="loginform" method="post" action="loginPro.jsp"
			onsubmit="return checkValue()">
			<div id="useridpw">
				<input class="userinput" name="id" type="text" placeholder="ID" />
				<input class="userinput" name="password" type="password"
					placeholder="PASSWORD" />
			</div>
			<div id="loginformsubmitbtn" onclick="submitForm()">로그인</div>
		</form>
		<div id="loginetc">
			<span class="finduserinfo" style="margin-right: 35px;">아이디/비밀번호
				찾기</span> <span class="finduserinfo" onclick="location.href='join.jsp';">회원가입
				하기</span>
		</div>
		<%
		// 아이디, 비밀번호가 틀릴경우 화면에 메시지 표시
		// LoginPro.jsp에서 로그인 처리 결과에 따른 메시지를 보낸다.
		String msg = request.getParameter("msg");

		if (msg != null && msg.equals("0")) {
			out.println("<script language='javascript'> alert('비밀번호를 확인해 주세요.'); </script>");
		} else if (msg != null && msg.equals("-1")) {
			out.println("<script language='javascript'> alert('아이디를 확인해 주세요.'); </script>");
		}
		%>
	</div>
	<div id="footer">
		[62265] 광주광역시 광산구 첨단내촌로 70번길 55(월계동 769-4) 404호<br>T :
		062-374-7011 F : 062-374-7013 E : polinsight@gmail.com<br> <br>COPYRIGHT(C)
		2019 POLINSIGHT. ALL RIGHTS RESERVED
	</div>
</body>
</html>