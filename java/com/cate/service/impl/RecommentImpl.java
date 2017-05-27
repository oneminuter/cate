package com.cate.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

import com.cate.dao.FoodDao;
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

}
