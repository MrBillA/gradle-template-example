<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand" href="${pageContext.request.contextPath}/">Project name</a>
            <ul class="nav">
                <li class="${fn:startsWith(pageContext.request.requestURI, "/users/") ? "active" : ""}">
                    <a href="${pageContext.request.contextPath}/users/index">
                        <spring:message code="navbar.users"/>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>