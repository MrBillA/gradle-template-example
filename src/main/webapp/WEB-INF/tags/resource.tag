<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="url"
              required="true"
              description="Resource URL either a JS or CSS file without the extension (example: css/application)" %>
<%@ attribute name="type"
              required="true"
              description="Resource type either 'css' or 'js'" %>
<%@ attribute name="media"
              required="false"
              description="CSS link media attribute" %>
<%@ attribute name="minify"
              required="true"
              description="Indicates if the resource is to be fetch as its minify version in a production environment" %>

<c:choose>
    <c:when test="${minify == 'true' && env == 'production'}">
        <c:set var="resourceExtension" value=".min.${type}"/>
    </c:when>
    <c:otherwise>
        <c:set var="resourceExtension" value=".${type}"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${type == 'js'}">
        <script src="${pageContext.request.contextPath}/${url}${resourceExtension}${cacheBuster}"
                type="text/javascript"></script>
    </c:when>
    <c:when test="${type == 'css'}">
        <link href="${pageContext.request.contextPath}/${url}${resourceExtension}${cacheBuster}" rel="stylesheet"
              type="text/css">
    </c:when>
    <c:otherwise> </c:otherwise>
</c:choose>
