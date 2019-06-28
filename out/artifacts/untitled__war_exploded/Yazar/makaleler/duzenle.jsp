<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9" %>
<% request.setCharacterEncoding("ISO-8859-9"); %>

<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<html>
<head>
    <title>Kullanici Panel</title>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webroot/css/site.css" rel="stylesheet">
</head>
<body>

<jsp:useBean id="db" class="methods.database"></jsp:useBean>

<%
    String id = request.getParameter("id");
    String action = request.getParameter("btn_action");
    System.out.println("action:" + action);
    System.out.println("id:" + id);
    if (action != null) {
        try {
            boolean status = false;
            String AccountID = String.valueOf(session.getAttribute("AccountID"));
            String baslik = String.valueOf(request.getParameter("baslik"));
            String aciklama = String.valueOf(request.getParameter("aciklama"));
            String alan = String.valueOf(request.getParameter("select_alan"));

            String query = "update makaleler set baslik='" + baslik + "', aciklama='" + aciklama + "',alan='" + alan + "' where id=" + id;
            System.out.print(query);

            status = db.set_Command(query);
            if (status)
                response.sendRedirect("list.jsp");
            else
                response.sendRedirect("ekle.jsp");

        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
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
                        Makale Ekle
                    </p>
                    <hr>
                    <div class="content">
                        <div class="container" style="padding: 0px;">
                            <form action="duzenle.jsp?id=<%=id%>" method="post">

                                <%
                                    ResultSet rs = db.get_List("select * from makaleler where id=" + id);
                                    while (rs.next()) { %>

                                <div class="form-group">
                                    <label for="baslik">Baþlýk</label>
                                    <input type="text" class="form-control" name="baslik" id="baslik"
                                           value="<%=rs.getString("baslik") %>"
                                           placeholder="Sinir aðý ile tahmin...">
                                </div>
                                <div class="form-group">
                                    <label for="aciklama">Açýklama</label>
                                    <input type="text" class="form-control" name="aciklama" id="aciklama"
                                           value="<%=rs.getString("aciklama") %>"
                                           placeholder="1234 Main St">
                                </div>
                                <embed width="100%" height="500px" name="plugin"
                                       src="${pageContext.request.contextPath}/upload/<%=rs.getString("makale") %>"
                                       type="application/pdf">
                                <%}%>

                                </br>
                                </br>
                                <div class="form-group">
                                    <select name="select_alan" id="select_alan" class="form-control form-control-sm">
                                        <option>Alan Seç</option>
                                        <%
                                            ResultSet rs2 = db.get_List("select id,alan from alanlar where durum=1");
                                            while (rs2.next()) { %>
                                        <option value="<%=rs2.getString("id") %>">
                                            <%=rs2.getString("alan") %>
                                        </option>
                                        <%}%>
                                    </select>
                                </div>
                                <button type="submit" id="btn_action" name="btn_action" value="1" class="btn btn-primary">Kaydet</button>
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
