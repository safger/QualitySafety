<%@ page language="java" import="java.util.*,com.sn.entity.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>市一医医疗质量监管网络平台</title>
<style>
html, body {
	height: 100%;
}
</style>
<style>
body, html {
	width: 100%;
	font-size: 14px;
	color: #333
}

abbr, address, article, aside, audio, b, blockquote, body, body div,
	button, caption, cite, code, dd, del, details, dfn, dl, dt, em,
	fieldset, figure, footer, form, h1, h2, h3, h4, h5, h6, header, html, i,
	iframe, img, ins, kbd, label, legend, li, mark, menu, nav, object, ol,
	p, pre, q, samp, section, small, span, strong, sub, summary, sup, table,
	tbody, td, tfoot, th, thead, time, tr, ul, var, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Segoe UI',
		'Microsoft Yahei', Tahoma, Arial, STHeiti, sans-serif;
	vertical-align: baseline;
	background: 0 0;
	-webkit-tap-highlight-color: transparent;
	-webkit-text-size-adjust: none
}

html {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

input:-webkit-autofill, input:-webkit-autofill:focus {
	box-shadow: 0 0 0 1000px rgba(255, 255, 255, 1) inset !important;
	-webkit-box-shadow: 0 0 0 1000px rgba(255, 255, 255, 1) inset !important;
}

.lg-form input::-webkit-input-placeholder {
	/* WebKit browsers*/
	color: #ccc;
}

.lg-form input:-moz-placeholder {
	/* Mozilla Firefox 4 to 18*/
	color: #ccc;
}

.lg-form input::-moz-placeholder {
	/* Mozilla Firefox 19+*/
	color: #ccc;
}

.lg-form input:-ms-input-placeholder {
	/* Internet Explorer 10+*/
	color: #ccc;
}

.lg-bg {
	width: 100%;
	height: 100%;
	background: url("<%=basePath%>images/login/img/lg-bg.jpg") no-repeat
		center;
	position: relative;
	z-index: 1;
}

.lg-div-bg {
	width: 550px;
	height: 400px;
	/* background: url("<%=basePath%>images/login/img/lg-div-bg.png") no-repeat center;*/
	/*background:#fbfbfb;*/
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -275px;
	margin-top: -230px;
	z-index: 2;
}

.lg-logo {
	text-align: center;
	overflow: hidden;
	padding: 0px 15px 15px 15px;
	height: 80px;
	font-family: "Microsoft YaHei";
}

.lg-logo p {
	font-size: 35px;
	color: #08913c;
	text-align: left;
	line-height: 85px;
	max-width: 500px;
	padding-left: 15px;
	display: inline-block;
	vertical-align: top;
}

.lg-logo p span {
	font-size: 30px;
	padding-left: 5px;
}

.lg-logo a {
	width: 85px;
	height: 86px;
	display: inline-block;
}

.lg-logo a img {
	width: 100%;
}

.lg-wrap {
	width: 100%;
	height: 280px;
	background: #fbfbfb;
	border: 1px solid #29a73c;
	box-shadow: 0 0 10px rgba(190, 190, 190, 0.75);
	border-radius: 10px;
}

.lg-left {
	width: 230px;
	float: left;
	background: url("<%=basePath%>images/login/img/global.jpg") no-repeat
		center;
	height: 100%;
	background-size: 180px
}

.lg-right {
	width: 300px;
	float: left;
}

.lg-form {
	clear: both;
	font-size: 14px;
	color: #fff;
}

.lg-form input {
	display: block;
	background: #fff;
	border: 1px solid #ccc;
	height: 35px;
	border-radius: 5px;
	width: calc(100% - 40px);
	padding-left: 40px;
	line-height: 35px;
	font-size: 14px;
	color: #333;
	margin-bottom: 20px;
	outline: none;
	appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	-moz-appearance: none;
	font-family: "Microsoft YaHei";
	padding-top: 0;
	padding-bottom: 0;
}

.lg-form input.username {
	background: url(<%=basePath%>images/login/img/user.png) no-repeat 5px
		center #fff;
}

.lg-form input.password {
	background: url(<%=basePath%>images/login/img/password.png) no-repeat
		5px center #fff;
}

.lg-form .reme-checkbox {
	font-size: 14px;
	color: #000;
	line-height: 15px;
	height: 15px;
	font-family: "Microsoft YaHei";
}

.lg-form .reme-checkbox input.remember {
	outline: none;
	appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	-moz-appearance: none;
	width: 15px;
	height: 15px;
	border-radius: 3px;
	background: #fff;
	border: 1px solid #ccc;
	display: inline-block;
	padding: 0;
	margin: 0;
	float: left;
	cursor: pointer;
	color: #333;
}

.lg-form .reme-checkbox label {
	display: inline-block;
	height: 15px;
	line-height: 15px;
	float: left;
	padding-left: 5px;
	color: #333;
}

.lg-form .reme-checkbox input:hover {
	border: 1px solid #aaa;
	box-shadow: 0 0 5px rgba(170, 170, 170, 0.5);
}

.lg-form .reme-checkbox input.remember:checked {
	background: url("<%=basePath%>images/login/img/right.png") no-repeat
		center;
	border: 1px solid #aaa;
}

.lg-form input.lg-submit {
	width: 100%;
	padding: 0;
	margin: 0;
	clear: both;
	margin-top: 20px;
	border-radius: 5px;
	height: 40px;
	background: #80c269;
	font-size: 14px;
	color: #fff;
	text-align: center;
	line-height: 40px;
	border: none;
	cursor: pointer;
}

.lg-form input.lg-submit:hover {
	background: #29a73c;
}

.lg-form .lg-title {
	height: 60px;
	background: url(<%=basePath%>images/login/img/lg-title.jpg) no-repeat
		center;
}

.lg-form input:hover, .lg-form input:focus {
	box-shadow: 0 0 10px rgba(170, 170, 170, 0.5);
}
</style>
</head>
<body>
	<div class="lg-bg">
		<div class="lg-div-bg">
			<div class="lg-logo">
				<a><img src="<%=basePath%>images/login/img/logo.png"> </a> 
				<p > 
					市一医院<span style="font-size: 25px">医疗质量监管网络平台</span> 
				</p>
			</div>
			<div class="lg-wrap"> 
				<div class="lg-left"></div>
				<div class="lg-right">
					<form class="lg-form" action="<%=basePath%>system/oplogin.html"
						autocomplete="off" method="post">
						<div class="lg-title"></div>
						<input type="text" placeholder="用户名" name="username"
							required="required" class="username"> <input
							type="password" placeholder="密码" name="password"
							required="required" class="password">
						<div class="reme-checkbox">
							<input type="checkbox" name="remember" id="remember"
								class="remember"><label for="remember">记住密码</label>
						</div>
						<input type="hidden" id="re" value="0" /> <input type="submit"
							value="点击登录" class="lg-submit">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<%=basePath%>js/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/common/jquery.cookie.js"></script>
<script>
	$(function() {
		$("input[name='username']").focus();
		var cookie_username = $.cookie('login_cookie_username');
		var cookie_userpwd = $.cookie('login_cookie_password');
		var cookie_remember = $.cookie('login_cookie_remember');
		if (cookie_remember != null & cookie_username != null
				&& cookie_username != "") {
			$("input[name='username']").val(cookie_username);
			$("input[name='password']").val(cookie_userpwd);
			$("#remember").attr("checked", "checked");
		}
		$("form").submit(function(e) {
			var remember = $("#remember").is(':checked');
			if (remember) {
				var cookie_username = $("input[name='username']").val();
				var cookie_userpwd = $("input[name='password']").val();
				$.cookie('login_cookie_username', $.trim(cookie_username), {
					expires : 30
				});
				$.cookie('login_cookie_password', cookie_userpwd, {
					expires : 30
				});
				$.cookie('login_cookie_remember', 1, {
					expires : 30
				});
			} else {
				$.cookie('login_cookie_username', null);
				$.cookie('login_cookie_password', null);
				$.cookie('login_cookie_remember', null);
			}
		});
		keyLogin();
		BrowserType();
	});

	function keyLogin() {
		if (event.keyCode == 13)
			$("form").submit();
	}

	/*
	 * 描述：判断浏览器信息
	 * 编写：LittleQiang_w
	 * 日期：2016.1.5
	 * 版本：V1.1
	 */

	//判断当前浏览类型
	function BrowserType() {
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
		var isOpera = userAgent.indexOf("Opera") > -1; //判断是否Opera浏览器
		var isIE = userAgent.indexOf("compatible") > -1
				&& userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器
		var isEdge = userAgent.indexOf("Windows NT 6.1; Trident/7.0;") > -1
				&& !isIE; //判断是否IE的Edge浏览器
		var isFF = userAgent.indexOf("Firefox") > -1; //判断是否Firefox浏览器
		var isSafari = userAgent.indexOf("Safari") > -1
				&& userAgent.indexOf("Chrome") == -1; //判断是否Safari浏览器
		var isChrome = userAgent.indexOf("Chrome") > -1
				&& userAgent.indexOf("Safari") > -1; //判断Chrome浏览器

		if (isIE) {
			var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
			reIE.test(userAgent);
			var fIEVersion = parseFloat(RegExp["$1"]);
			if (fIEVersion == 7) {
				window.location.href="<%=basePath%>system/jump.html";
				return "IE7";
			} else if (fIEVersion == 8) {
				window.location.href="<%=basePath%>system/jump.html";
				return "IE8";
			} else if (fIEVersion == 9) {
				return "IE9";
			} else if (fIEVersion == 10) {
				return "IE10";
			} else if (fIEVersion == 11) { 
				return "IE11";
			} else {
				window.location.href="<%=basePath%>system/jump.html";
				return "0"
			}//IE版本过低
		}//isIE end

		if (isFF) {
			return "FF";
		}
		if (isOpera) {
			return "Opera";
		}
		if (isSafari) {
			return "Safari";
		}
		if (isChrome) {
			return "Chrome";
		}
		if (isEdge) {
			return "Edge";
		}
	}//myBrowser() end

	//判断是否是IE浏览器
	function isIE() {
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
		var isIE = userAgent.indexOf("compatible") > -1
				&& userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器
		if (isIE) {
			return "1";
		} else {
			return "-1";
		}
	}

	//判断是否是IE浏览器，包括Edge浏览器
	function IEVersion() {
		var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
		var isIE = userAgent.indexOf("compatible") > -1
				&& userAgent.indexOf("MSIE") > -1 && !isOpera; //判断是否IE浏览器
		var isEdge = userAgent.indexOf("Windows NT 6.1; Trident/7.0;") > -1
				&& !isIE; //判断是否IE的Edge浏览器
		if (isIE) {
			var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
			reIE.test(userAgent);
			var fIEVersion = parseFloat(RegExp["$1"]);
			if (fIEVersion == 7) {
				return "IE7";
			} else if (fIEVersion == 8) {
				return "IE8";
			} else if (fIEVersion == 9) {
				return "IE9";
			} else if (fIEVersion == 10) {
				return "IE10";
			} else if (fIEVersion == 11) {
				return "IE11";
			} else {
				return "0"
			}//IE版本过低
		} else if (isEdge) {
			return "Edge";
		} else {
			return "-1";//非IE
		}
	}
</script>
</html>