<%@ page import="java.sql.ResultSet" %>
<%@ page pageEncoding="UTF-8" %>

<jsp:useBean id="db" class="methods.database"/>

<%
    String istekler = null, kabuller = null, sonuclar = null;
    try {
        String AccountID = session.getAttribute("AccountID").toString();
        istekler = db.get_Value("select count(id) from makaleler where durum_hakem=0 and hakem_ID=" + AccountID, 1);
        kabuller = db.get_Value("select count(id) from makaleler where durum_hakem=1 and hakem_ID=" + AccountID, 1);
        sonuclar = db.get_Value("select count(id) from makaleler where durum_sonuc=1 and durum=3 and hakem_ID=" + AccountID, 1);
    } catch (Exception e) {
    }
%>

<div class="dropdown-menu" style="display: contents">
    <h6 class="dropdown-header">
        <div class="menu_title">M E N U</div>
    </h6>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../makaleler/istekler.jsp">İstekler</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../kabuller/list.jsp">Kabuller</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../sonuclar/list.jsp">Sonuçlar</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../../connect/logout.jsp">Çıkış</a>
</div>
<br>
<div class="dropdown-menu" style="display: contents">
    <h6 class="dropdown-header">İ S T A T İ S T İ K</h6>

    <a class="dropdown-item" href="#"><span class="badge badge-secondary"><%=istekler%></span> İstekler
    </a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#"><span class="badge badge-secondary"><%=kabuller%></span> Kabuller
    </a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#"><span class="badge badge-secondary"><%=sonuclar%></span> Sonuçlananlar
    </a>
    <div class="dropdown-divider"></div>
</div>