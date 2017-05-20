package com.cate.entity;

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
@Table(name="food")
public class Food {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO) //设置主键自动增长
	private int id;
	
	@Column(name="CLASSIFY", length=10)
	private String classify;
	
	@Column(name="SCORE", precision=2, scale=1)//长度为2，小数位为1
	private float score;
	
	@Column(name="UPDATE_TIME", columnDefinition="DATETIME")
	private Date updateTime;
	
	@Column(name="LONGITUDE", precision=10, scale=7)
	private float longitude;  //纬度
	
	@Column(name="LATITUDE", precision=10, scale=7)
	private float latitude; //经度
	
	@Column(name="ADDRESS", length=30)
	private String address;
	
	@Column(name="DETAIL_ADDRESS", length=30)
	private String detailAddress;
	
	@Column(name="VIEW", length=6)
	private int view;
	
	@Column(name="IMG_URL", length=255)
	private String imgUrl;
	
	@Column(name="NAME", length=30)
	private String name;
	
	@Column(name="PRICE", precision=6, scale=1)
	private float price;
	
	@Column(name="REACH_PRICE", precision=7, scale=1)
	private float reachPrice;
	
	@Column(name="FAVORABLE_PRICE", precision=4, scale=1)
	private float favorablePrice;
	
	@Column(name="OTHER_FAVORABLE", length=30)
	private String otherFavorable;
	
	@Column(name="CONTENT", columnDefinition="TEXT")
	private String content;
	
	@Column(name="STORE_NAME", length=20)
	private String storeName;
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public String getUpdateTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(updateTime);
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public float getLongitude() {
		return longitude;
	}

	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getReachPrice() {
		return reachPrice;
	}

	public void setReachPrice(float reachPrice) {
		this.reachPrice = reachPrice;
	}

	public float getFavorablePrice() {
		return favorablePrice;
	}

	public void setFavorablePrice(float favorablePrice) {
		this.favorablePrice = favorablePrice;
	}

	public String getOtherFavorable() {
		return otherFavorable;
	}

	public void setOtherFavorable(String otherFavorable) {
		this.otherFavorable = otherFavorable;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
}
