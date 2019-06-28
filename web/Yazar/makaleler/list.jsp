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
                        Makalelerim
                    </p>
                    <hr>
                    <div>
                        <div class="container" style="padding: 0px;">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">id</th>
                                    <th scope="col">Baslik</th>
                                    <th scope="col">Alan</th>
                                    <th scope="col">Yukleme Tarih</th>
                                    <!--<th scope="col">Editor Atama Tarih</th>
                                    <th scope="col">Hakem Atama Tarih</th>
                                    -->
                                    <th scope="col">Durum</th>
                                    <th scope="col"></th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    ResultSet rs = db.get_List("select * from view_makaleler where yazar_ID=" + AccountID);
                                    while (rs.next()) { %>
                                <tr>
                                    <th scope="row"><%=rs.getString("id") %>
                                    </th>
                                    <td><%=rs.getString("baslik") %>
                                    </td>
                                    <td><%=rs.getString("alan") %>
                                    </td>
                                    <td><%=rs.getString("yukleme_tarih") %>
                                    </td>
                                    <!--<td><%=rs.getString("editor_atama_tarih") %>
                                    </td>
                                    <td><%=rs.getString("hakem_atama_tarih") %>
                                    </td>
                                    -->
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
                                    <td>
                                        <a href="detail.jsp?id=<%=rs.getString("id") %>"
                                           style="display: none;">Detay</a>
                                        <a href="duzenle.jsp?id=<%=rs.getString("id") %>">Düzenle</a> |
                                        <a href="list.jsp?type=1&id=<%=rs.getString("id")%>"></a>
                                        <a href="sil.jsp?id=<%=rs.getString("id")%>">Sil</a>
                                    </td>
                                </tr>
                                <%} %>
                                </tbody>
                            </table>
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
