package com.cate.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

import com.cate.dao.CollectionDao;
import com.cate.dao.FoodDao;
import com.cate.entity.Collection;
import com.cate.entity.Food;
import com.cate.model.Header;
import com.cate.service.Recomment;

@Service
public class RecommentImpl implements Recomment {
	@Autowired
	FoodDao foodDao;
	@Autowired
	Food food;
	@Autowired
	Header header;
	@Autowired
	CollectionDao cd;
	
	Map<String, Object> map = null;
	
	@Override
	public JSONObject getRecommentList() {
		List<Food> list = foodDao.queryRecomment();
		map = new HashMap<String, Object>();
		if(list == null){
			header.setSuccess(false);
			header.setErrorInfo("数据为空");
		}else{
			header.setSuccess(true);
			map.put("body", list);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

	@Override
	public JSONObject addCollect(Collection collection) {
		map = new HashMap<String, Object>();
		collection.setIsCollecte(1);
		int result = cd.addFoodCollect(collection);
		if( result == -1 ){
			header.setSuccess(false);
			header.setErrorInfo("数据库繁忙，收藏失败");
		}else if(result == 0){
			header.setSuccess(false);
			header.setErrorInfo("已经收藏过了");
		}else{
			header.setSuccess(true);
		}
		map.put("header", header);
		return JSONObject.fromObject(map);
	}

}
