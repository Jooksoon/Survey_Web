<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="css/form.css">

</head>
<body>
	<div class="container">
		<div class="form" style="padding-top: 20px;">
			<form id="form" method="post" action="formPro.jsp">
				<h3 style="text-align: center;">설문 항목 추가</h3>
				<div class="questions" id="questions"></div>
				<input type="hidden" name="form" value="<%=request.getParameter("form_id")%>">
				<input type="hidden" name="num_of_question" value="0">
				<input type="hidden" name="num_of_index" value="0">
				<input type="button" class="btn_addQuestion" value="새 질문" onClick="addQuestion()">
				<button class="form_submit" onclick="formSubmit()">완료</button>
			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

	<script>
		var questionIndex = 0;
		var indexArray = [];
		var click = true;
		
		function addOption(q_idx) {
			let table = document.getElementById("option" + q_idx);
			
			let counter = document.getElementById("option_count" + q_idx);

			let rowlen = table.rows.length + 1;
			
			if (rowlen > 7) {
				alert("최대 7개 항목을 입력하실 수 있습니다.");
				return 0;
			}
			
			// var row = table.insertRow(); // IE와 Chrome 동작을 달리함.
			let row = table.insertRow(rowlen - 1); // HTML에서의 권장 표준 문법
			
			let newcell = row.insertCell(0);
			newcell.innerHTML = "O";
			newcell.className = "blank";
			
			newcell = row.insertCell(1);
			newcell.innerHTML = "<input type='text' class='option_content' placeholder='항목' name='option" + q_idx + "_" + (rowlen - 1) + "'>";
			newcell.className = "option";
			
			newcell = row.insertCell(2);
			newcell.innerHTML = "<input type='button' class='create_delete_option' onClick='addOption(" + q_idx + ")' value='+'>"
			+ "<input type='button' class='create_delete_option' onClick='removeOption(" + q_idx + ")' value='-'>";
			newcell.className = "create_delete_option";
			
			counter.value = rowlen;
		}

		function removeOption(q_idx) {
			let table = document.getElementById("option" + q_idx);

			let counter = document.getElementById("option_count" + q_idx);

			let rowlen = table.rows.length - 1;

			if (rowlen < 1) {
				alert("1개 이상의 항목을 입력하셔야 합니다.");
				return 0;
			}

			table.deleteRow(rowlen);

			counter.value = rowlen;
		}

		function addMatrixQuestion(q_idx) {
			let table = document.getElementById("question" + q_idx);

			let counter = document.getElementById("question_count" + q_idx);

			let rowlen = table.rows.length + 1;

			if (rowlen > 7) {
				alert("최대 7개 항목을 입력하실 수 있습니다.");
				return 0;
			}
			// var row = table.insertRow(); // IE와 Chrome 동작을 달리함.
			let row = table.insertRow(rowlen - 1); // HTML에서의 권장 표준 문법

			let newcell = row.insertCell(0);
			newcell.innerHTML = "";
			newcell.className = "question_number";
			
			newcell = row.insertCell(1);
			newcell.innerHTML = "<input type='text' class='question_title' placeholder='질문을 입력하세요.' name='question_title" + q_idx + "_" + (rowlen - 1) + "'>";
			newcell.className = "question_title";
			
			newcell = row.insertCell(2);
			newcell.innerHTML = "<input type='button' class='create_delete_question' onClick='addMatrixQuestion(" + q_idx + ")' value='+'>"
			+ "<input type='button' class='create_delete_question' onClick='removeMatrixQuestion(" + q_idx + ")' value='-'>";
			newcell.className = "create_delete_question";
			
			counter.value = rowlen;
		}

		function removeMatrixQuestion(q_idx) {
			let table = document.getElementById("question" + q_idx);

			let counter = document.getElementById("question_count" + q_idx);

			let rowlen = table.rows.length - 1;

			if (rowlen < 1) {
				alert("1개 이상의 항목을 입력하셔야 합니다.");
				return 0;
			}

			table.deleteRow(rowlen);

			counter.value = rowlen;
		}

		function addQuestion() {
			questionIndex++;
			
			const form = document.getElementById('form');

			form.num_of_question.value++;
			
			let question = multiple(questionIndex);

			const newQuestion = document.createElement('div');

			newQuestion.innerHTML = question;
			
			questions.appendChild(newQuestion);
			
			indexArray.push(questionIndex);
			
			questionNumbering();
		}

		function removeQuestion() {
			const form = document.getElementById('form');

			let question = document.activeElement.parentNode;
			
			let index = question.querySelector("#questionIndex");
			
			for(let i = 0; i < indexArray.length; i++) {
				if(indexArray[i] == index.value)  {
					indexArray.splice(i, 1);
				}
			}

			question.parentNode.removeChild(question);

			form.num_of_question.value--;
			
			questionNumbering();
		}

		function changeType(questionIdx) {
			let sel = document.activeElement;

			let type = sel.value;

			let question = document.activeElement.parentNode.parentNode.parentNode;
			
			let index = question.querySelector("#questionIndex").value;

			switch (type) {
			case "multiple":
				question.innerHTML = multiple(index);
				break;
			case "shortanswer":
				question.innerHTML = shortanswer(index);
				break;
			case "matrix":
				question.innerHTML = matrix(index);
				break;
			default:
				alert("잘못된 타입입니다.");
			}
			
			sel = document.querySelector("#type" + questionIdx);
			
			for (let i = 0; i < sel.length; i++) {
				if (sel[i].value == type) {
					sel[i].selected = true;
				}
			}

			questionNumbering();
			
		}

		function questionNumbering(){
			for(let i = 0; i < indexArray.length; i++) {
				let q = document.getElementById('question_num' + indexArray[i]);
				
				q.innerHTML = i + 1;
			}
		}
		
		function making_index(){
			const form = document.getElementById('form');
			
			for(let i = 0; i < indexArray.length; i++){
				let index = document.createElement("input");
			    index.type = "hidden";
			    index.name = "index" + i;
			    index.value = indexArray[i];

			    form.appendChild(index);
			}
		}

		function formSubmit() {
			overClick();
			
			const form = document.getElementById('form');
			
			form.num_of_index.value = indexArray.length;

			making_index();
			
			form.submit();
		}

		function multiple(q_idx) {
			var multiple = "<div class='multiple' id='multiple" + q_idx + "'>"
					+ "<div class='form-group'>"
					+ "<select id='type" + q_idx + "' name='type" + q_idx + "' onchange='changeType(" + q_idx + ")'>"
					+ "<option value='multiple'>객관식</option>"
					+ "<option value='shortanswer'>주관식</option>"
					+ "<option value='matrix'>행렬형</option>"
					+ "</select>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<table class='main_question_table' id='question" + q_idx + "' border='0' cellspacing='0' cellpadding='0'>"
					+ "<tr>"
					+ "<td class='question_number'>Q<span id='question_num" + q_idx + "'></span></td>"
					+ "<td class = 'question_title'><input type='text' class='question_title' placeholder='질문을 입력하세요.' name='main_question_title" + q_idx + "'></td>"
					+ "</tr>"
					+ "</table>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<table class = 'option_table' id='option" + q_idx + "' border='0' cellspacing='0' cellpadding='0'>"
					+ "<tr>"
					+ "<td class='blank'>O</td>"
					+ "<td class='option'><input type='text' class='option_content' placeholder='항목' name='option" + q_idx + "_0'></td>"
					+ "<td class='create_delete_option'>"
					+ "<input type='button' class='create_delete_option' onClick='addOption(" + q_idx + ")' value='+'>"
					+ "<input type='button' class='create_delete_option' onClick='removeOption(" + q_idx + ")' value='-'>"
					+ "</td>"
					+ "</tr>"
					+ "</table>"
					+ "</div>"
					+ "<label for='multi_res" + q_idx + "'>중복 응답</label>"
					+ "<input type='checkbox' name='multi_res" + q_idx + "' id='multi_res" + q_idx + "' value='1'>"
					+ "<label for='necessary" + q_idx + "'>필수 응답</label>"
					+ "<input type='checkbox' name='necessary" + q_idx + "' id='necessary" + q_idx + "' value='1'>"
					+ "<label for='shuffle" + q_idx + "'>무작위</label>"
					+ "<input type='checkbox' name='shuffle" + q_idx + "' id='shuffle" + q_idx + "' value='1'>"
					+ "<input type='hidden' id='questionIndex' value='"+ q_idx + "'>"
					+ "<input type='hidden' name='option_count" + q_idx + "' id='option_count" + q_idx + "' value='1'>"
					+ "<input type='button' class='btn' value='질문 제거' onclick='removeQuestion()'>"
					+ "</div>";
			
				return multiple;
		}

		function shortanswer(q_idx) {
			var shortanswer = "<div class='shortanswer' id='shortanswer" + q_idx + "'>"
					+ "<div class='form-group'>"
					+ "<select id='type" + q_idx + "' name='type" + q_idx + "' onchange='changeType(" + q_idx + ")'>"
					+ "<option value='multiple'>객관식</option>"
					+ "<option value='shortanswer'>주관식</option>"
					+ "<option value='matrix'>행렬형</option>"
					+ "</select>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<table class='question_table' id='question" + q_idx + "' border='0' cellspacing='0' cellpadding='0'>"
					+ "<tr>"
					+ "<td class='question_number'>Q<span id='question_num" + q_idx + "'></span></td>"
					+ "<td class = 'question_title'><input type='text' class='question_title' placeholder='질문을 입력하세요.' name='main_question_title" + q_idx + "'></td>"
					+ "</tr>"
					+ "</table>"
					+ "</div>"
					+ "<label for='necessary" + q_idx + "'>필수 응답</label>"
					+ "<input type='checkbox' name='necessary" + q_idx + "' id='necessary" + q_idx + "' value='1'>"
					+ "<input type='hidden' id='questionIndex' value='"+ q_idx + "'>"
					+ "<input type='button' class='btn' value='질문 제거' onclick='removeQuestion()'>"
					+ "</div>";

			return shortanswer;
		}

		function matrix(q_idx) {
			var matrix = "<div class='matrix' id='matrix" + q_idx + "'>"
					+ "<div class='form-group'>"
					+ "<select id='type" + q_idx + "' name='type" + q_idx + "' onchange='changeType(" + q_idx + ")'>"
					+ "<option value='multiple'>객관식</option>"
					+ "<option value='shortanswer'>주관식</option>"
					+ "<option value='matrix'>행렬형</option>"
					+ "</select>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<table class = 'title_question_table' id='main_question_title" + q_idx + "' border='0' cellspacing='0' cellpadding='0'>"
					+ "<tr>"
					+ "<td class='question_number'>Q<span id='question_num" + q_idx + "'></span></td>"
					+ "<td class = 'question_title'><input type='text' class='question_title' placeholder='대표 질문을 입력하세요.' name='main_question_title" + q_idx + "'></td>"
					+ "</tr>"
					+ "</table>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<table class = 'question_table' id='question" + q_idx + "' border='0' cellspacing='0' cellpadding='0'>"
					+ "<tr>"
					+ "<td class='question_number'></td>"
					+ "<td class = 'question_title'><input type='text' class='question_title' placeholder='질문을 입력하세요.' name='question_title" + q_idx + "_0'></td>"
					+ "<td class='create_delete_question'>"
					+ "<input type='button' class='create_delete_question' onClick='addMatrixQuestion(" + q_idx + ")' value='+'>"
					+ "<input type='button' class='create_delete_question' onClick='removeMatrixQuestion(" + q_idx + ")' value='-'>"
					+ "</td>"
					+ "</tr>"
					+ "</table>"
					+ "</div>"
					+ "<div class='form-group'>"
					+ "<table class = 'option_table' id='option" + q_idx + "' border='0' cellspacing='0' cellpadding='0'>"
					+ "<tr>"
					+ "<td class='blank'>O</td>"
					+ "<td class='option'><input type='text' class='option_content' placeholder='항목' name='option" + q_idx + "_0'></td>"
					+ "<td class='create_delete_option'>"
					+ "<input type='button' class='create_delete_option' onClick='addOption(" + q_idx + ")' value='+'>"
					+ "<input type='button' class='create_delete_option' onClick='removeOption(" + q_idx + ")' value='-'>"
					+ "</td>"
					+ "</tr>"
					+ "</table>"
					+ "</div>"
					+ "<label for='multi_res" + q_idx + "'>중복 응답</label>"
					+ "<input type='checkbox' name='multi_res" + q_idx + "' id='multi_res" + q_idx + "' value='1'>"
					+ "<label for='necessary" + q_idx + "'>필수 응답</label>"
					+ "<input type='checkbox' name='necessary" + q_idx + "' id='necessary" + q_idx + "' value='1'>"
					+ "<label for='shuffle" + q_idx + "'>무작위</label>"
					+ "<input type='checkbox' name='shuffle" + q_idx + "' id='shuffle" + q_idx + "' value='1'>"
					+ "<input type='hidden' id='questionIndex' value='"+ q_idx + "'>"
					+ "<input type='hidden' name='question_count" + q_idx + "' id='question_count" + q_idx + "' value='1'>"
					+ "<input type='hidden' name='option_count" + q_idx + "' id='option_count" + q_idx + "' value='1'>"
					+ "<input type='button' class='btn' value='질문 제거' onclick='removeQuestion()'>"
					+ "</div>";

			return matrix;
		}
		
		function overClick() {
		     if (click) {
		          console.log("클릭됨");
		          click = !click;
		     } else {
		          console.log("중복됨");
		     }
		}
		
	</script>
</body>
</html>