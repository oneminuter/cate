package com.cate.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="collection")
public class Collection {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="USER_ID")
	private int userId;
	
	@Column(name="FOOD_ID")
	private int foodId;
	
	@Column(name="RECOMMENT_ID")
	private int recommentId;
	
	@Column(name="COMMUNITY_ID")
	private int communityId;
	
	@Column(name="IS_COLLECTE")
	private int isCollecte; //是否收藏标志，1表示已收藏，0表示取消收藏

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getFoodId() {
		return foodId;
	}

	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}

	public int getRecommentId() {
		return recommentId;
	}

	public void setRecommentId(int recommentId) {
		this.recommentId = recommentId;
	}

	public int getCommunityId() {
		return communityId;
	}

	public void setCommunityId(int communityId) {
		this.communityId = communityId;
	}

	public int getIsCollecte() {
		return isCollecte;
	}

	public void setIsCollecte(int isCollecte) {
		this.isCollecte = isCollecte;
	}
}
