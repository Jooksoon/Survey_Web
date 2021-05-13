<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>글쓰기</title>
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
				<table summary="조사 의뢰 및 문의">
					<form>
						<table>
							<caption>조사 의뢰 및 문의</caption>
							<tr>
								<td>작성자</td>
								<td><input type=text name=name size=10 maxlength=8></td>
							</tr>
							<tr>
								<td>E-Mail</td>
								<td><input type=text name=email size=30></td>
							</tr>
							<tr>
								<td>제목</td>
								<td><input type=text name=title></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea name=content rows="10" cols="100"></textarea></td>
							</tr>
							<tr>
								<td>비밀번호</td>
								<td><input type=password name=password size=15 maxlength=15></td>
							</tr>
							<tr>
								<td colspan=2><hr size=1></td>
							</tr>
							<tr>
								<td colspan="2"><div align="center">
										<input type="submit" value="등록"> <input type="button"
											value="뒤로" onclick="location.href='requestSurvey.jsp';">
									</div></td>
							</tr>
						</table>
					</form>
				</table>
			</div>
		</div>
</body>
</html>