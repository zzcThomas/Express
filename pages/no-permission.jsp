<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file='../common/header.jsp' %>
<div id="page-wrapper" class="gray-bg dashbard-1">
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-sm-4">
		<h2>快递收发</h2>
		<ol class="breadcrumb">
			<li><a href="/admin/index.html">首页</a></li>
			<li>公务快递单</li>
		</ol>
	</div>
</div>
<div class="wrapper wrapper-content delivery">
	<div class="ma">
	<h4>
		<c:if test="${errorMsg eq null}">
		对不起，您没有权限。
		</c:if>
		<c:if test="${errorMsg ne null}">
		${errorMsg }
		</c:if>
	</h4>
	<br/><a href="javascript:history.go(-1);" class="btn btn-primary">返回</a></div>
</div>
<%@ include file='../common/footer.jsp' %>
