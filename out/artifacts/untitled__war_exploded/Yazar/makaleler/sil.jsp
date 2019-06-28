<jsp:useBean id="db" class="methods.database"></jsp:useBean>

<%
    String AccountID = String.valueOf(session.getAttribute("AccountID"));

    if (AccountID != null) {
        String id = request.getParameter("id");
        boolean status = db.set_Command("delete from makaleler where id=" + id);
        if (status)
            response.sendRedirect("list.jsp");
        else
            response.sendRedirect("ekle.jsp");  //hata varsa ekleye gönder, test için yazıldı.
    }
%>