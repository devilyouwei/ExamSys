<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="考试系统管理员">
<meta name="keywords" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>考试系统后台管理系统-${sessionScope.admin.username}</title>
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
<script src="${pageContext.request.contextPath}/assets/js/sisyphus.min.js""></script>
<script>
	$(function() {
		$("input[type=button]").click(
				function() {
					//获取每种题目的个数
					var c_select = $("input[name=count_select]").val();
					var c_mulsel = $("input[name=count_mulsel]").val();
					var c_judge = $("input[name=count_judge]").val();
					var c_fill = $("input[name=count_fill]").val();

					var select = new Array(c_select);
					var mulsel = new Array(c_mulsel);
					var fill = new Array(c_judge);
					var judge = new Array(c_fill);

					for (var i = 0; i < c_select; i++) {
						select[i] = $("input[name=select" + i + "]:checked")
								.val()
								|| "";
					}

					for (var i = 0; i < c_mulsel; i++) {
						mulsel[i] = "";
						$("input[name=mulsel" + i + "]:checked").each(
								function() {
									mulsel[i] += $(this).val() || "";
								});
					}
					for (var i = 0; i < c_fill; i++) {
						fill[i] = $("input[name=fill" + i + "]").val() || "";
					}
					for (var i = 0; i < c_judge; i++) {
						judge[i] = $("input[name=judge" + i + "]:checked")
								.val()
								|| "";
					}

					//清空数据表
					$("#exam_form")[0].reset();
					var url = $("#exam_form").attr("action");

					$.post(url, {
						select : select,
						mulsel : mulsel,
						fill : fill,
						judge : judge
					}, function(res) {
						if (res == "lost") {
							alert("已经过时，成绩为0分");
						} else if (res == "nologin") {
							alert("登录失效");
						} else {
							alert("服务器评价成绩：" + res);
						}
						location.href = "";
					});
				});

		$("#exam_form").sisyphus();

		var $time = $("input[name=time]");
		setInterval(function() {
			var val = $time.val();
			//快到时间自动交卷
			if (val < 2) {
				$("input[type=button]").trigger("click")
			}
			$time.val(--val);
		}, 1000);
		//刷新可还原表单选项
	});
</script>
</head>

<body>
	<header class="am-topbar am-topbar-fixed-top">
		<h1 class="am-topbar-brand">
			<a href="#">欢迎：${sessionScope.user.username}</a>
		</h1>
		<div class="am-topbar-right">
			<form class="am-topbar-form am-topbar-left am-form-inline" role="search">
				<div class="am-form-group">
					<input type="text" class="am-form-field am-text-center" name="time" value="${EXAM.time}" readonly="readonly" />
				</div>
			</form>
		</div>
	</header>
	<div class="am-container">
		<h2 class="am-text-center">${EXAM.examUser.title}</h2>

		<!-- 暂存每种题目 ，不随表单提交-->
		<input type="hidden" name="count_select" value="${fn:length(EXAM.qSelect)}" />
		<input type="hidden" name="count_mulsel" value="${fn:length(EXAM.qMulsel)}" />
		<input type="hidden" name="count_judge" value="${fn:length(EXAM.qJudge)}" />
		<input type="hidden" name="count_fill" value="${fn:length(EXAM.qFill)}" />

		<form action="<c:url value='/User/subExam'/>" class="am-form am-margin-vertical-xl" method="post" id="exam_form">
			<h3>一、单项选择</h3>
			<c:forEach var="select" items="${EXAM.qSelect}" varStatus="s">
				<div>${select.ques}（编号：${select.id }）</div>
				<div class="am-form-group">
					<c:if test="${select.item0 != '' }">
						<label class="am-radio-inline">
							<input type="radio" value="0" name="select${s.index}" required>
							${select.item0}
						</label>
					</c:if>
					<c:if test="${select.item1 != '' }">
						<label class="am-radio-inline">
							<input type="radio" value="1" name="select${s.index}">
							${select.item1}
						</label>
					</c:if>

					<c:if test="${select.item2 != '' }">
						<label class="am-radio-inline">
							<input type="radio" value="2" name="select${s.index}">
							${select.item2}
						</label>
					</c:if>

					<c:if test="${select.item3 != '' }">
						<label class="am-radio-inline">
							<input type="radio" value="3" name="select${s.index}">
							${select.item3}
						</label>
					</c:if>
				</div>
			</c:forEach>

			<hr />
			<h3>二、多项选择</h3>
			<c:forEach var="mulsel" items="${EXAM.qMulsel}" varStatus="s">
				<div>${mulsel.ques}（编号：${mulsel.id}）</div>
				<div class="am-form-group">
					<c:if test="${mulsel.item0 != '' }">
						<label class="am-checkbox-inline">
							<input type="checkbox" value="0" name="mulsel${s.index}">
							${mulsel.item0}
						</label>
					</c:if>

					<c:if test="${mulsel.item1 != '' }">
						<label class="am-checkbox-inline">
							<input type="checkbox" value="1" name="mulsel${s.index}">
							${mulsel.item1}
						</label>
					</c:if>

					<c:if test="${mulsel.item2 != '' }">
						<label class="am-checkbox-inline">
							<input type="checkbox" value="2" name="mulsel${s.index}">
							${mulsel.item2}
						</label>
					</c:if>

					<c:if test="${mulsel.item3 != '' }">
						<label class="am-checkbox-inline">
							<input type="checkbox" value="3" name="mulsel${s.index}">
							${mulsel.item3}
						</label>
					</c:if>

					<c:if test="${mulsel.item4 != '' }">
						<label class="am-checkbox-inline">
							<input type="checkbox" value="4" name="mulsel${s.index}">
							${mulsel.item4}
						</label>
					</c:if>

					<c:if test="${mulsel.item5 != '' }">
						<label class="am-checkbox-inline">
							<input type="checkbox" value="5" name="mulsel${s.index}">
							${mulsel.item5}
						</label>
					</c:if>
				</div>
			</c:forEach>

			<hr />
			<h3>四、判断题</h3>
			<c:forEach var="judge" items="${EXAM.qJudge}" varStatus="s">
      		${judge.ques}
  			<div class="am-form-group">
					<label class="am-radio-inline">
						<input type="radio" value="0" name="judge${s.index}" required="required">
						错
					</label>
					<label class="am-radio-inline">
						<input type="radio" value="1" name="judge${s.index}">
						对
					</label>
				</div>
			</c:forEach>

			<hr />
			<h3>四、填空题</h3>
			<c:forEach var="fill" items="${EXAM.qFill}" varStatus="s">
				<div class="am-form-group">
					<label for="fill_${fill.id}">${fill.ques}</label>
					<input type="text" name="fill${s.index}" id="fill_${fill.id}" placeholder="输入填空答案">
				</div>
			</c:forEach>
			<input type="button" class="am-btn am-btn-primary am-btn-block am-margin-vertical-xl" value="提交试卷" />
		</form>
	</div>

</body>
</html>