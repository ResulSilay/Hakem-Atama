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
                <h6 class="display-4">Hakem Panel</h6>
            </div>
            <div class="row">
                <div class="col-sm-9 shadow" style="background-color:white;padding: 0px;">
                    <p class="title">
                        Sonuç Detay
                    </p>
                    <hr>
                    <div class="content">
                        <div class="container" style="padding: 0px;">

                            <div class="alert alert-info" role="alert">
                                <h4 class="alert-heading">Sonuçlandırıldı</h4>
                                <hr>
                                <p class="mb-0">Bu makale sonuçlandırılmıştır.</p>
                            </div>

                            <%
                                ResultSet rs = db.get_List("select * from view_makaleler where id=" + makale_ID);
                                while (rs.next()) { %>
                            <div class="form-group">
                                <label>Başlık</label>
                                <input readonly="readonly" type="text" class="form-control"
                                       value="<%=rs.getString("baslik")%>">
                            </div>

                            <div class="form-group">
                                <label>Editör</label>
                                <input readonly="readonly" type="text" class="form-control"
                                       value="<%=rs.getString("editor_ad_soyad")%>">
                            </div>

                            <div class="form-group">
                                <label>Hakem</label>
                                <input readonly="readonly" type="text" class="form-control"
                                       value="<%=rs.getString("hakem_ad_soyad")%>">
                            </div>

                            <div class="form-group">
                                <label>Yükleme Tarih</label>
                                <input readonly="readonly" type="text" class="form-control"
                                       value="<%=rs.getString("yukleme_tarih")%>">
                            </div>

                            <div class="form-group">
                                <label>Editör Atama Tarih</label>
                                <input readonly="readonly" type="text" class="form-control"
                                       value="<%=rs.getString("editor_atama_tarih")%>">
                            </div>

                            <div class="form-group">
                                <label>Hakem Atama Tarih</label>
                                <input readonly="readonly" type="text" class="form-control"
                                       value="<%=rs.getString("hakem_atama_tarih")%>">
                            </div>

                            <div class="form-group">
                                <label>Hakem Onay Tarih</label>
                                <input readonly="readonly" type="text" class="form-control"
                                       value="<%=rs.getString("hakem_onay_tarih")%>">
                            </div>

                            <div class="form-group">
                                <label>Sonuçlandırma Tarih</label>
                                <input readonly="readonly" type="text" class="form-control"
                                       value="<%=rs.getString("sonuc_tarih")%>">
                            </div>

                            <div class="form-group">

                                <% int a = rs.getInt("durum");
                                    String durum = null;
                                    if (a == 1)
                                        durum = ("Beklemede");
                                    else if (a == 2)
                                        durum = ("Editörde");
                                    else if (a == 3)
                                        durum = ("Hakemde");
                                %>

                                <label for="txt_tarih">Durum</label>
                                <input readonly="readonly" class="form-control" id="txt_tarih"
                                       value="<%=durum%>">
                            </div>

                            <div class="form-group">

                                <% int a2 = rs.getInt("durum_sonuc");
                                    String durum2 = null;
                                    if (a2 == 1)
                                        durum2 = ("Sonuçlandırıldı");
                                    else
                                        durum2 = ("Beklemede");
                                %>

                                <label for="txt_tarih">Sonuç Durum</label>
                                <input readonly="readonly" class="form-control" id="txt_tarih"
                                       value="<%=durum2%>">
                            </div>
                            </br>
                            <label>Makale</label>
                            <embed width="100%" height="500px" name="plugin"
                                   src="${pageContext.request.contextPath}/upload/<%=rs.getString("makale") %>"
                                   type="application/pdf">
                            </br>
                            </br>

                            <label>Sonuç Raporu</label>
                            <embed width="100%" height="500px" name="plugin"
                                   src="${pageContext.request.contextPath}/upload/<%=rs.getString("sonuc_rapor") %>"
                                   type="application/pdf">
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
