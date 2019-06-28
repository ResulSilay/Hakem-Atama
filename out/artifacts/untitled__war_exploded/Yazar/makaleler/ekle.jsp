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
    <link href="${pageContext.request.contextPath}/webroot/css/bootstrap.min.css" rel="stylesheet"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/webroot/css/site.css" rel="stylesheet">
</head>
<body>


<jsp:useBean id="db" class="methods.database"></jsp:useBean>

<%
    String action = request.getParameter("btn_action");
    try {
        if (action != null) {
            boolean status = false;
            String AccountID = String.valueOf(session.getAttribute("AccountID"));
            String baslik = String.valueOf(request.getParameter("baslik"));
            String aciklama = String.valueOf(request.getParameter("aciklama"));
            String alan = String.valueOf(request.getParameter("select_alan"));
            String dosya = session.getAttribute("fileName").toString();

            String query = "insert into makaleler (yazar_ID,baslik,aciklama,alan,makale) values('" + AccountID + "','" + baslik + "','" + aciklama + "','" + alan + "','" + dosya + "')";
            System.out.print(query);

            status = db.set_Command(query);
            if (status)
                response.sendRedirect("list.jsp");
            else
                response.sendRedirect("list.jsp");

            System.out.print(query);
        }
    } catch (Exception e) {
        System.out.print(e.getMessage());
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
                            <form action="ekle.jsp" method="post">
                                <div class="form-group">
                                    <label for="baslik">Baþlýk</label>
                                    <input type="text" class="form-control" name="baslik" id="baslik"
                                           placeholder="Sinir aðý ile tahmin...">
                                </div>
                                <div class="form-group">
                                    <label for="aciklama">Açýklama</label>
                                    <input type="text" class="form-control" name="aciklama" id="aciklama"
                                           placeholder="bu makalede...">
                                </div>


                                <label for="aciklama">Ýlgi Alaný</label>
                                <div class="form-group">
                                    <select name="select_alan" id="select_alan" class="form-control form-control-sm">
                                        <option>Alan Seç</option>
                                        <%
                                            ResultSet rs = db.get_List("select id,alan from alanlar where durum=1");
                                            while (rs.next()) { %>
                                        <option value="<%=rs.getString("id") %>"><%=rs.getString("alan") %>
                                        </option>
                                        <%}%>
                                    </select>
                                </div>
                                </br>
                                <div class="form-group" style="display:none;">
                                    <label for="txt_tarih">Tarih</label>
                                    <input type="datetime-local" class="form-control" id="txt_tarih"
                                           placeholder="1234 Main St">
                                </div>

                                <button class="btn btn-primary" href='#'
                                        onclick='javascript:window.open("${pageContext.request.contextPath}/upload.jsp", "_blank", "scrollbars=1,resizable=1,height=300,width=450");'
                                        title='Yükle'>Dosya Yükle
                                </button>
                                </br>
                                </br>
                                <button id="btn_action" name="btn_action" value="1" type="submit" class="btn btn-success">Kaydet</button>

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
