<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="chrome=1,IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<title>CATE+</title>
	<link href="css/mui.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<body>
	<!-- mui-content start -->
	<div class="mui-content">
		<!-- banner start -->
	    <div class="mui-slider banner">
			<div class="mui-slider-group mui-slider-loop" id="slideGroup">
		    <!-- ajax 构造数据
		    <div class="mui-slider-item">
		    	<a href="###">
		    		<img src="getBannerById(0)" />
		    	</a>
		    </div> -->
			</div>
		  
		    <div class="mui-slider-indicator">
				<!-- 构造数据
				<div class="mui-indicator mui-active"></div> -->
			</div>
		</div>
		<!-- banner end -->

		<!-- content start -->
		<section class="content">
			<!-- classify_title_container start -->
			<div class="classify_title_container">
				<div class="classify_title_item active" data-classify="meishi">
					<svg class="icon icon_meishi" aria-hidden="true">
					  <use xlink:href="#icon-meishi"></use>
					</svg>
					<h4>美食</h4>
				</div>
				<div class="classify_title_item" data-classify="shicai">
					<svg class="icon icon_shicai" aria-hidden="true">
					  <use xlink:href="#icon-shicai"></use>
					</svg>
					<h4>食材</h4>
				</div>
				<div class="classify_title_item" data-classify="shipu">
					<svg class="icon icon_shipu" aria-hidden="true">
					  <use xlink:href="#icon-shipu"></use>
					</svg>
					<h4>食谱</h4>
				</div>
				<div class="classify_title_item" data-classify="other">
					<svg class="icon icon_all" aria-hidden="true">
					  <use xlink:href="#icon-all"></use>
					</svg>
					<h4>其他</h4>
				</div>
			</div>
			<!-- classify_title_container end -->

			<!-- list_container start -->
			<div class="list_container">
				<!-- 排序方式 -->
				<!-- 
				<div class="order_methor">
					<span>排序方式</span>
					<a href="#orderMethor">评分</a>
					<div id="orderMethor" class="mui-popover">
						<ul class="mui-table-view">
						    <li class="mui-table-view-cell"><a>评分</a></li>
						    <li class="mui-table-view-cell"><a>时间</a></li>
						    <li class="mui-table-view-cell"><a>距离</a></li>
						    <li class="mui-table-view-cell"><a>热度</a></li>			
						</ul>
					</div>
				</div> -->
				
				<!-- list_item_ul start -->
				<ul class="list_item_ul">
					<li>
						<div class="thumbnail">
							<img src="img/pic1.png" alt="">
						</div>
						<div class="introduce">
							<h2>重庆小面</h2>
							<p>[酒仙桥]大山子店 2.1km</p>
							<h3>￥<span>18</span></h3>
							<h4>满25减3</h4>
							<span class="score">6.5分</span>
						</div>
					</li>
					
					<li>
						<div class="thumbnail">
							<img src="img/pic2.png" alt="">
						</div>
						<div class="introduce">
							<h2>重庆小面</h2>
							<p>[酒仙桥]大山子店 2.1km</p>
							<h3>￥<span>18</span></h3>
							<h4>满25减3</h4>
							<span class="score">6.5分</span>
						</div>
					</li>
					
					<li>
						<div class="thumbnail">
							<img src="img/pic3.png" alt="">
						</div>
						<div class="introduce">
							<h2>重庆小面</h2>
							<p>[酒仙桥]大山子店 2.1km</p>
							<h3>￥<span>18</span></h3>
							<h4>满25减3</h4>
							<span class="score">6.5分</span>
						</div>
					</li>
					
					<li>
						<div class="thumbnail">
							<img src="img/pic4.png" alt="">
						</div>
						<div class="introduce">
							<h2>重庆小面</h2>
							<p>[酒仙桥]大山子店 2.1km</p>
							<h3>￥<span>18</span></h3>
							<h4>满25减3</h4>
							<span class="score">6.5分</span>
						</div>
					</li>
					
					<li>
						<div class="thumbnail">
							<img src="img/pic4.png" alt="">
						</div>
						<div class="introduce">
							<h2>重庆小面</h2>
							<p>[酒仙桥]大山子店 2.1km</p>
							<h3>￥<span>18</span></h3>
							<h4>满25减3</h4>
							<span class="score">6.5分</span>
						</div>
					</li>
					
					<li>
						<div class="thumbnail">
							<img src="img/pic4.png" alt="">
						</div>
						<div class="introduce">
							<h2>重庆小面</h2>
							<p>[酒仙桥]大山子店 2.1km</p>
							<h3>￥<span>18</span></h3>
							<h4>满25减3</h4>
							<span class="score">6.5分</span>
						</div>
					</li>
				</ul>
				<!-- list_item_ul end -->
			</div>
			<!-- list_container end -->
		</section>
		<!-- content end -->

		<!-- 底部菜单 start -->
		<nav class="mui-bar mui-bar-tab">
			<a class="mui-tab-item mui-active" href="#tabbar">
				<svg class="icon icon_home" aria-hidden="true">
					<use xlink:href="#icon-home"></use>
				</svg>
				<span class="mui-tab-label">首页</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-chat">
				<svg class="icon icon_recommend" aria-hidden="true">
					<use xlink:href="#icon-recommend"></use>
				</svg>
				<span class="mui-tab-label">推荐</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-contact">
				<svg class="icon icon_community" aria-hidden="true">
					<use xlink:href="#icon-community"></use>
				</svg>
				<span class="mui-tab-label">社区</span>
			</a>
			<a class="mui-tab-item" href="#tabbar-with-map">
				<svg class="icon icon_user" aria-hidden="true">
					<use xlink:href="#icon-user"></use>
				</svg>
				<span class="mui-tab-label">我</span>
			</a>
		</nav>
		<!-- 底部菜单 end -->
	</div>
	<!-- mui-content end -->

	<!-- <p class="toast">操作失败描述</p> -->

	<!-- 详情 start -->
	<section class="detail">
		<!-- foodDetail start -->
		<a href="javascript:;" class="closeDetailPannel">
			<svg class="icon icon_left" aria-hidden="true">
				<use xlink:href="#icon-left"></use>
			</svg>
		</a>
		<a href="javascript:;" class="share">
			<svg class="icon icon_share" aria-hidden="true">
				<use xlink:href="#icon-share"></use>
			</svg>
		</a>
		<div class="foodImg">
			<img src="img/banner1.jpg" alt="">
		</div>
		<div class="detail_content">
			<h2>红烧肉+番茄鸡蛋</h2>
			<span class="price">￥<span>18</span></span>

			<h3>购买份数</h3>
			<div class="mui-numbox" data-numbox-min="0">
				<button class="mui-btn mui-btn-numbox-minus" type="button">-</button>
				<input id="test" class="mui-input-numbox" type="number" value="0">
				<button class="mui-btn mui-btn-numbox-plus" type="button" disabled="">+</button>
			</div>

			<h5>商品详情</h5>
			<p>红烧肉加土豆跟美味，味微甜</p>
			
			
			<div class="cart">
				<svg class="icon icon_cart" aria-hidden="true">
				   <use xlink:href="#icon-cart"></use>
				</svg>
				<h4>￥<span>0</span></h4>
				<a href="javascript:;">加入购物车</a>
			</div>
		</div>
		<!-- foodDetail end -->
	</section>
	<!-- 详情 end -->

	<!-- 提交订单 start -->
	<section class="check">
		<header>
			<a href="javascript:;" class="closeCheckPannel">
				<svg class="icon icon_left" aria-hidden="true">
					<use xlink:href="#icon-left"></use>
				</svg>
			</a>
			<h3>提交订单</h3>
		</header>
		
		<div class="addressContainer">
			<span class="l_text">选择收货地址</span>
			<span class="r_text">
				<svg class="icon icon_right" aria-hidden="true">
					<use xlink:href="#icon-right"></use>
				</svg>
			</span>
		</div>
	
		<div class="check_row">
			<span class="l_text">支付方式</span>
			<span class="r_text">
				在线支付
				<svg class="icon icon_right" aria-hidden="true">
					<use xlink:href="#icon-right"></use>
				</svg>
			</span>
		</div>

		<div class="check_row">
			<span class="l_text">代金券</span>
			<span class="r_text">￥4</span>
		</div>

		<div class="check_row border_top">
			<span class="l_text">吉祥淳（营养套餐，刚翻蒸饺）</span>
			<span class="r_text">由商家配送</span>
		</div>

		<div class="check_row">
			<span class="l_text">一荤两素套餐</span>
			<span class="c_text">x1</span>
			<span class="r_text">￥16</span>
		</div>

		<div class="check_row">
			<span class="l_text">餐盒费</span>
			<span class="r_text">￥1.5</span>
		</div>

		<div class="check_row">
			<span class="l_text">配送费</span>
			<span class="r_text">￥4</span>
		</div>

		<div class="check_row">
			<span class="l_text">满减优惠</span>
			<span class="r_text">-￥3</span>
		</div>

		<div class="check_row">
			<span class="l_text">总计￥17.5 已优惠￥3</span>
			<span class="r_text">待支付￥14</span>
		</div>

		<div class="check_row border_top">
			<span class="l-text">用餐人数</span>
			<span class="r_text">
				以便商家给您带够餐具
				<svg class="icon icon_right" aria-hidden="true">
					<use xlink:href="#icon-right"></use>
				</svg>
			</span>
		</div>

		<div class="check_row">
			<span class="l_text">备注</span>
			<span class="r_text">
				口味，偏好要求等
				<svg class="icon icon_right" aria-hidden="true">
					<use xlink:href="#icon-right"></use>
				</svg>
			</span>
		</div>

		<div class="payment">
			￥14.5 <span>(已优惠￥3)</span>
			<a href="javascript:;">提交订单</a>
		</div>
		
	</section>
	<!-- 提交订单 end -->

	<!-- 选择收货地址 start -->
	<section class="selectAdress">
		<header>
			<a href="javascript:;">
				<svg class="icon icon_left" aria-hidden="true">
					<use xlink:href="#icon-left"></use>
				</svg>
			</a>
			<h3>选择收货地址</h3>
		</header>
		<div class="addAdress">
			<span class="l_text">新增收货地址</span>
		</div>
		<ul class="address_list">
			<li class="selected">
				<span></span>
				<div class="addressDetail">
					<p>
						<span>太原理工大学明向校区</span>
						<span>明泽苑3号楼603</span>
					</p>
					<p>
						<span>林廷勇</span>
					 	<span>先生</span>
					 	<span>18310433237</span>
					</p>
				</div>
				<a href="javascript:;">
					<svg class="icon icon_edit" aria-hidden="true">
						<use xlink:href="#icon-revise"></use>
					</svg>
				</a>
			</li>
			<li>
				<div class="addressDetail">
					<p>
						<span>太原理工大学明向校区</span>
						<span>明泽苑3号楼603</span>
					</p>
					<p>
						<span>林廷勇</span>
					 	<span>先生</span>
					 	<span>18310433237</span>
					</p>
				</div>
				<a href="javascript:;">
					<svg class="icon icon_edit" aria-hidden="true">
						<use xlink:href="#icon-revise"></use>
					</svg>
				</a>
			</li>
		</ul>
	</section>
	<!-- 选择收货地址 end -->

	<!-- 增加收货地址 start -->
	<section class="add_address">
		<header>
			<a href="javascript:;">
				<svg class="icon icon_left" aria-hidden="true">
					<use xlink:href="#icon-left"></use>
				</svg>
			</a>
			<h3>添加收货地址</h3>
		</header>
		<h5>联系人</h5>
		<div class="add_address_row">
			<input type="text" placeholder="请输入姓名">
		</div>
		<div class="add_address_row">
			<ul>
				<li class="selected">
					<span></span>
					先生
				</li>
				<li>
					<span></span>
					女士
				</li>
			</ul>
		</div>
		<div class="add_address_row">
			<input type="text" placeholder="请输入收货手机号码">
		</div>

		<h5>收货地址</h5>
		<div class="add_address_row">
			<input type="text" placeholder="小区/大厦/学校    例：太原理工大学">
			<input type="text" placeholder="楼号-门牌号    例：3号楼603">
		</div>
		
		<a href="javascript:;" class="save_btn">保存</a>
	</section>
	<!-- 增加收货地址 end -->

	<!-- 选择支付方式start -->
	<section class="selectPayMethod">
		<header>
			<a href="javascript:;">
				<svg class="icon icon_left" aria-hidden="true">
					<use xlink:href="#icon-left"></use>
				</svg>
			</a>
			<h3>选择支付方式</h3>
		</header>
		<ul>
			<li class="selected">
				<span></span>
				<svg class="icon icon_alipay" aria-hidden="true">
					<use xlink:href="#icon-alipay"></use>
				</svg>
				支付宝
			</li>
			<li>
				<span></span>
				<svg class="icon icon_wechatPay" aria-hidden="true">
					<use xlink:href="#icon-wechatPay"></use>
				</svg>
				微信支付
			</li>
			<li>
				<span></span>
				<svg class="icon icon_onlinePay" aria-hidden="true">
					<use xlink:href="#icon-onlinePay"></use>
				</svg>
				在线支付
			</li>
		</ul>
	</section>
	<!-- 选择支付方式end -->

	<script src="js/mui.min.js"></script>
	<script src="js/urlUtil.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/util.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/index.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/iconfont.js"></script>
</body>
</html>