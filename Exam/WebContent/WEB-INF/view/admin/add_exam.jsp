<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="考试系统管理员">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>考试系统后台管理系统-${sessionScope.admin.username}</title>
<!-- Set render engine for 360 browser -->
<meta name="renderer" content="webkit">
<!-- No Baidu Siteapp-->
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
        <script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/amazeui.ie8polyfill.min.js"></script>
        <![endif]-->
<script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>

<script>
	$(function() {

		$(".am-form").on("submit", function() {
			var title = $("input[name=title]").val();
			if ($.trim(title) == "")
				return false;
			return true;
		});
	})
</script>
</head>
<body>
	<h1 class="am-text-center am-padding-vertical">考试后台管理系统</h1>
	<div class="am-g am-container">
		<div class="am-u-sm-2">
			<ul class="am-nav">
				<li class="am-text-center">
					<b>管理员：${sessionScope.admin.username }</b>
				</li>
				<li class="am-active">
					<a href="<c:url value='/Admin/'/>">试卷管理</a>
				</li>
				<li>
					<a href="<c:url value='/Admin/showUser'/>">用户管理</a>
				</li>
				<li>
					<a href="<c:url value='/logout'/>">退出</a>
				</li>
				<li>
					<a href="<c:url value='/about'/>">关于</a>
				</li>
			</ul>
		</div>
		<div class="am-u-sm-10">

			<form action="<c:url value='/Admin/doAddExam'/>" method="post" class="am-form">
				<fieldset>
					<legend>添加试卷</legend>

					<div class="am-form-group">
						<label for="title">标题</label>
						<input type="text" id="title" name="title" placeholder="输入电子标题" required="required">
					</div>

					<div class="am-form-group">
						<label for="time">时长（单位：s）</label>
						<input type="number" min="900" value="3600" id="time" name="time" placeholder="输入考试时长。单位秒，自己换算！" style="width: 50%">

					</div>

					<label for="">题目类型与个数</label>
					<div class="am-g"></div>
					<div class="am-g">
						<div class="am-u-sm-3">
							<div>单选</div>
							<input type="number" min="1" max="100" name="cSelect" required="required" />
						</div>

						<div class="am-u-sm-3">
							<div>多选</div>
							<input type="number" min="1" max="100" name="cMultselect" required="required" />
						</div>

						<div class="am-u-sm-3">
							<div>填空</div>
							<input type="number" min="1" max="100" name="cFill" required="required" />
						</div>

						<div class="am-u-sm-3">
							<div>判断</div>
							<input type="number" min="1" max="100" name="cTf" required="required" />
						</div>
					</div>
					<p>
						<button type="submit" class="am-btn am-btn-default am-fr">添加</button>
					</p>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>