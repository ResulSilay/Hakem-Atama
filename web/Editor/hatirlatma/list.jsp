<%@ page import="java.sql.ResultSet" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Kullanici Panel</title>
    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webroot/css/site.css" rel="stylesheet">
</head>
<body>

<jsp:useBean id="db" class="methods.database"></jsp:useBean>

<%
    String AccountID = String.valueOf(session.getAttribute("AccountID"));
    try {
        String islem = request.getParameter("btn_islem");
        if (Integer.valueOf(islem) == 1) {
            db.auto_Mail();
        }
    } catch (Exception e) {
    }
%>

<div class="container-fluid" style="background-color:transparent; height: 60px">
    <div>
        <div class="container p-3 mb-5 rounded">
            <div>
                <h6 class="display-4">Editor Panel</h6>
            </div>
            <div class="row">
                <div class="col-sm-9 shadow" style="background-color:white;padding: 0px;">
                    <p class="title">
                        Bildirim Gönder
                    </p>
                    <hr>

                    <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading">Uyarı</h4>
                        <hr>
                        <p class="mb-0">Makale onayı alınmış Hakemler içerisinden 14. güne kadar sonuç raporu
                            yüklemeyenler için bilgilendirme mesajı gönderebilirsiniz.</p>
                        <hr>
                        <p class="mb-0"> (Bu sistem çağrısı login sayfası
                            yüklenmesi ile otomatik olarak çalışmaktadır).</p>
                    </div>

                    <form action="list.jsp" method="post">
                        <div>
                            <div class="container" style="padding: 0px;">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th scope="col">id</th>
                                        <th scope="col">Hakem ID</th>
                                        <th scope="col">Hakem Ad Soyad</th>
                                        <th scope="col">Baslik</th>
                                        <th scope="col">Hakem Atama Tarih</th>
                                        <th scope="col">Hakem Onay Tarih</th>
                                        <th scope="col">Durum</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        ResultSet rs = db.get_List("call mddb.sp_asama_2();");
                                        while (rs.next()) { %>
                                    <tr>
                                        <th scope="row"><%=rs.getString("id") %>
                                        </th>
                                        <td><%=rs.getString("hakem_ID") %>
                                        </td>
                                        <td><%=rs.getString("hakem_ad_soyad") %>
                                        </td>
                                        <td><%=rs.getString("baslik") %>
                                        </td>
                                        <td><%=rs.getString("hakem_atama_tarih") %>
                                        </td>
                                        <td><%=rs.getString("hakem_onay_tarih") %>
                                        </td>
                                        <td><% int a = rs.getInt("durum");
                                            String durum = null;
                                            if (a == 1)
                                                durum = ("Beklemede");
                                            else if (a == 2)
                                                durum = ("Editörde");
                                            else if (a == 3)
                                                durum = ("Hakemde");
                                        %>
                                            <%=durum%>
                                        </td>
                                    </tr>
                                    <%} %>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <button name="btn_islem" id="btn_islem" value="1" type="submit" class="btn btn-primary">Mail
                            Gönder
                        </button>
                    </form>

                </div>
                <div class="col-sm-3 shadow" style="background-color:#f7f7f7; padding: 0px;">
                    <jsp:include page="../master/menu.jsp"/>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
