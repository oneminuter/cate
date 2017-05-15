<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<title>CATE+ 管理</title>
	<link rel="stylesheet" type="text/css" href="css/admin.css"/>
</head>
<body>
	<header>
		<h1>CATE+ 后台管理</h1>
		<a href="javascript:;" class="btn">退出</a>
	</header>

	<!-- content_container start -->
	<section class="content_container">
		<!-- menu start -->
		<div class="menu">
			<dl>
				<dt>banner管理</dt>
				<dd>
					<ul id="slidePannel">
						<li id="addSlide">添加banner</li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dt>美食列表管理</dt>
				<dd>
					<ul id="foodPannel">
						<li id="addFood">添加美食</li>
					</ul>
				</dd>
			</dl>
		</div>
		<!-- menu end -->

		<!-- slidePannel start -->
		<div class="slidePannel">
			<!-- addSlide start -->
			<div class="addSlide">
				<h2>添加banner</h2>
				<label>上传banner图</label>
				<div class="preview">
					<input type="hidden" id="banner">
					<input type="file" accept="image/png, image/jpg, image/jpeg" id="uploadSlideImage">
				</div><br />

				<label>连接地址</label>
				<input type="text" placeholder="输入banner点击后的连接地址" id="linkUrl"><br />
				<a href="javascript:;" id="addSlideBtn" class="btn">提交</a>
			</div>
			<!-- addSlide end -->

		</div>
		<!-- slidePannel end -->

		<!-- foodPannel start -->
		<div class="foodPannel">
			<!-- addFood start -->
			<div class="addFood">
				<h2>添加美食</h2>
				<label>品类</label>
				<select id="addFood_classify">
					<option value="meishi">美食</option>
					<option value="shicai">食材</option>
					<option value="shipu">食谱</option>
					<option value="other">其他</option>
				</select>
				
				<!-- addFoodContainer start -->
				<section class="addFoodContainer">
					<label>地址</label>
					<div class="address">
						<select name="province" class="province"></select>
						<select name="city" class="city"></select>
						<select name="district" class="district"></select>
						<input type="hidden" name="area_code" class="code">
						<input type="hidden" name="area_value" class="text" id="addFood_address">
					</div><br /><br />
					<input type="text" placeholder="请输入能吃到该食物的详细地址" id="addFood_detailAddress">

					<label>图片</label>
					<div class="preview">
						<input type="hidden" id="addFood_foodImage">
						<input type="file" accept="image/png, image/jpg, image/jpeg" id="uploadFoodImage">
					</div><br />

					<label>美食名</label>
					<input type="text" placeholder="美食的名字" id="addFood_name">

					<label>价格</label>
					<input type="number" placeholder="请填写价格" id="addFood_price">

					<label>优惠满足价格</label>
					<input type="number" placeholder="如：优惠活动满25减2，这里就填25" id="addFood_reachPrice">

					<label>优惠价格</label>
					<input type="number" placeholder="如：优惠活动满25减2，这里就填2" id="addFood_favorablePrice">

					<label>其他优惠</label>
					<input type="text" placeholder="其他优惠活动描述，如送饮料" id="addFood_otherFavorable">
					<a href="javascript:;" id="addFoodSubmitBtn" class="btn">提交</a>
				</section>
				<!-- addFoodContainer end -->

				<!-- addShicaiContainer start -->
				<section class="addShicaiContainer">
					<label>图片</label>
					<div class="preview">
						<input type="hidden" id="addFood_shicaiImage">
						<input type="file" accept="image/png, image/jpg, image/jpeg" id="uploadShicaiImage">
					</div><br />

					<label>食材名</label>
					<input type="text" placeholder="食材的名字" id="addShicai_name">

					<label>食材介绍</label>
					<textarea id="shicai_editor" class="editor"></textarea>
					<a href="javascript:;" id="addShicaiSubmitBtn" class="btn">提交</a>
				</section>
				<!-- addShicaiContainer end -->

				<!-- addShipuContainer start -->
				<section class="addShipuContainer">
					<label>图片</label>
					<div class="preview">
						<input type="hidden" id="addFood_shipuImage">
						<input type="file" accept="image/png, image/jpg, image/jpeg" id="uploadShipuImage">
					</div><br />

					<label>菜名</label>
					<input type="text" placeholder="菜名" id="addShipu_name">

					<label>制作教程</label>
					<textarea id="shipu_editor" class="editor"></textarea>
					<a href="javascript:;" id="addShipuSubmitBtn" class="btn">提交</a>
				</section>
				<!-- addShipuContainer end -->

				<!-- addOther start -->
				<section class="addOther">
					<label>缩略图</label>
					<div class="preview">
						<input type="hidden" id="addFood_otherImage">
						<input type="file" accept="image/png, image/jpg, image/jpeg" id="uploadOtherImage">
					</div><br />

					<label>标签名</label>
					<input type="text" placeholder="标签名:（最多4个字）" id="addOther_name">

					<label>内容描述</label>
					<textarea id="other_editor" class="editor"></textarea>
					<a href="javascript:;" id="addOtherSubmitBtn" class="btn">提交</a>
				</section>
				<!-- addOther end -->
					
			</div>
			<!-- addFood end -->
		</div>
		<!-- foodPannel end -->
	</section>
	<!-- content_container end -->

	<script src="js/urlUtil.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/util.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery-3.2.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.area.js" type="text/javascript" charset="utf-8"></script>


    <script type="text/javascript" charset="utf-8" src="ueditor1_4_3_3/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor1_4_3_3/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>
	<script>
		//实例化编辑器
	    var ue_shicai = UE.getEditor('shicai_editor');
	    var ue_shipu = UE.getEditor('shipu_editor');
	    var ue_other = UE.getEditor('other_editor');
	</script>

	<script src="js/admin.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
