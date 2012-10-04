<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html>
<head>
    <title><spring:message code="page.login.title"/></title>
</head>
<body>
<div class="login-container">
    <div class="content">
        <div class="row">
            <div class="login-form">
                <h2><spring:message code="page.login.title"/></h2>

                <form action="${pageContext.request.contextPath}/j_spring_security_check" method="POST"
                      id="loginForm"
                      class="form-horizontal"
                      autocomplete="off">
                    <div class="control-group">
                        <div class="controls-row">
                            <input type="text" name="j_username"
                                   placeholder="<spring:message code="form.labels.username"/>"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <div class="controls-row">
                            <input type="password" name="j_password"
                                   placeholder="<spring:message code="form.labels.password"/>"/>
                        </div>
                    </div>

                    <input type="submit" id="submit" class="btn btn-primary"
                           value="<spring:message code="buttons.login"/>"/>

                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    <!--
    (function () {
        document.forms["loginForm"].elements["j_username"].focus();
    })();
    // -->
</script>
</body>
</html>
