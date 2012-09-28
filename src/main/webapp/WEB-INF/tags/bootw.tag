<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ attribute name="path"
              required="true"
              description="The path to the bean field" %>

<%@ attribute name="labelCode"
              required="true"
              description="The i18n code for the input label" %>

<spring:bind path="${path}">
    <div class="control-group control-group-${path} ${status.error ? 'error' : ''}">
        <label class="control-label" for="${path}"><spring:message code="${labelCode}"/></label>
        <div class="controls">
            <jsp:doBody />
            <span class="help-inline"><form:errors path="${path}"/></span>
        </div>
    </div>
</spring:bind>

