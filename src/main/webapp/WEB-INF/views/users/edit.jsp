<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="e" tagdir="/WEB-INF/tags" %>
<!doctype html>
<html>
<head>
    <title><spring:message code="page.users.edit.title"/></title>
</head>
<body>
<div class="row-fluid">
    <form:form action="${pageContext.request.contextPath}/users/update" class="form-horizontal" method="put" commandName="user">
        <fieldset>
            <legend><spring:message code="page.users.edit.form.legend"/></legend>
            <form:hidden path="id" name="id" id="id"/>
            <jsp:include page="_form.jsp"/>
        </fieldset>
    </form:form>
</div>
</body>
</html>
