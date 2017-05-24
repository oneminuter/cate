package com.cate.util;

import java.io.File;
import java.util.Locale;

import org.springframework.web.servlet.view.InternalResourceView;

public class HtmlResourceView extends InternalResourceView {
	public boolean checkResource(Locale locale){
		File file = new File(this.getServletContext().getRealPath("/")+getUrl());
		return file.exists();
	}
}
