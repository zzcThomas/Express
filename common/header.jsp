<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="icon" type="image/png" href="/dist/img/favicon.ico" />
<link href="/dist/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
<link href="/dist/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
<link href="/dist/css/plugins/select2/select2.css" rel="stylesheet">
<link href="/dist/css/animate.css" rel="stylesheet">
<link href="/dist/css/style.css?v=2.2.0" rel="stylesheet">
<link href="/dist/css/app.css" rel="stylesheet">
<link href="/dist/css/baba/iconfont.css" rel="stylesheet">
<link href="/dist/css/plugins/switchery/switchery.css" rel="stylesheet">
<link href="/dist/css/plugins/pageWalkThrough/jquery.pagewalkthrough.css" rel="stylesheet">
<link href="/dist/css/plugins/at/jquery.atwho.css" rel="stylesheet">
<script src="/dist/js/jquery-2.1.1.min.js"></script>
<script src="/dist/js/bootstrap.min.js?v=3.4.0"></script>
<script src="/dist/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/dist/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/dist/js/hplus.js?v=2.2.0"></script>
<script src="/dist/js/plugins/pace/pace.min.js"></script>
<script src="/dist/js/layer/layer.js"></script>
<script src="/dist/js/layer/extend/layer.ext.js"></script>
<script src="/dist/js/laydate/laydate.js"></script>
<script src="/dist/js/plugins/select2/select2.min.js"></script>
<script src="/dist/js/plugins/switchery/switchery.js"></script>
<script src="/dist/js/jquery-ui-1.10.4.min.js"></script>
<script src="/dist/js/plugins/pageWalkThrough/jquery.pagewalkthrough.min.js" ></script>
<script src="/dist/js/plugins/at/jquery.atwho.js" ></script>
<script src="/dist/js/plugins/at/jquery.caret.js" ></script>
<script src="/dist/js/plugins/cxselect/jquery.cxselect.js"></script>
<link href="/dist/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="/dist/css/delivery.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<title>行政助手</title>
<style>
@media screen and (min-width: 768px) {
	.minimalize-styl-2{display: none;}
}
</style>
</head>
<body>
<nav class="navbar navbar-static-top ept-nav" role="navigation" style="margin-bottom: 0">
	<a class="navbar-brand"><img src="/dist/img/logo.png" class="logo-img"></a>
	<a class="navbar-brand ept-nav-brand" style="font-size: 20px;">行政助手</a>
	<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " style="margin-top: 30px;" href="#"><i class="fa fa-bars"> </i> </a>
</nav>
	<div id="wrapper">
		<nav class="navbar-default navbar-static-side ept-nav-fix" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="side-menu">
				<li class="nav-header">
					<div class="dropdown profile-element">
						<span> <img alt="image" class="img-circle"
							src="https://www.mioffice.cn/API/avatar?username=${_const_cas_assertion_.principal.name}" width="64"/>
						</span>
						<a data-toggle="dropdown" class="dropdown-toggle" href="#" >
							<span class="clear"> 
							<span class="text-muted text-xs block" style="margin-top: 15px;">
							${userDisplayName}
							<b class="caret"></b>
							</span>
							</span>
						</a>
						<ul class="dropdown-menu m-t-xs">
							<li><a href="/logout">安全退出</a></li>
						</ul>
					</div>
					<div class="logo-element">Mi</div>
				</li>
				<li id="index">
					<a href="/index"><i class="fa fa-home"></i> <span class="nav-label">首页</span></a>
				</li>
				<li id="delivery">
					<a href="/user-list"><i class="fa fa-send-o"></i> <span class="nav-label">快递收发</span><span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse in" aria-expanded="true">
							<li><a href="/user-list">申请对公快递</a></li>
                            <c:if test="${viewSuperior eq true}">
                            <li><a href="/superior-list">审核对公快递
                            	<c:if test="${viewSuperiorUnreadNum gt 0}">
                            	<span class="label label-danger pull-right">${viewSuperiorUnreadNum}</span>
                            	</c:if>
                            	</a>
                            </li>
                            </c:if>
                            <c:if test="${viewMailroom eq true}"><li><a href="/mailroom-list">收发室对公快递</a></li></c:if>
                            <c:if test="${viewAdmin eq true}"><li><a href="/admin-list">超级管理员</a></li></c:if>
                    </ul>
				</li>
			</ul>
		</div>
</nav>