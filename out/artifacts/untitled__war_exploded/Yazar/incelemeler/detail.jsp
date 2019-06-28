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
    boolean status = false;
    String AccountID = String.valueOf(session.getAttribute("AccountID"));
    String makale_ID = "";
    try {
        makale_ID = request.getParameter("id");

    } catch (Exception e) {
    }
%>

<div class="container-fluid" style="background-color:transparent; height: 60px">
    <div>
        <div class="container p-3 mb-5 rounded">
            <div>
                <h6 class="display-4">Yazar Panel</h6>
            </div>
            <div class="row">
                <div class="col-sm-9 shadow" style="background-color:white;padding: 0px;">
                    <p class="title">
                        İnceleme Detay
                    </p>
                    <hr>
                    <div class="content">
                        <div class="container" style="padding: 0px;">
                            <%
                                ResultSet rs = db.get_List("select * from view_makaleler where id=" + makale_ID);
                                while (rs.next()) { %>
                            <div class="form-group">
                                <label>Başlık</label>
                                <input type="text" class="form-control" value="<%=rs.getString("baslik")%>">
                            </div>

                            <div class="form-group">
                                <label>Editör</label>
                                <input type="text" class="form-control"
                                       value="<%=rs.getString("editor_ad_soyad")%>">
                            </div>

                            <div class="form-group">
                                <label>Hakem</label>
                                <input type="text" class="form-control" value="<%=rs.getString("hakem_ad_soyad")%>">
                            </div>

                            <div class="form-group">
                                <label>Yükleme Tarih</label>
                                <input type="text" class="form-control" value="<%=rs.getString("yukleme_tarih")%>">
                            </div>

                            <div class="form-group">
                                <label>Editör Atama Tarih</label>
                                <input type="text" class="form-control" value="<%=rs.getString("editor_atama_tarih")%>">
                            </div>

                            <div class="form-group">
                                <label>Hakem Atama Tarih</label>
                                <input type="text" class="form-control" value="<%=rs.getString("hakem_atama_tarih")%>">
                            </div>

                            <div class="form-group">
                                <label>Sonuc Tarih</label>
                                <input type="text" class="form-control" value="<%=rs.getString("sonuc_tarih")%>">
                            </div>

                            <% int a = rs.getInt("durum");
                                String durum = null;
                                if (a == 1)
                                    durum = ("Beklemede");
                                else if (a == 2)
                                    durum = ("Editörde");
                                else if (a == 2)
                                    durum = ("Hakemde");
                            %>

                            <div class="form-group">
                                <label>Durum</label>
                                <input type="text" class="form-control" value="<%=durum%>">
                            </div>
                            <%}%>
                        </div>
                    </div>

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
