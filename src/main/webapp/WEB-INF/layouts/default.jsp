<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  <link href="/css/normalize${sessionScope['assetsSuffix']}.css${sessionScope['cacheBuster']}" rel="stylesheet" type="text/css">
  <link href="/css/bootstrap${sessionScope['assetsSuffix']}.css${sessionScope['cacheBuster']}" rel="stylesheet" type="text/css">
  <link href="/css/application${sessionScope['assetsSuffix']}.css${sessionScope['cacheBuster']}" rel="stylesheet" type="text/css">
  <title><tiles:getAsString name="title"/></title>
</head>

<body>
<tiles:insertAttribute name="header"/>
<div class="container">
  <tiles:insertAttribute name="body"/>
  <hr>
  <footer>
    <tiles:insertAttribute name="footer"/>
  </footer>
</div>
<!-- /container -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
<script src="/js/modernizr-2.0.6-min.js"></script>
<script src="/js/application${sessionScope['assetsSuffix']}.js${sessionScope['cacheBuster']}"></script>
<!--[if lt IE 7 ]>
<script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
<script>window.attachEvent('onload', function () {
  CFInstall.check({mode:'overlay'})
})</script>
<![endif]-->
</body>
</html>
