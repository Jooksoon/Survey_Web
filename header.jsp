<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>header</title>
</head>
<body>
	<%
	String id = (String)session.getAttribute("sessionID");
	if (session.getAttribute("sessionID") == null) {
	%>
	<div id="top">
		<span id="bookmark">즐겨찾기 추가</span> <span id="top_menu"><span
			class="top_menu_d" onclick="location.href='index.jsp';">홈</span><span
			class="top_menu_d" onclick="location.href='loginForm.jsp';">로그인</span><span
			class="top_menu_d" onclick="location.href='join.jsp';">회원가입</span></span>
	</div>

	<%
	} else if(id.equals("polinsight")&& id!=null){
	%>
	<div id="top">
		<span id="bookmark">즐겨찾기 추가</span><span id="top_menu"><span
			class="top_menu_d" onclick="location.href='index.jsp';">홈</span> <span
			class="top_menu_d"><%=session.getAttribute("sessionID")%>님
				환영합니다.</span> <span class="top_menu_d"
			onclick="location.href='logoutPro.jsp';">로그아웃</span> <span
			class="top_menu_d" onclick="location.href='managePanel.jsp';">관리자페이지</span>
		</span>
	</div>
	<%
	} else {
	%>
	<div id="top">
		<span id="bookmark">즐겨찾기 추가</span><span id="top_menu"><span
			class="top_menu_d" onclick="location.href='index.jsp';">홈</span> <span
			class="top_menu_d"><%=session.getAttribute("sessionID")%>님
				환영합니다.</span> <span class="top_menu_d"
			onclick="location.href='logoutPro.jsp';">로그아웃</span> <span
			class="top_menu_d" onclick="location.href='account.jsp';">마이페이지</span>
		</span>
	</div>
	<%
 }
 %>
	<div id="lmd">
		<img id="logoimg" src="img/logo.png"
			onclick="location.href='index.jsp';" />
	</div>
	<div id="topmenu">
		<div id="topmenuwrap">
			<div id="topmenu1">폴인사이트소개</div>
			<!--
      -->
			<div id="topmenu2">사업영역</div>
			<!--
      -->
			<div id="topmenu3">온라인조사</div>
			<!--
      -->
			<div id="topmenu4">커뮤니티</div>
			<div id="submenuwrap">
				<div id="submenu">
					<div id="submenu1">
						<div id="subt1" class="sub"
							onclick="location.href='greeting.php';">인사말</div>
						<div class="sub" onclick="location.href='history.php';">연혁</div>
					</div>
					<div id="submenu2">
						<div id="subt2" class="sub" onclick="location.href='field.php';">분야별영역</div>
						<div class="sub" onclick="location.href='performance1.php';">주요실적</div>
					</div>
					<div id="submenu3">
						<div id="subt3" class="sub"
							onclick="location.href='onlinesurvey.php';">온라인설문</div>
						<div class="sub" onclick="location.href='polpointmall.php';">포인트몰</div>
					</div>
					<div id="submenu4">
						<div id="subt4" class="sub" onclick="location.href='notice.php';">공지사항</div>
						<div class="sub" onclick="location.href='requestSurvey.jsp';">조사의뢰
							및 문의</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>