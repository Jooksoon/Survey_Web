<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="model.form.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>form-info</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	FormDAO dao = FormDAO.getInstance();
	Form form = null;


	String title = null;
	String description = null;
	int form_id = 0;
	
	title = request.getParameter("title");
	description = request.getParameter("description");
	
	form = new Form(title, description);
	form_id = dao.insertForm(form);
	%>

	<script>
	var parent = window.opener;
	parent.location.href = "makeForm.jsp?form_id=" + <%=form_id%>;
	window.close();
	</script>
</body>
</html>