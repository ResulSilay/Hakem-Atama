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
    String makale_alan = "-1";
    String makale_ID = String.valueOf(request.getParameter("id"));
    String islem_kabul = request.getParameter("btn_islem_kabul");
    String islem_red = request.getParameter("btn_islem_red");
    try {
        if (Integer.valueOf(islem_kabul) ==1) {
            String query = "update makaleler set hakem_onay_tarih='" + db.get_Date() + "',durum_hakem=1 where id=" + makale_ID;
            status = db.set_Command(query);
            //hakem puan 1 artır.
            db.set_Command("call mddb.sp_hakem_puan_artir("+AccountID+")");

            if (status)
                response.sendRedirect("../kabuller/list.jsp");
        }
        if (Integer.valueOf(islem_red) ==2) {

            String query = "update makaleler set hakem_ID=0,durum_hakem=0 where id=" + makale_ID;
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
                <h6 class="display-4">Hakem Panel</h6>
            </div>
            <div class="row">
                <div class="col-sm-9 shadow" style="background-color:white;padding: 0px;">
                    <p class="title">
                        Kabul Edilenler
                    </p>
                    <hr>
                    <div class="content">
                        <div class="container" style="padding: 0px;">

                            <form action="kabul.jsp" method="post">
                                <%
                                    ResultSet rs = db.get_List("select * from view_makaleler where id=" + makale_ID);
                                    while (rs.next()) {
                                        makale_alan = rs.getString("alan");
                                %>
                                <input name="id" type="text" class="form-control" value="<%=rs.getString("id")%>" style="display: none">

                                <div class="form-group">
                                        <label>Başlık</label>
                                        <input type="text" class="form-control" value="<%=rs.getString("baslik")%>">
                                    </div>

                                    <div class="form-group">
                                        <label>Yazar</label>
                                        <input type="text" class="form-control" value="<%=rs.getString("yazar_ad_soyad")%>">
                                    </div>


                                    <div class="form-group">
                                        <label>Editör</label>
                                        <input type="text" class="form-control"
                                               value="<%=rs.getString("editor_ad_soyad")%>">
                                    </div>
                                    <div class="form-group">
                                        <label>Yükleme Tarih</label>
                                        <input type="text" class="form-control" value="<%=rs.getString("yukleme_tarih")%>">
                                    </div>
                                <%}%>

                                <br>
                                <br>
                                <button name="btn_islem_kabul" value="1" type="submit" class="btn btn-primary">Kabul Et</button>
                                <button name="btn_islem_red" value="2" type="submit" class="btn btn-primary">Reddet</button>

                            </form>
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
