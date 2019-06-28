<%@ page pageEncoding="UTF-8" %>
<!doctype html>
<html lang="tr">
<head>
    <meta charset="utf-8">
    <title>Giris</title>

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
    String action = request.getParameter("btn_login");

    try {
        db.set_Command("call mddb.sp_asama_1();");  //5 gün içerisinde onaylanmayan makaleler RED edilir.
        db.set_Command("call mddb.sp_asama_2();");  //14. günde mail atılacak hakem onayı yapılmış sadece sonuç raporu beklenen hakemler listelenerek mail gönderilmesi sağlanır.
        db.set_Command("call mddb.sp_asama_3();");  //21 içerisinde sonuç raporu yüklemeyen hakemler için makaleler RED edilir ve puanları düşürülür.

        //db.auto_Mail(); //bu metod, Makale onayı yapılmış ama sonuç raporu yüklenmemiş Hakemlere 14. gününde bilgilendirme mesajı atmaktadır.
    } catch (Exception e) {
    }

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

        boolean status = db.Login(table, username, pass);
        if (status) {
            int ID = db.get_Account_ID(table, username, pass);
            db.get_Value_Int("select type from " + table + " where id=" + ID, 0);
            session.setAttribute("AccountID", ID);
            session.setAttribute("AccountType", tip);

            //Editor: Editor - editor
            //Hakem:  Kemal - 123

            //Yazar:  Resul - 123
            //        Mert - 123
            //        Emre - 123


            if (tip == 1) {
                response.sendRedirect("../Editor/makaleler/list.jsp");
            } else if (tip == 2) {
                response.sendRedirect("../Hakem/makaleler/istekler.jsp");
            } else if (tip == 3) {
                response.sendRedirect("../Yazar/makaleler/list.jsp");
            }
        } else {
            mesaj = "Kullanici adi veya sifre hatali.";
        }
    }
%>

<form action="login.jsp" method="post" class="form-signin">
    <div class="cardShadow">
        <div style="text-align: center;">
            <img class="mb-4" src="${pageContext.request.contextPath}/webroot/img/logo.png" alt="logo">
        </div>
        <h1 class="h3 mb-3 font-weight-normal" style="font-weight: 300">Giris Paneli</h1>
        <select style="margin-bottom: 5px;" name="select_kullanici_tipi" id="select_kullanici_tipi"
                class="form-control form-control-sm">
            <option value="1" selected="selected">Editor</option>
            <option value="2">Hakem</option>
            <option value="3">Yazar</option>
        </select>
        <label for="username" class="sr-only">e-posta adresi</label>
        <input style="margin-bottom: 5px;" type="text" id="username" name="username" class="form-control"
               placeholder="Kullanıcı adı" required autofocus>
        <label for="pass" class="sr-only">sifre</label>
        <input type="password" id="pass" name="pass" class="form-control"
               placeholder="Şifre" required>
        <div class="checkbox mb-3">
            <label style="display: none">
                <input type="checkbox" value="remember-me"> Beni Hatirla
            </label>
            <label>
                <%=mesaj%>
            </label>
        </div>
        <button id="btn_login" name="btn_login" value="1" class="btn btn-lg btn-primary btn-block" type="submit">Giris
        </button>
        </br>
        <a href="register.jsp">
            Kayit Ol
        </a>
    </div>
    </br>
    <p class="text-muted">Hakem Atama Sistemi @2019</p>

</form>
</body>
</html>