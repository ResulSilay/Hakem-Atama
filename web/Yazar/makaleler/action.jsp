<%@ page language="java" contentType="text/html; charset=ISO-8859-9" pageEncoding="ISO-8859-9" %>
<% request.setCharacterEncoding("ISO-8859-9"); %>

<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<jsp:useBean id="db" class="methods.database"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Makel Ekleniyor...</title>
</head>
<body>
<%
    try {
        boolean status = false;
        String AccountID = String.valueOf(session.getAttribute("AccountID"));
        String baslik = String.valueOf(request.getParameter("baslik"));
        String aciklama = String.valueOf(request.getParameter("aciklama"));
        String alan = String.valueOf(request.getParameter("select_alan"));
        String dosya = session.getAttribute("fileName").toString();

        String query = "insert into makaleler (yazar_ID,baslik,aciklama,alan,makale) values('" + AccountID + "','" + baslik + "','" + aciklama + "','" + alan + "','" + dosya + "')";
        status = db.set_Command(query);
        if (status)
            response.sendRedirect("list.jsp");
        else
            response.sendRedirect("list.jsp");

        System.out.print(query);
    }
    catch (Exception e){
    }
%>
</body>
</html>