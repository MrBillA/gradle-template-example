<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="url"
              required="true"
              description="" %>
<c:choose>
    <c:when test="${fn:contains(url, '.css')}">
        <c:set var="type" value="css"/>
    </c:when>
    <c:otherwise>
        <c:set var="type" value="js"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${env == 'production'}">
        <c:set var="resourceExtensionAddon" value=".min_${cacheBuster}.${type}"/>
        <c:choose>
            <c:when test="${type == 'js'}">
                <script src="${pageContext.request.contextPath}/${fn:replace(url, ".js", resourceExtensionAddon)}"
                        type="text/javascript"></script>
            </c:when>
            <c:when test="${type == 'css'}">
                <link href="${pageContext.request.contextPath}/${fn:replace(url, ".css", resourceExtensionAddon)}"
                      rel="stylesheet"
                      type="text/css">
            </c:when>
            <c:otherwise> </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <jsp:doBody/>
    </c:otherwise>
</c:choose>
