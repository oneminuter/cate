package com.cate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recomment")
public class Recomment {
	@RequestMapping("")
	public String recomment(){
		return "recomment";
	}
}