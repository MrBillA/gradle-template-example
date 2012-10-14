<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="url"
              required="true"
              description="Resource URL either a JS or CSS file" %>
<%@ attribute name="media"
              required="false"
              description="CSS link media attribute" %>
<%@ attribute name="fetchMinify"
              required="false"
              description="Indicates if the resource is to be fetch as its minify version in a production environment" %>

<c:choose>
    <c:when test="${fn:contains(url, '.css')}">
        <c:set var="type" value="css"/>
    </c:when>
    <c:otherwise>
        <c:set var="type" value="js"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${fetchMinify == 'true' && env == 'production'}">
        <c:set var="resourceExtensionAddon" value=".min_${cacheBuster}.${type}"/>
    </c:when>
    <c:otherwise>
        <c:set var="resourceExtensionAddon" value="_${cacheBuster}.${type}"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${type == 'js'}">
        <script src="${pageContext.request.contextPath}/${fn:replace(url, ".js", resourceExtensionAddon)}"
                type="text/javascript"></script>
    </c:when>
    <c:when test="${type == 'css'}">
        <link href="${pageContext.request.contextPath}/${fn:replace(url, ".css", resourceExtensionAddon)}" rel="stylesheet"
              type="text/css">
    </c:when>
    <c:otherwise> </c:otherwise>
</c:choose>
