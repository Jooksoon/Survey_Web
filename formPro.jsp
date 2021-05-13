<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.sql.*,DB.connection.DBConnection, model.question.*, model.form.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>form</title>
</head>
<body>
	<%
	//불러올 내용
	request.setCharacterEncoding("utf-8");
	
	QuestionDAO qdao = QuestionDAO.getInstance();
	Question question = null;
	
	FormDAO fdao = FormDAO.getInstance();
	int form_id = Integer.parseInt(request.getParameter("form"));

	final String QUESTION_TYPE = "type";
	final String OPTION_COUNT = "option_count";
	final String OPTION = "option";
	final String QUESTION_TITLE = "question_title"; //matrix에서만 사용
	final String QUESTION_COUNT = "question_count"; //matrix에서만 사용
	final String MAIN_TITLE = "main_question_title";
	final String MULTIPLE_RES = "multi_res";
	final String NECESSARY = "necessary";
	final String SHUFFLE = "shuffle";

	int num_of_idx = Integer.parseInt(request.getParameter("num_of_index"));

	String title = null;
	String type = null;
	String q_title = null;
	int question_c = 0;
	String[] questions = null;
	int option_c = 0;
	String[] options = null;
	int mul_res = 0;
	int necessary = 0;
	int shuffle = 0;
	int option_group_id = 0;
	int question_id = 0;
	int sub_question_id = 0;

	for (int i = 0; i < num_of_idx; i++) {
		mul_res = 0;
		necessary = 0;
		shuffle = 0;
		
		int index = Integer.parseInt(request.getParameter("index" + i));

		title = request.getParameter(MAIN_TITLE + index);
		type = request.getParameter(QUESTION_TYPE + index);

		switch (type) {
		case "multiple": //객관식일때
			option_c = Integer.parseInt(request.getParameter(OPTION_COUNT + index));

			options = new String[option_c];
			for (int j = 0; j < options.length; j++) {
		options[j] = request.getParameter(OPTION + index + "_" + j);
			}

			mul_res = request.getParameter(MULTIPLE_RES + index)==null?0:1;
			necessary = request.getParameter(NECESSARY + index)==null?0:1;
			shuffle = request.getParameter(SHUFFLE + index)==null?0:1;
			
			break;
		case "shortanswer": //주관식일때
			necessary = request.getParameter(NECESSARY + index)==null?0:1;

			break;
		case "matrix": //행렬형일때
			question_c = Integer.parseInt(request.getParameter(QUESTION_COUNT + index));
			questions = new String[question_c];
			for (int k = 0; k < questions.length; k++) {
		questions[k] = request.getParameter(QUESTION_TITLE + index + "_" + k);
			}

			option_c = Integer.parseInt(request.getParameter(OPTION_COUNT + index));
			options = new String[option_c];
			for (int j = 0; j < options.length; j++) {
		options[j] = request.getParameter(OPTION + index + "_" + j);
			}

			mul_res = request.getParameter(MULTIPLE_RES + index)==null?0:1;
			necessary = request.getParameter(NECESSARY + index)==null?0:1;
			shuffle = request.getParameter(SHUFFLE + index)==null?0:1;
			break;
		}
		
		switch (type) {
		case "multiple": //객관식일때
			option_group_id = qdao.insertOptionGroup(option_c);

			for (int j = 0; j < options.length; j++) {
				int option_id = qdao.insertOption(options[j]);
				
				qdao.optionGrouping(option_id, option_group_id, j+1);
			}
			
			question = new Question(title, type, mul_res, necessary, shuffle);
			
			question_id = qdao.insertQuestion(question, option_group_id);
			
			break;
		case "shortanswer": //주관식일때
			question = new Question(title, type, mul_res, necessary, shuffle);
			
			question_id = qdao.insertQuestion(question);
			
			break;
		case "matrix": //행렬형일때
			option_group_id = qdao.insertOptionGroup(option_c);
		
			for (int j = 0; j< options.length; j++) {
				int option_id = qdao.insertOption(options[j]);
				
				qdao.optionGrouping(option_id, option_group_id, j+1);
			}
			
			question = new Question(title, type, mul_res, necessary, shuffle);
			
			question_id = qdao.insertQuestion(question, option_group_id);
			
			for (int j = 0; j < questions.length; j++) {
				question = new Question(questions[j], type, mul_res, necessary, shuffle);
				
				sub_question_id = qdao.insertQuestion(question);
				
				qdao.matrix(question_id, sub_question_id, j+1);
			}
			
			break;
		}
		
		fdao.include(form_id, question_id, i+1);
	}
	
	fdao.alterNumber(form_id, num_of_idx);
	%>
</body>
</html>