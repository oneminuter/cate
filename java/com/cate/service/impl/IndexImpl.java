package com.cate.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cate.dao.BannerDao;
import com.cate.dao.FoodDao;
import com.cate.entity.Banner;
import com.cate.entity.Food;
import com.cate.model.Header;
import com.cate.service.Index;

@Service
@Transactional
public class IndexImpl implements Index {
	@Autowired
	Header header;
	@Autowired
	BannerDao bannerDao;
	
	Map<String, Object> map = new HashMap<String, Object>();

	@Override
	public JSONObject getSlides(HttpServletRequest request) {
		List<Banner> list = new BannerDao().query();
		if( list.size() > 0 ) {
			header.setSuccess(true);
			map.put("header", header);
			map.put("body", list);
		} else {
			header.setErrorInfo("数据库中没有数据");
			header.setSuccess(false);
			map.put("header", header);
		}
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject getFoodList(String classify) {
		List<Food> foodList = new FoodDao().queryByClassify(classify);
		if(foodList.size() > 0){
			header.setSuccess(true);
		}else{
			header.setErrorInfo("数据库中没有数据");
			header.setSuccess(false);
		}
		map.put("header", header);
		map.put("body", foodList);
		return JSONObject.fromObject(map);
	}
	
}
