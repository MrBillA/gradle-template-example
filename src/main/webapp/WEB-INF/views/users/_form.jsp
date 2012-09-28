<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="e" tagdir="/WEB-INF/tags" %>

<e:bootw path="username" labelCode="form.labels.username">
    <form:input path="username" name="username" id="username"/>
</e:bootw>
<e:bootw path="firstName" labelCode="form.labels.firstName">
    <form:input path="firstName" name="firstName" id="firstName"/>
</e:bootw>
<e:bootw path="lastName" labelCode="form.labels.lastName">
    <form:input path="lastName" name="lastName" id="lastName"/>
</e:bootw>
<e:bootw path="password" labelCode="form.labels.password">
    <form:password path="password" name="password" id="password"/>
</e:bootw>
<div class="form-actions">
    <input type="submit" class="btn btn-primary" value="<spring:message code="form.buttons.save"/>">
    <a href="${pageContext.request.contextPath}/users/index" class="btn"><spring:message code="form.buttons.cancel"/></a>
</div>
