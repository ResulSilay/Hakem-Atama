<%@ page import="java.sql.ResultSet" %>
<%@ page pageEncoding="UTF-8" %>

<jsp:useBean id="db" class="methods.database"/>

<%
    String bekleme = null, editor = null, hakem = null, sonuc = null;
    try {
        String AccountID = session.getAttribute("AccountID").toString();
        bekleme = db.get_Value("select count(id) from makaleler where durum=1 and yazar_ID=" + AccountID, 1);
        editor = db.get_Value("select count(id) from makaleler where durum=2 and yazar_ID=" + AccountID, 1);
        hakem = db.get_Value("select count(id) from makaleler where durum_sonuc=0 and durum=3 and yazar_ID=" + AccountID, 1);
        sonuc = db.get_Value("select count(id) from makaleler where durum_sonuc=1 and durum=3 and yazar_ID=" + AccountID, 1);

    } catch (Exception e) {
    }
%>

<div class="dropdown-menu" style="display: contents">
    <h6 class="dropdown-header">
        <div class="menu_title">M E N U</div>
    </h6>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../makaleler/list.jsp">Makalelerim</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../makaleler/ekle.jsp">Makale Ekle</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../incelemeler/list.jsp">İncelemeler</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="../../connect/logout.jsp">Çıkış</a>
</div>
<br>
<div class="dropdown-menu" style="display: contents">
    <h6 class="dropdown-header">İ S T A T İ S T İ K</h6>

    <a class="dropdown-item" href="#"><span class="badge badge-secondary"><%=bekleme%></span> Beklemede
    </a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#"><span class="badge badge-secondary"><%=editor%></span> Editörde
    </a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#"><span class="badge badge-secondary"><%=hakem%></span> Hakemde
    </a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#"><span class="badge badge-secondary"><%=sonuc%></span> Sonuçladı
    </a>
    <div class="dropdown-divider"></div>

</div>
</div>