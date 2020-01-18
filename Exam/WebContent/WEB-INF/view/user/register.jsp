<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="考试系统登录界面">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>注册参加考试</title>
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
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

<style>
.am-alert {
	display: none;
}
</style>

<script>
	$(function() {
		var error = $("#error");
		var success = $("#success");
		if ($.trim(error.text()) != "") {
			error.fadeIn(2500);
		}
		if ($.trim(success.text()) != "") {
			success.fadeIn(1000)
			setTimeout(function() {
				location.href = "${pageContext.request.contextPath}/"
			}, 1000);
		}
		$("#reg_form").on("submit", function() {
			var username = $.trim($("input[name=username]").val());
			var password = $.trim($("input[name=password]").val());
			var repassword = $.trim($("input[name=repassword]").val());
			if (username == "") {
				error.text("用户名不得为空！").fadeIn(1000);
				return false;
			}
			if (password == "") {
				error.text("密码不得为空！").fadeIn(1000);
				return false;
			}
			if (password != repassword) {
				error.text("两次密码不同").fadeIn(1000);
				return false;
			}
			return true;
		});
	});
</script>
</head>
<body>
	<div class="am-margin-lg">
		<h1 class="am-text-center am-margin-vertical-lg">注册</h1>
		<div class="am-text-center">
			<img src="${pageContext.request.contextPath}/assets/i/examples/landing.png" alt="" />
		</div>
		<div class="am-margin-vertical-lg">
			<div class="am-g">
				<div class="am-u-md-8 am-u-sm-centered">
					<div class="am-alert am-alert-danger" id="error" data-am-alert>${ERROR}</div>
					<div class="am-alert am-alert-success" id="success" data-am-alert>${SUCCESS}</div>
					<form class="am-form" id="reg_form" name="reg_form" action="<c:url value='/doRegister'/>" method="post">
						<fieldset class="am-form-set">
							<input type="text" id="username" name="username" placeholder="取个名字">
							<input type="password" id="password" name="password" placeholder="设个密码">
							<input type="password" id="repassword" name="repassword" placeholder="再设一次">
						</fieldset>
						<button type="submit" class="am-btn am-btn-primary am-btn-block">注册个账号</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
