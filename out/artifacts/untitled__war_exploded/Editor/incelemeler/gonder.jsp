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
    String islem = request.getParameter("btn_islem");
    try {
        if (Integer.valueOf(islem) == 1) {
            String hakem_ID = String.valueOf(request.getParameter("select_hakem"));
            String query = "update makaleler set hakem_ID='" + hakem_ID + "',hakem_atama_tarih='" + db.get_Date() + "',durum=3 where id=" + makale_ID;
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
                <h6 class="display-4">Editor Panel</h6>
            </div>
            <div class="row">
                <div class="col-sm-9 shadow" style="background-color:white;padding: 0px;">
                    <p class="title">
                        Makale - Hakem Atama
                    </p>
                    <hr>
                    <div class="content">
                        <div class="container" style="padding: 0px;">
                            <form action="gonder.jsp" method="post">
                                <%
                                    ResultSet rs = db.get_List("select * from view_makaleler where id=" + makale_ID);
                                    while (rs.next()) {
                                        makale_alan = rs.getString("alan");
                                %>
                                <input name="id" type="text" class="form-control" value="<%=rs.getString("id")%>"
                                       style="display: none">

                                <div class="form-group">
                                    <label>Başlık</label>
                                    <input readonly="readonly" type="text" class="form-control"
                                           value="<%=rs.getString("baslik")%>">
                                </div>

                                <div class="form-group">
                                    <label>Yazar</label>
                                    <input readonly="readonly" type="text" class="form-control"
                                           value="<%=rs.getString("yazar_ad_soyad")%>">
                                </div>


                                <div class="form-group">
                                    <label>Editör</label>
                                    <input readonly="readonly" type="text" class="form-control"
                                           value="<%=rs.getString("editor_ad_soyad")%>">
                                </div>
                                <div class="form-group">
                                    <label>Yükleme Tarih</label>
                                    <input readonly="readonly" type="text" class="form-control"
                                           value="<%=rs.getString("yukleme_tarih")%>">
                                </div>

                                <embed width="100%" height="500px" name="plugin"
                                       src="${pageContext.request.contextPath}/upload/<%=rs.getString("makale") %>"
                                       type="application/pdf">
                                </br>
                                </br>
                                <%}%>
                                <div class="alert alert-success" role="alert">
                                    <h4 class="alert-heading">Hatırlatma</h4>
                                    <hr>
                                    <p class="mb-0">Hakem listesi puan sıralamasına göre listelenmiştir.</p>
                                </div>
                                <select name="select_hakem" id="select_hakem" class="form-control form-control-sm">
                                    <option>Hakem Seç</option>
                                    <%
                                        ResultSet rs2 = db.get_List("select id,ad_soyad,puan from hakemler order by puan desc");
                                        while (rs2.next()) { %>
                                    <option value="<%=rs2.getString("id") %>"><%=rs2.getString("puan") %>
                                        - <%=rs2.getString("ad_soyad") %>
                                    </option>
                                    <%}%>
                                </select>
                                <br>

                                <button name="btn_islem" value="1" type="submit" class="btn btn-primary">Hakem Ata
                                </button>
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
