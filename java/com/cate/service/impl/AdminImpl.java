package com.cate.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

import com.cate.dao.BannerDao;
import com.cate.dao.FoodDao;
import com.cate.entity.Banner;
import com.cate.entity.Food;
import com.cate.model.Header;
import com.cate.service.Admin;
import com.cate.util.FileUtil;
@Service
public class AdminImpl implements Admin {
	@Autowired
	private Header header;
	Map<String, Object> map = null;
	@Autowired
	private Banner banner;
	@Autowired
	private BannerDao bannerDao;
	@Autowired
	private FoodDao foodDao;
	
	/**
	 * 添加banner
	 */
	@Override
	public JSONObject uploadBanner(String img, String link, HttpServletRequest request) {
		FileUtil fileUtil = new FileUtil();
		banner.setImgUrl(fileUtil.saveBase64ToFile(img, request));
		banner.setLinkUrl(link);
		
		map = new HashMap<String, Object>();
		if(bannerDao.add(banner)){
			header.setSuccess(true);
		}else{
			header.setErrorInfo("数据库插入失败");
			header.setSuccess(false);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	/**
	 * 添加美食
	 */
	@Override
	public JSONObject addFood(Food food, HttpServletRequest request) {
		FileUtil fileUtil = new FileUtil();
		food.setImgUrl(fileUtil.saveBase64ToFile(food.getImgUrl(), request));
		
		map = new HashMap<String, Object>();
		if(foodDao.add(food)){
			header.setSuccess(true);
		}else{
			header.setErrorInfo("数据库插入失败");
			header.setSuccess(false);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

}
