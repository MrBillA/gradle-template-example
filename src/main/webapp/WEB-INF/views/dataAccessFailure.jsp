<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<div>
  <spring:message var="title" code="error_dataaccessfailure_title" htmlEscape="false"/>

  <div>
    <h2>${fn:escapeXml(title)}</h2>

    <p>
      <spring:message code="error_uncaughtexception_problemdescription"/>
    </p>
    <c:if test="${not empty exception}">
      <h3><spring:message code="exception_details"/></h3>
      <br/>
      <h4><spring:message code="exception_class"/></h4>
      <br/>
      <c:out value="${exception.class.name}"/>

      <c:if test="${not empty exception.localizedMessage}">
        <hr/>
        <h4><spring:message code="exception_message"/></h4>
        <br/>
        <c:out value="${exception.localizedMessage}"/>
      </c:if>
      <hr/>
      <h4><spring:message code="exception_stacktrace"/></h4>
      <br/>

      <div>
        <c:forEach items="${exception.stackTrace}" var="trace">
          <c:out value="${trace}"/>
          <br/>
        </c:forEach>
      </div>
    </c:if>
  </div>
</div>

