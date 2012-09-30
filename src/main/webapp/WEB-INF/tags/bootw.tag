<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="path"
              required="true"
              description="The path to the bean field" %>

<%@ attribute name="labelCode"
              required="true"
              description="The i18n code for the input label" %>

<%@ attribute name="checkboxOrRadio"
              required="false"
              description="Set to true if inner input is a radio or checkbox so we can use the proper label CSS class" %>

<spring:bind path="${path}">
    <div class="control-group control-group-${path} ${status.error ? 'error' : ''}">
        <c:choose>
            <c:when test="${checkboxOrRadio}">
                <label class="checkbox">
                    <div class="controls">
                        <jsp:doBody/>
                        <spring:message code="${labelCode}" text="${labelCode}"/>
                        <span class="help-inline"><form:errors path="${path}"/></span>
                    </div>
                </label>
            </c:when>
            <c:otherwise>
                <label class="control-label" for="${path}">
                    <spring:message code="${labelCode}" text="${labelCode}"/>
                </label>

                <div class="controls">
                    <jsp:doBody/>
                    <span class="help-inline"><form:errors path="${path}"/></span>
                </div>
            </c:otherwise>
        </c:choose>

    </div>
</spring:bind>

