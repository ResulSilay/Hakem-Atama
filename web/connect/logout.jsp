<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cikis</title>
</head>
<body>
<%
    session.setAttribute("AccountID", null);
    response.sendRedirect("login.jsp");
%>
</body>
</html>
