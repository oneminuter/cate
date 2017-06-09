package com.cate.service.impl;

import java.util.HashMap;
import java.util.List;
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

	@Override
	public JSONObject getSlideList() {
		map = new HashMap<String, Object>();
		List<Banner> list = bannerDao.query();
		if(list.size() > 0){
			header.setSuccess(true);
			map.put("body", list);
		}else{
			header.setSuccess(false);
			header.setErrorInfo("数据库为空");
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject editUrlLink(int id, String url) {
		map = new HashMap<String, Object>();
		if( !bannerDao.editLinkUrlById(id, url) ){
			header.setSuccess(false);
			header.setErrorInfo("修改链接失败");
		}else{
			header.setSuccess(true);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject deleteBanner(int id) {
		if( !bannerDao.deleteBannerById(id) ){
			header.setSuccess(false);
			header.setErrorInfo("删除banner失败");
		}else{
			header.setSuccess(true);
		}
		map = new HashMap<String,Object>();
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject deleteFoodById(int id) {
		if( !foodDao.deleteFoodById(id) ){
			header.setSuccess(false);
			header.setErrorInfo("删除失败");
		}else{
			header.setSuccess(true);
		}
		map = new HashMap<String,Object>();
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject modifyFoodInfo(int id, String key, String val) {
		if( !foodDao.modifyFoodById(id, key, val) ){
			header.setSuccess(false);
			header.setErrorInfo("修改失败");
		}else{
			header.setSuccess(true);
		}
		map = new HashMap<String,Object>();
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getAllFoodList() {
		List<Food> list = foodDao.queryAllFoodList();
		map = new HashMap<String, Object>();
		if(list.size() > 0){
			header.setSuccess(true);
			map.put("body", list);
		}else{
			header.setSuccess(false);
			header.setErrorInfo("数据库为空");
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

}
