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
<meta name="viewport"
	content="user-scalable=no,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript">
	// 비밀번호 확인 체크
	function pwCheck(){
		if(document.getElementById("userpwinput").value !=document.getElementById("userpwreinput").value){
			document.getElementById("pwrechk").innerHTML = '비밀번호가 일치하지 않습니다.';
			document.getElementById("pwrechk").style.color='red';
		} else{
			document.getElementById("pwrechk").innerHTML = '';
		}
	}
	//비밀번호 valid확인하는 함수
	function pwValidCheck(){
		var SC = ["!","@","#","$","%"];
        var check_SC = 0;
        var pw = document.getElementById("userpwinput"); 
		if(pw.value.length < 8 || pw.value.length >16){
			document.getElementById("pwchk").innerHTML = '8자 이상 15자 이하로 입력하세요.';
			document.getElementById("pwchk").style.color = 'red';
		} else{
			document.getElementById("pwchk").innerHTML = '';
		}
	}
	
	function idNullCheck(){
		if(!document.getElementById("useridinput").value){
			document.getElementById("idchk").innerHTML = '아이디를 입력하세요.';
			document.getElementById("idchk").style.color = 'red';
		}
	}
	
	//아이디 중복체크 화면 open
	function openIdChk() {
		window.name = "parentForm";
		window.open("idCheckForm.jsp", "chkForm",
				"width=500 height=300 resizableno, scrollbars=no");
	}

	//아이디 입력창에 값 입력시 hidden에 idUnchek를 세팅, 중복체크
	function inputIdChek() {
		document.userInfo.idDuplicaiton.value = "idUnchek";
	}
	
	
	//email 관련
	function email_change() {
		if (document.joinpol.email.options[document.joinpol.email.selectedIndex].value == '0') {
			document.joinpol.user_email2.readOnly = true;
			document.joinpol.user_email2.value = "";
		}
		else if(document.joinpol.email.options[document.joinpol.email.selectedIndex].value == '9') {
			document.joinpol.user_email2.readOnly = false;
			document.joinpol.user_email2.value = "";
			document.joinpol.user_email2.focus();
		} else {
			document.joinpol.user_email2.readOnly = true;
			document.joinpol.user_email2.value = document.joinpol.email.options[document.joinpol.email.selectedIndex].value;
		}
	}
</script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="joinpolwrapdiv">
		<div id="loginjoinselect">
			<span id="loginbtn" onclick="location.href='loginForm.jsp';">로그인</span><span
				id="joinbtn" onclick="location.href='join.jsp';">회원가입</span>
		</div>
		<div id="joinpoltopdiv">
			<span id="joinpoltop">·회원가입</span><span class="required">*</span> <span
				id="required_info">모든 항목은 필수 입력 사항입니다.</span>
		</div>
		<form name="joinpol" action="joinRedirect.jsp" method="post"
			autocomplete="off" >
			<div class="user_info_div">
				<span class="userinput_info"><span class="required">*</span>아이디</span><input
					id="useridinput" type="text" name="user_id" onclick="openIdChk()"
					onkeydown="inputIdChk()" onchange="idNullCheck()"/>&nbsp;<span id="idchk"></span><input
					type="hidden" name="idDuplication" value="idUnCheck">
				<div class="useridpwinfo">* 영문자, 숫자만 입력 가능(최소 6자 이상 16자 이하로
					입력하세요.)</div>
			</div>
			<div class="user_info_div">
				<span class="userinput_info"><span class="required">*</span>비밀번호</span><input
					id="userpwinput" type="password" name="user_pw" onchange ="pwValidCheck()" />&nbsp;<span id="pwchk" ></span>
				<div class="useridpwinfo">* 영문자, 숫자, 특수문자를 포함하여 8자 이상 15자 이하로
					입력하세요.</div>
			</div>
			<div class="user_info_div">
				<span class="userinput_info"><span class="required">*</span>비밀번호확인</span><input
					id="userpwreinput" type="password" name="user_pwre" onchange= "pwCheck()"/>&nbsp;<span
					id="pwrechk"></span>
			</div>
			<div class="user_info_div">
				<span class="userinput_info"><span class="required">*</span>이름</span><input
					id="usernameinput" type="text" name="user_name" /><span
					id="namechk"></span>
			</div>
			<div class="user_info_div">
				<span class="userinput_info"><span class="required">*</span>휴대폰
					번호</span><input id="usertelinput" type="text" name="user_tel"
					placeholder="ex) 01012341234" /><span id="telchk"></span>
				<div class="useridpwinfo">* 명의와 상관없이 실제 사용하시는 휴대폰 번호를 특수문자
					'-'를 제외한 숫자만 입력해주세요</div>
			</div>
			<div class="user_info_div">
				<span class="userinput_info"><span class="required">*</span>이메일</span><input
					id="useremailinput" type="text" name="user_email1"> @ <input
					id="useremailinput" type="text" name="user_email2" >
				<select name="email" onchange="email_change()">
					<option value="0">선택하세요</option>
					<option value="9">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="gmail.com">gmail.com</option>
				</select> <span id="emailchk"></span>
			</div>
			<div class="user_info_div">
				<span class="userinput_info"><span class="required">*</span>성별</span>
				<label><input type="radio" name="user_sex" value="남" />남성</label> <label><input
					type="radio" name="user_sex" value="여" />여성</label>
			</div>
			<div class="user_info_div">
				<span class="userinput_info"><span class="required">*</span>생년월일</span><input
					id="userbirthinput" type="date" name="user_birth"
					placeholder="ex) 19940723" /><span id="birthchk"></span>
				<!--<div class="useridpwinfo">* 주민등록번호와 상관없이 태어난 날짜를 작성해주세요 [예)19940723]</div>-->
			</div>
			<div class="user_info_div">
				<span class="userinput_info"><span class="required">*</span>추천인ID</span><input
					id="userrecommend" type="text" name="user_rec" /><span id="recchk"></span>
			</div>



		<div id="sbmbtn_wrap">
			<button id="cancel_submit" type="button"
				onclick="location.href='index.jsp';">취소</button>
			<button id="submitbtn" type="submit">가입</button>
		</div>
		</form>
	</div>
	<div id="footer">
		[62265] 광주광역시 광산구 첨단내촌로 70번길 55(월계동 769-4) 404호<br>T :
		062-374-7011 F : 062-374-7013 E : polinsight@gmail.com<br> <br>COPYRIGHT(C)
		2019 POLINSIGHT. ALL RIGHTS RESERVED
	</div>
</body>
</html>
