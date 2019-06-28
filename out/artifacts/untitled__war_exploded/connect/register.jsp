<%@ page pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Kayit Ol</title>
    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webroot/css/signin.css" rel="stylesheet">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <link href="signin.css" rel="stylesheet">


</head>
<body class="text-center">

<jsp:useBean id="db" class="methods.database"></jsp:useBean>
<%
    String mesaj = "";
    String action = request.getParameter("btn_register");
    if (action != null) {
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        int tip = Integer.parseInt(request.getParameter("select_kullanici_tipi"));
        String table = "editorler";

        if (tip == 1)
            table = "editorler";
        else if (tip == 2)
            table = "hakemler";
        else if (tip == 3)
            table = "yazarlar";

        String query = "INSERT INTO " + table + " (username, password) VALUES ('" + username + "', '" + pass + "')";
        boolean status = db.set_Command(query);
        if (status)
            response.sendRedirect("login.jsp");
        else
            mesaj = "Kayıt edilemedi, lütfen tekrar deneyiniz.";
    }
%>

<form action="register.jsp" method="post" class="form-signin">
    <div class="cardShadow">
        <div style="text-align: center;">
            <img class="mb-4" src="${pageContext.request.contextPath}/webroot/img/logo.png" alt="logo"/>
        </div>
        <h1 class="h3 mb-3 font-weight-normal">Kayıt Paneli</h1>

        <select style="margin-bottom: 5px;" name="select_kullanici_tipi" id="select_kullanici_tipi"
                class="form-control form-control-sm">
            <option value="1" selected="selected">Editor</option>
            <option value="2">Hakem</option>
            <option value="3">Yazar</option>
        </select>

        <label for="username" class="sr-only">kullanici adi</label>
        <input style="margin-bottom: 5px;" type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
        <label for="pass" class="sr-only">şifre</label>
        <input type="password" id="pass" name="pass" class="form-control" placeholder="Password" required>
        <button id="btn_register" name="btn_register" value="1" class="btn btn-lg btn-primary btn-block" type="submit">
            Kayıt
            Ol
        </button>

        <label for="pass" class="sr-only"><%=mesaj%>
        </label>

        <p class="mt-5 mb-3 text-muted">Hakem Atama Sistemi</p>
    </div>
</form>
</body>
</html>
