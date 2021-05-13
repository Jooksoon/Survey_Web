<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>조사의뢰 및 문의</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="gtiwrap">
		<img id="gti" src="img/gt.jpg" />
	</div>
	<div id="pagewrap">
		<div id="plm">
			<div id="gplmt">&nbsp&nbsp&nbsp커뮤니티</div>
			<div id="gplmc1" onclick="location.href='';">&nbsp&nbsp&nbsp공지사항</div>
			<div id="gplmc2" onclick="location.href='requestSurvey';">&nbsp&nbsp&nbsp조사의뢰
				및 문의</div>
		</div>
		<!--
        -->
		<div id="pd">
			<div id="pdtt">조사의뢰 및 문의</div>
			<div id="pdtd">조사의뢰 및 문의</div>
			<div id="pd3">
				<table id="ostable">
					<tr style="background-color: #f6f6f6; font-weight: bold;">
						<td style="width: 100px;">번호</td>
						<td style="width: 500px; text-align: left;">제목</td>
						<td style="width: 150px;">등록자</td>
						<td style="width: 170px;">등록일</td>
					</tr>
					<tr>
						<td>1</td>
						<td style="text-align: left;">폴인사이트 조사의뢰 및 문의</td>
						<td>관리자</td>
						<td>2019-04-10</td>
					</tr>
				</table>
				<input id="write" type="button" value="글쓰기" onclick="location.href='write.jsp';"/>
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