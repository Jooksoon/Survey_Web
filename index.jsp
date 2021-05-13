<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>폴인사이트</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<meta name="viewport"
	content="user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<link rel="icon" href="img/favi.png" />

</head>
<body>
 <jsp:include page="header.jsp"></jsp:include>
	
	<div id="roll"></div>
	<div id="quickmw">
		<div id="quickm">
			<div class="qms">
				<img id="icon1" src="img/icon1.png"
					onclick="location.href='request.php';" />
				<div class="qmd1" onclick="location.href='request.php';">조사문의</div>
				<div class="qmd2" onclick="location.href='request.php';">
					궁금하신 조사에 대해<br>문의해 보세요.
				</div>
			</div>
			<div class="qms">
				<img id="icon2" src="img/icon2.png"
					onclick="location.href='field.php';" />
				<div class="qmd1" onclick="location.href='field.php';">사업영역</div>
				<div class="qmd2" onclick="location.href='field.php';">
					과학적인 DATA분석으로 정책연구의<br>솔루션을 제공합니다.
				</div>
			</div>
			<div id="qms3" class="qms">
				<img id="icon3" src="img/icon3.png"
					onclick="location.href='onlinesurvey.php';" />
				<div class="qmd1" onclick="location.href='onlinesurvey.php';">온라인조사</div>
				<div class="qmd2" onclick="location.href='onlinesurvey.php';">
					폴인사이트에서 진행하는<br>각종 조사에 참여하고 싶다면?
				</div>
			</div>
		</div>
	</div>
	<div id="bm">
		<div class="bmd">
			<div class="bmdt">이슈리포트</div>
			<div id="bmdid1"></div>
		</div>
		<div class="bmd">
			<div class="bmdt">트렌드맞춤형 마케팅</div>
			<div id="bmdid2"></div>
		</div>
		<div class="bmd">
			<div class="bmdt">공지사항</div>
			<div id="bmdid3"></div>
		</div>
	</div>
	<div id="footer">
		[62265] 광주광역시 광산구 첨단내촌로 70번길 55(월계동 769-4) 404호<br>T :
		062-374-7011 F : 062-374-7013 E : polinsight@gmail.com<br> <br>COPYRIGHT(C)
		2019 POLINSIGHT. ALL RIGHTS RESERVED
	</div>
	<script>
	document.getElementById("roll").innerHTML = "<div id='slidebtn'><div id='leftbtn' onclick='slideleft();'></div><div id='rightbtn' onclick='slideright();'></div></div><div id='rid1'></div><img id='ri1' src='img/main4.jpg'/>"
			+ "<div id='topd1'><div class='topd1d'>WEB&DESIGN</div><div class='topd2d'><span class='topd2s'>웹&디자인</span></div><div class='topd4d'>빠르게 변화하는 <span class='topd4s'>트렌드맞춤형 마케팅</span> 시스템</div></div>"
			+ "<div id='rid2'></div><img id='ri2' src='img/main1.jpg'/>"
			+ "<div id='topd2'><div class='topd1d'>POLL</div><div class='topd2d'><span class='topd2s'>여론조사</span></div><div class='topd4d'>믿을만한 <span class='topd4s'>여론 동향 파악</span> 및 <span class='topd4s'>솔루션 제공</span></div></div>"
			+ "<div id='rid3'></div><img id='ri3' src='img/main2.jpg'/>"
			+ "<div id='topd3'><div class='topd1d'>PUBLIC DATA</div><div class='topd2d'><span class='topd2s'>공공데이터분석</span></div><div class='topd4d'><span class='topd4s'>GIS, 네트워크분석</span>을 활용한 <span class='topd4s'>데이터 시각화</span></div></div>"
			+ "<div id='rid4'></div><img id='ri4' src='img/main3.jpg'/>"
			+ "<div id='topd4'><div class='topd1d'>POLITICS</div><div class='topd2d'><span class='topd2s'>정책연구</span></div><div class='topd4d'><span class='topd4s'>데이터</span>에 기반한 <span class='topd4s'>인사이트 도출</span></div></div>";
	document.getElementById("leftbtn").innerHTML = "<img id='lbi' src='img/icon_arrowl.png'/>";
	document.getElementById("rightbtn").innerHTML = "<img id='rbi' src='img/icon_arrowr.png'/>";
	//var rollleft = $("#roll").offset().left - 1000;
	//var rollleft2 = $("#roll").offset().left + 150;
	//var rollleft3 = $("#roll").offset().left;
	//var rollright = $("#roll").offset().left + 1000;
	//var rollright2 = $("#roll").offset().left + 2000;
	//var rolldleft = $("#roll").offset().left - 850;
	//var rolldright = $("#roll").offset().left + 1150;
	//var rolldright2 = $("#roll").offset().left + 2150;
	//var roll1 = $("#roll").offset().left + 25;
	//var roll2 = $("#roll").offset().left + 980;
	//$("#ri1").offset({
	//	left : rollleft
	//});
	//$("#rid1").offset({
	//	left : rollleft
	//});
	//$("#ri3").offset({
	//	left : rollright
	//});
	//$("#rid3").offset({
	//	left : rollright
	//});
	//$("#ri4").offset({
	//	left : rollright2
	//});
	//$("#rid4").offset({
	//	left : rollright2
	//});
	//$("#topd1").offset({
	//	left : rolldleft
	//});
	//$("#topd2").offset({
	//	left : rollleft2
	//});
	//$("#rid2").offset({
	//	left : rollleft3
	//});
	//$("#topd3").offset({
	//	left : rolldright
	//});
	//$("#topd4").offset({
	//	left : rolldright2
	//});
	//$("#slidebtn").offset({
	//	left : roll1
	//});
</script>
</body>
</html>
