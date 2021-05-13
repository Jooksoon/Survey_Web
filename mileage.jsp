<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마일리지</title>
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
			<div id="pdtd">적립금관리</div>
			<div id="pd3">
				<form>
					
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
		[62265] 광주광역시 광산구 첨단내촌로 70번길 55(월계동 769-4) 404호<br>T :
		062-374-7011 F : 062-374-7013 E : polinsight@gmail.com<br>
		<br>COPYRIGHT(C) 2019 POLINSIGHT. ALL RIGHTS RESERVED
	</div>
</body>
</html>