<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
						request.getServletContext().getContextPath() + "/";
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<title>404</title>
<style type="text/css">
.textDiv{
font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height:1.2;
  font-size: 9px;
  color: #333;
}

.btnrefre{
  width: 120px;
  height: 40px;
  border-radius: 4px;
  border: solid 1px #000000;
  font-size: 8px;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: 2;
  color: #000000;
  font-family:'Pingfang SC', 'DINpro', 'Helvetica Neue', Helvetica , 'Microsoft Yahei', sans-serif;
  background-color: #fff;
  margin-right:20px;
}

.btnback{
  width: 120px;
  height: 40px;
  border-radius: 4px;
  border: solid 1px #000000;
  font-size: 8px;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: 2;
  color: #ffffff;
  font-family:'Pingfang SC', 'DINpro', 'Helvetica Neue', Helvetica , 'Microsoft Yahei', sans-serif;
  background-color: #000000;
}

body{
	font-family:'Pingfang SC', 'DINpro', 'Helvetica Neue', Helvetica , 'Microsoft Yahei', sans-serif;
	font-size: 0.91em;
	/*min-width: 1366px;*/
	background-color: #ffffff;
}

@media  screen  and (max-width:2560px){
    body{
    	min-width: 1000px;
    }
    
    img{
		width:70%;
	}
}

@media  screen  and (max-width:375px){
  body{
    	min-width: 600px;
    	height: 100%;
    }
}

</style>

</head>
<body>
	<section class="main">
		<div align="center"  style="margin-top: 100px;">
			<img  src="<%=basePath %>errorpage/img/404.png">
			<div class="textDiv">您所查看的网页无法浏览或者已经不存在</div>
			<div class="textDiv">您可以:</div>
			<div style="margin-top: 80px;">
				<a  href="javascript:window.location.reload();"><input class="btnrefre" type="button" value="刷  新" name="refre"></a>	
				<a  href="javascript:history.back(-1);"><input type="button" class="btnback" value="返回上一页" name="back"></a>	
			</div>
		</div>
		
	</section>
</body>
</html>