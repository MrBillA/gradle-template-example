<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="r" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html>
<head>
    <meta name="git-commit" content="${cacheBuster}">
    <meta name="environment" content="${env}">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <r:resource url="css/normalize.min" type="css" minify="false"/>
    <r:resource url="css/bootstrap.min" type="css" minify="false"/>
    <r:resource url="css/application" type="css" minify="true"/>
    <title><tiles:getAsString name="title"/></title>
</head>

<body>
<tiles:insertAttribute name="header" ignore="true"/>
<div class="container">
    <div class="hero-unit">
        <c:if test="${not empty message}">
            <div class="alert-success alert">
                    ${message}
            </div>
        </c:if>
        <tiles:insertAttribute name="body"/>
    </div>
    <hr>
    <footer>
        <tiles:insertAttribute name="footer" ignore="true"/>
    </footer>
</div>
<!-- /container -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
<r:resource url="js/modernizr-2.0.6.min" type="js" minify="false"/>
<r:resource url="js/application" type="js" minify="true"/>
<r:resource url="js/ujs" type="js" minify="true"/>
<!--[if lt IE 7 ]>
<script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
<script>window.attachEvent('onload', function () {
    CFInstall.check({mode:'overlay'})
})</script>
<![endif]-->
</body>
</html>
