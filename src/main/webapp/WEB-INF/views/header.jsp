<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand" href="${pageContext.request.contextPath}/"><spring:message code="project.name"/></a>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <ul class="nav">
                    <li class="${fn:startsWith(pageContext.request.requestURI, "/users/") ? "active" : ""}">
                        <a href="${pageContext.request.contextPath}/users/index">
                            <spring:message code="navbar.users"/>
                        </a>
                    </li>
                </ul>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <ul class="nav pull-right">
                    <li class="divider-vertical"></li>
                    <li>
                        <a href="${pageContext.request.contextPath}/resources/j_spring_security_logout">
                            <spring:message code="navbar.logout"/>
                        </a>
                    </li>
                </ul>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <ul class="nav pull-right">
                    <li class="divider-vertical"></li>
                    <li class="${fn:startsWith(pageContext.request.requestURI, "/login") ? "active" : ""}">
                        <a href="${pageContext.request.contextPath}/login">
                            <spring:message code="navbar.login"/>
                        </a>
                    </li>
                </ul>
            </sec:authorize>
        </div>
    </div>
</div>
