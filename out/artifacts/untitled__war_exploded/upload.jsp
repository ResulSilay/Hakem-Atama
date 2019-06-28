<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Dosya Yükle</title>
</head>
<body style="padding: 55px">
<center>
    <form method="post" action="uploadFile" enctype="multipart/form-data">
        Lütfen dosya seçiniz.
        <input style="padding: 15px; border-radius: 25px; background-color: lightgray" type="file" name="uploadFile" class="btn-dark"/>
        <br/><br/>
        <input type="submit" value="Y Ü K L E" class="btn-success" style="border-radius: 10px; padding: 10px;"/>
    </form>
</center>
</body>
</html>