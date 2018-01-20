<%@ page import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String basePath = request.getContextPath(); %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Error</title>
<link rel="stylesheet" href="./styles/icon.css"/>
<style type="text/css">
	*{
		padding:0;
		margin:0;
	}
	@font-face{
		font-family: icon;
		src: url('./fonts/fontawesome-webfont.ttf'),
			 url('./fonts/fontawesome-webfont.eot'); /* IE9+ */
	}
	.global{
		position:fixed;
		width:100%;
		height:100%;
		background:#fff;
		display:table;
	}
	.wrap{
		vertical-align:middle;
		display:table-cell;
		text-align:center
	}
	.icon{
		font-size:20em;
		color:#72C5BF;
		cursor:pointer;
		-webkit-animation: spin 3s infinite linear;
		-moz-animation: spin 3s infinite linear;
		-o-animation: spin 3s infinite linear;
		animation: spin 3s infinite linear
	}
@-moz-keyframes spin {
	0% {
		-moz-transform: rotate(0deg)
	}

	100% {
		-moz-transform: rotate(359deg)
	}
}

@-webkit-keyframes spin {
	0% {
		-webkit-transform: rotate(0deg)
	}

	100% {
		-webkit-transform: rotate(359deg)
	}
}

@-o-keyframes spin {
	0% {
		-o-transform: rotate(0deg)
	}

	100% {
		-o-transform: rotate(359deg)
	}
}

@-ms-keyframes spin {
	0% {
		-ms-transform: rotate(0deg)
	}

	100% {
		-ms-transform: rotate(359deg)
	}
}

@keyframes spin {
	0% {
		transform: rotate(0deg)
	}

	100% {
		transform: rotate(359deg)
	}
}
	.error_info{
		font-size:1.5em;
		color:#232332;
		cursor:default;
		font-weight:800;
	}
</style>
</head>
<body>
	<div class="global">
		<div class="wrap">
			<i class="icon i_broke_500" id='go_back'></i>
			<span class='error_info'>哎呀...一不小心出错了...HTTP:500</span>
		</div>
	</div>
	<script type="text/javascript">
		document.getElementById('go_back').onclick=function(){
			window.history.back();
		};
	</script>
</body>
</html>



