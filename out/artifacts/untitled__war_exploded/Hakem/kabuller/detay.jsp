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
    String makale_ID = String.valueOf(request.getParameter("id"));
    String islem_tamamla = request.getParameter("btn_success");
    String islem_iptal = request.getParameter("btn_cancel");
    try {
        if (Integer.valueOf(islem_tamamla) == 1) {
            String dosya = session.getAttribute("fileName").toString();
            String query = "update makaleler set sonuc_tarih='" + db.get_Date() + "',sonuc_rapor='" + dosya + "',durum_sonuc=1 where id=" + makale_ID;
            status = db.set_Command(query);
            db.set_Command("call mddb.sp_hakem_puan_azalt(" + AccountID + ");");    //puan artırma prosedürü çağrılıyor.

            if (status)
                response.sendRedirect("list.jsp");
        }
        if (Integer.valueOf(islem_iptal) == 2) {
            String query = "update makaleler set sonuc_tarih='',sonuc_rapor='',durum_sonuc=0 where id=" + makale_ID;
            status = db.set_Command(query);
            if (status)
                response.sendRedirect("list.jsp");
        }
    } catch (Exception e) {
    }
%>

<div class="container-fluid" style="background-color:transparent; height: 60px">
    <div>
        <div class="container p-3 mb-5 rounded">
            <div>
                <h6 class="display-4">Hakem Paneli</h6>
            </div>
            <div class="row">
                <div class="col-sm-9 shadow" style="background-color:white;padding: 0px;">
                    <p class="title">
                        Makale Detay ve Sonuçlandırma
                    </p>
                    <hr>
                    <div class="content">
                        <div class="container" style="padding: 0px;">

                            <div class="alert alert-info" role="alert">
                                <h4 class="alert-heading">Hatırlatma</h4>
                                <hr>
                                <p class="mb-0">21 gün içerisinde sonuç raporunu yüklemeyi unutmayınız.</p>
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
                                <input readonly="readonly" type="text" readonly="readonly" class="form-control"
                                       id="txt_tarih"
                                       placeholder="1234 Main St" value="<%=durum%>">
                            </div>

                            <label for="txt_tarih">Durum</label>
                            <embed width="100%" height="500px" name="plugin"
                                   src="${pageContext.request.contextPath}/upload/<%=rs.getString("makale") %>"
                                   type="application/pdf">
                            </br>
                            </br>
                            </br>

                            <label for="txt_tarih">Sonuç Raporu</label>
                            <embed width="100%" height="500px" name="plugin"
                                   src="${pageContext.request.contextPath}/upload/<%=rs.getString("sonuc_rapor") %>"
                                   type="application/pdf">
                            <%}%>
                            </br>
                            </br>

                            <div>
                                <button class="btn btn-primary" href='#'
                                        onclick='javascript:window.open("${pageContext.request.contextPath}/upload.jsp", "_blank", "scrollbars=1,resizable=1,height=300,width=450");'
                                        title='Yükle'>Sonuç Raporu Yükle
                                </button>
                                </br>
                                </br>
                                <form action="detay.jsp?id=<%=makale_ID%>" method="post">
                                    <button name="btn_success" id="btn_success" value="1" type="submit"
                                            class="btn btn-success">Sonuçlandır
                                    </button>
                                </form>
                            </div>
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
</div>
</body>
</html>
