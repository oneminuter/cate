var urlUtil = {
	// 请求地址:http://127.0.0.1:8080
	path: window.document.location.href.substring(0, window.document.location.href.indexOf(window.document.location.pathname)),
	//请求基地址:http://127.0.0.1:8080/cate
	baseRequestPath: window.document.location.href.substring(0, window.document.location.href.indexOf(window.document.location.pathname)) + "/" +  window.document.location.pathname.substring(1).substring(0, window.document.location.pathname.substring(1).indexOf("/")),
	
	//接口地址
	requestPath: {
		//首页轮播
		initSlid: "/index/getSlides",
		//添加banner-提交
		addBannerSubmit: "/admin/banner/submitBanner",
		//添加美食
		addFoodSubmit: "/admin/food/addFoodSubmit",
		//添加食材、食谱、其他品类
		addFoodShicaiOrShipuOrOtherSubmit: "/admin/food/addFoodShicaiOrShipuOrOtherSubmit",
		//获取美食列表
		getFoodList: "/index/food/getFoodList",
		//获取详情
		getDetail: "/index/food/getDetail",
		//获取订单详情
		getCheckInfo: "/index/food/getCheckInfo",
		//添加收货地址
		addReceiveAddress: "/index/food/addReceiveAddress",
		//获取收货地址列表
		getAddressList: "/index/food/getAddressList",
		//提交订单
		submitCheck: "/index/food/submitCheck",
		//确认支付
		confirmPay: "/index/food/confirmPay",
		//获取订单列表
		getOrderList: "/user/order/getOrderList",
		// 注册
		register: "/user/doregister",
		//登录
		login: "/user/dologin",
		//获取用户信息
		getUserInfo: "/user/getUserInfo"
	},
	
	//根据操作名，返回需要请求的路径
	getRequestUrl: function(opt){
		var _url = "";
		for(var item in this.requestPath){
			if(item == opt){
				_url = this.baseRequestPath + this.requestPath[item];
				break;
			}
		}
		return _url;
	}
}