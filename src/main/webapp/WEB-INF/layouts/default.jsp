<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!doctype html>

<jsp:directive.page contentType="text/html;charset=UTF-8"/>
<jsp:directive.page pageEncoding="UTF-8"/>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  <link href='stylesheets/application.css' rel='stylesheet' type='text/css'>
  <title><tiles:getAsString name="title"/></title>
</head>

<body>
<div id="wrapper">
  <tiles:insertAttribute name="header" ignore="true"/>
  <tiles:insertAttribute name="menu" ignore="true"/>

  <div id="main">
    <tiles:insertAttribute name="body"/>
    <tiles:insertAttribute name="footer" ignore="true"/>
  </div>
</div>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.13/jquery-ui.min.js"></script>
  <script src="javascript/modernizr-2.0.6.js"></script>
  <!--[if lt IE 7 ]>
    <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
    <script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
  <![endif]-->
</body>
</html>
