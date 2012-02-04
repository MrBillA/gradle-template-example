<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
  <link href="/css/normalize.css" rel="stylesheet" type="text/css">
  <link href="/css/bootstrap.css" rel="stylesheet" type="text/css">
  <link href="/css/application.css" rel="stylesheet" type="text/css">
  <title><tiles:getAsString name="title"/></title>
</head>

<body>

<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="#">Project name</a>

      <div class="nav-collapse">
        <ul class="nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#contact">Contact</a></li>
        </ul>
      </div>
      <!--/.nav-collapse -->
    </div>
  </div>
</div>

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
<script src="/js/modernizr.js"></script>
<!--[if lt IE 7 ]>
<script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
<script>window.attachEvent('onload', function () {
  CFInstall.check({mode:'overlay'})
})</script>
<![endif]-->
</body>
</html>
