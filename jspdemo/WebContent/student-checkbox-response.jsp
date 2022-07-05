<html>

<head><title>Student Confirmation Title</title></head>

<body>

The Student is confirmed : ${param.firstname} ${param.lastname}

<br/><br/>
Favorite Programming Language:<br/>
<!-- Display list of favorite languages -->

<ul>

	<%
		String[] langs = request.getParameterValues("favoritelanguage");
	
	for(String tempLang : langs) {
		out.println("<li>"+tempLang+"</li>");
	}
	
	%>

</ul>

</body>

</html>