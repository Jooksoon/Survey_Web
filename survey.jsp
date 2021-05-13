<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.sql.*, DB.connection.DBConnection, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>폴인사이트</title>
<link rel="stylesheet" href="css/survey.css">
</head>
<body>
	<header>
		<h1>폴인사이트</h1>
	</header>
	<form id="form" method="get" action="#">
		<div class="surveypaper-header">
			<div class="progress">
				<div id="progress-text">
					<div style="float: left;">진행률</div>
					<div style="float: right;">60%</div>
				</div>
				<div id="progress-behind">
					<div id="progress-front"></div>
				</div>
			</div>
		</div>
		<div class='questions' id='questions'></div>
		<div class="surveypaper-footer">
			<button id="prev-btn" type="submit" value="submit">이전</button>
			<button id="next-btn" type="submit" value="submit">다음</button>
		</div>
	</form>

	<script>
	function addQuestion(question_id) {
		let questions = document.getElementById('questions');
		
		let question = document.createElement('div');
		question.className = "question";

		question.innerHTML = "<table class='question_table' id='question_table" + question_id + "'></table>"
		
		questions.appendChild(question);
	}

	function addTitle(question_id, title){
		let table = document.getElementById("question_table" + question_id);
			
		let rowlen = table.rows.length + 1;
			
		// var row = table.insertRow(); // IE와 Chrome 동작을 달리함.
		let row = table.insertRow(rowlen - 1); // HTML에서의 권장 표준 문법
			
		let newcell = row.insertCell(0);
		newcell.innerHTML = title;
		newcell.className = "title";
	}
	
	function addOption(question_id, contents, value, order){
		let table = document.getElementById("question_table" + question_id);
			
		let rowlen = table.rows.length + 1;
			
		// var row = table.insertRow(); // IE와 Chrome 동작을 달리함.
		let row = table.insertRow(rowlen - 1); // HTML에서의 권장 표준 문법
			
		let newcell = row.insertCell(0);
		newcell.innerHTML = "<input type='radio' id='option" + question_id + "_" + order + "' name='option" + question_id + "' value = " + value + "></input>" 
		+ "<label for='option" + question_id + "_" + order + "'>" + contents + "</label>";
		newcell.className = "options";
	}
	
	function addTextArea(question_id){
		let table = document.getElementById("question_table" + question_id);
		
		let rowlen = table.rows.length + 1;
			
		// var row = table.insertRow(); // IE와 Chrome 동작을 달리함.
		let row = table.insertRow(rowlen - 1); // HTML에서의 권장 표준 문법
			
		let newcell = row.insertCell(0);
		newcell.innerHTML = "<textarea class='textarea' id='answer" + question_id + "'></textarea>";
		newcell.className = "textarea";
	}
	
	function addMatrixOption(question_id, contents){
		let table = document.getElementById("question_table" + question_id);
		
		let rowlen = table.rows.length + 1;
			
		let row;
		if(rowlen < 3){
			// var row = table.insertRow(); // IE와 Chrome 동작을 달리함.
			row = table.insertRow(rowlen - 1); // HTML에서의 권장 표준 문법
			
			let newcell = row.insertCell(0);
			newcell.className = "blank";
		} else {
			row = table.rows[1];
		}
			
		let newcell = row.insertCell(1);
		newcell.innerHTML = contents;
		newcell.className = "option_title";
	}
	
	function addMatrixQuestion(question_id, title, num_of_option, order){
		let table = document.getElementById("question_table" + question_id);
		
		let rowlen = table.rows.length + 1;
			
		// var row = table.insertRow(); // IE와 Chrome 동작을 달리함.
		let row = table.insertRow(rowlen - 1); // HTML에서의 권장 표준 문법
			
		let newcell = row.insertCell(0);
		newcell.innerHTML = title;
		newcell.className = "inner_title";
		
		for(let i = 1; i <= num_of_option; i++){
			newcell = row.insertCell(i);
			newcell.innerHTML = "<input type='radio' id='option' name='option" + question_id + "_" + order +"' value=''>";
			newcell.className = "matrix_options";
		}
	}
	
	function setValue(question_id, col, cell ,value){
		let table = document.getElementById("question_table" + question_id);
		
		let opt = table.rows[col].cells[cell].querySelector("input");
		
		opt.value = value;
	}
	</script>
<%
int form_id = Integer.parseInt(request.getParameter("form_id"));

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

ArrayList<Integer> questions = new ArrayList<>();
ArrayList<Integer> options = new ArrayList<>();
int group = 0;

try {
	// 커넥션을 가져온다.
	conn = DBConnection.getConnection();

	// 자동 커밋을 false로 한다.
	conn.setAutoCommit(false);

	StringBuffer sql = new StringBuffer();
	sql.append("SELECT i.question_id FROM include i WHERE i.form_id = ?;");

	pstmt = conn.prepareStatement(sql.toString());
	pstmt.setInt(1, form_id);

	rs = pstmt.executeQuery();

	while (rs.next()) {
		questions.add(Integer.valueOf(rs.getInt(1))); // question_id
	}

	for (int i = 0; i < questions.size(); i++) {
		%>
			<script>addQuestion(<%=questions.get(i)%>);</script>
		<%
		sql = new StringBuffer();
		sql.append("SELECT * FROM question q WHERE q.question_id = ?");

		pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1, questions.get(i));

		rs = pstmt.executeQuery();

		while (rs.next()) {
			String title = rs.getString("title");
			String type = rs.getString("type");

			%>
				<script>addTitle(<%=questions.get(i)%>, '<%=title%>');</script>
			<%
			
			int order = 1;
			
			switch (type) {
			case "multiple" :
				group = rs.getInt("option_group_id");
		
				sql = new StringBuffer();
				sql.append("SELECT o.* FROM option o, option_grouping og WHERE og.option_group_id = ? AND og.option_id = o.option_id;");

				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, group);
	
				rs = pstmt.executeQuery();
				
				order = 1;
				
				while (rs.next()) {
					int value = rs.getInt(1);
					String contents = rs.getString("contents");
					
					%>
					<script>addOption(<%=questions.get(i)%>, '<%=contents%>', <%=value%> , <%=order++%>);</script>
					<%
				}
				break;
			
			case "shortanswer" :
				%>
				<script>addTextArea(<%=questions.get(i)%>);</script>
				<%
				break;
			
			case "matrix" :
				group = rs.getInt("option_group_id");
				
				sql = new StringBuffer();
				sql.append("SELECT o.* FROM option o, option_grouping og WHERE og.option_group_id = ? AND og.option_id = o.option_id ORDER BY og.option_num DESC;");
	
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, group);
	
				rs = pstmt.executeQuery();
				
				// 옵션 불러오기
				while (rs.next()) {
					int value = rs.getInt(1);
					String contents = rs.getString("contents");
					
					options.add(Integer.valueOf(value));
					
					%>
					<script>addMatrixOption(<%=questions.get(i)%>, '<%=contents%>');</script>
					<%
				}
				
				sql = new StringBuffer();
				sql.append("SELECT q.title FROM question q, matrix_rel m WHERE m.main_question = ? AND m.sub_question = q.question_id;");
	
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, questions.get(i));
	
				rs = pstmt.executeQuery();
				
				order = 1;
				
				// 질문 불러오기
				while (rs.next()) {
					String inner_title = rs.getString("title");
					%>
					<script>addMatrixQuestion(<%=questions.get(i)%>, '<%=inner_title%>', <%=options.size()%>,<%=order++%>);</script>
					<%
				}
				
				for(int j = 2; j <= options.size(); j++){
					for(int k = 1; k <= order; k++){
						%>
						<script>setValue(<%=questions.get(i)%>, <%=j%>, <%=k%>, <%=options.get(options.size() - k)%>);</script>
						<%
					}
				}
				
				
				options.clear();
				break;
				}
			}
		}
	}
	 finally {
	// Connection, PreparedStatement를 닫는다.
	try {
		if (rs != null) {
	rs.close();
	rs = null;
		}
		if (pstmt != null) {
	pstmt.close();
	pstmt = null;
		}
		if (conn != null) {
	conn.close();
	conn = null;
		}
	} catch (Exception e) {
		throw new RuntimeException(e.getMessage());
	}
} // end try~catch
%>
</body>
</html>