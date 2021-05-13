<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="model.form.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>폼 정보</title>
<link rel="stylesheet" href="css/formInfo.css">
<script type="text/javascript">

</script>
</head>
<body>
	<div>
		<form id="surveyinform" method="get" action="formInfoPro.jsp">
			설문지이름 : <input type="text" id="title" name="title"> <br>
			설문설명 :
			<textarea name="description" id="description"></textarea>
			<button onclick="submit()">만들기</button>
			<button onclick="window.close()">취소</button>
		</form>
	</div>
	<%
	
	%>
</body>
</html>