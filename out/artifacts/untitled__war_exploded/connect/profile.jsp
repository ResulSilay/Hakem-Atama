<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Profil</title>
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

    String AccountID = String.valueOf(session.getAttribute("AccountID"));
    String name = db.get_Value("select username from kullanicilar where id=" + AccountID, 1);

    String action = request.getParameter("btn_update");
    if (action != null) {
        String pass = request.getParameter("pass");
        String pass_tekrar = request.getParameter("pass_tekrar");

        if(pass.equals(pass_tekrar)) {
            String query = "update qbdb.kullanicilar set password='" + pass + "' where id=" + AccountID;
            boolean status = db.set_Command(query);
            if (status)
                response.sendRedirect("login.jsp");
        }
        else
        {
            mesaj="Sifreler eslesmiyor. Kontrol ediniz.";
        }
    }
%>

<form action="profile.jsp" method="post" class="form-signin">
    <img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">Profil</h1>
    <label>
        <%=mesaj%>
    </label>
    <label for="username" class="sr-only">kullanici adi</label>
    <input type="text" id="username" name="username" class="form-control" readonly="readonly" placeholder="Username"
           value="<%=name%>" required autofocus>
    <label for="pass" class="sr-only">sifre</label>
    <input type="password" id="pass" name="pass" class="form-control" placeholder="Password" required>
    <label for="pass" class="sr-only">sifre tekrar</label>
    <input type="password" id="pass_tekrar" name="pass_tekrar" class="form-control" placeholder="Password" required>
    <button id="btn_update" name="btn_update" value="1" class="btn btn-lg btn-primary btn-block" type="submit">Kaydet
    </button>
    <p class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>
</form>
</body>
</html>
