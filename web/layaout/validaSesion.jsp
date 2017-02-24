






<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String context = request.getContextPath();%>
<s:if test="#session.logueado!='si'">
    <script>
        window.location.replace("<%=context%>/index.jsp");
    </script>
</s:if>
