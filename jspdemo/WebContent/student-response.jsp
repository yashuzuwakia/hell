<html>

<head><title>Student Confirmation Title</title></head>

<body>

The Student is confirmed : ${param.firstname} ${param.lastname}

<!--Alternative way-->
The Student is confirmed : <%= request.getParameter("firstname") %> <%= request.getParameter("lastname") %>

</body>

</html>