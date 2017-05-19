package com.cate.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Component
@Entity
@Table(name="banner")
public class Banner {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO) //设置主键自动增长
	private int id;
	
	@Column(name="ORDER_NUMBER", length=2)
	private int orderNumber;
	
	@Column(name="IMG_URL", length=250, nullable=false)
	private String imgUrl;
	
	@Column(name="LINK_URL", length=250, nullable=false)
	private String linkUrl;
	
	@Column(name="IS_ONSHELVE", length=1)
	private int isOnShelve;
	
	@Column(name="ONSHELVE_TIME")
	private Date onShelveTime;

//	@Column(name="OFFSHELVE_TIME", insertable=false)
//	private Date offShelveTime;

	
	
	
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public int getIsOnShelve() {
		return isOnShelve;
	}
	public void setIsOnShelve(int isOnShelve) {
		this.isOnShelve = isOnShelve;
	}
//	public String getOffShelveTime() {
//		//用户返回时间处理
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		return sdf.format(offShelveTime);
//	}
//	public void setOffShelveTime(Date offShelveTime) {
//		this.offShelveTime = offShelveTime;
//	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getOnShelveTime() {
		//用户返回时间处理
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(onShelveTime);
	}
	public void setOnShelveTime(Timestamp onShelveTime) {
		this.onShelveTime = onShelveTime;
	}
	public void setOnShelveTime(Date onShelveTime) {
		this.onShelveTime = onShelveTime;
	}
}
