<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String context = request.getContextPath();%>
<s:if test="#session.nombre=='CA | Pedro García'">
    <script>
        window.location.replace("<%=context%>/vistasUsuarios/productos.jsp");
    </script>
</s:if>

