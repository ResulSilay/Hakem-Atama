<%@ page import="java.sql.ResultSet" %>
<%@ page pageEncoding="UTF-8" %>

<jsp:useBean id="db" class="methods.database"/>

<%
    String tumu = null, atamalar = null, hakemde = null, sonuclar = null;
    try {
        String AccountID = session.getAttribute("AccountID").toString();
        tumu = db.get_Value("select count(id) from makaleler", 1);
        atamalar = db.get_Value("select count(id) from makaleler where editor_ID=" + AccountID, 1);
        hakemde = db.get_Value("select count(id) from makaleler where durum_hakem=1 and editor_ID=" + AccountID, 1);
        sonuclar = db.get_Value("select count(id) from makaleler where durum_sonuc=1 and durum=3 and editor_ID=" + AccountID, 1);
    } catch (Exception e) {
    }
%>

<div class="dropdown-menu" style="display: contents">
    <h6 class="dropdown-header">
        <div class="menu_title">M E N U</div>
    </h6>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../makaleler/list.jsp">Makaleler</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../makaleler/makalelerim.jsp">Makalelerim</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../incelemeler/list.jsp">İncelemeler</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../hatirlatma/list.jsp">Bildirimler</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../../connect/logout.jsp">Çıkış</a>
</div>
<br>
<div class="dropdown-menu" style="display: contents">
    <h6 class="dropdown-header">İ S T A T İ S T İ K</h6>

    <a class="dropdown-item" href="#"><span class="badge badge-secondary"><%=tumu%></span> Tüm Makaleler
    </a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#"><span class="badge badge-secondary"><%=atamalar%></span> Atananlar
    </a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#"><span class="badge badge-secondary"><%=hakemde%></span> Hakemde
    </a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#"><span class="badge badge-secondary"><%=sonuclar%></span> Sonuçlananlar
    </a>
    <div class="dropdown-divider"></div>
</div>