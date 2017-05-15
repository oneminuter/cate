package com.cate.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import sun.misc.BASE64Decoder;

public class FileUtil {
	public String saveBase64ToFile(String base64, HttpServletRequest request){
		SimpleDateFormat dataformat = new SimpleDateFormat("yyyy/MM/dd");
//		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
		String realPath = request.getSession().getServletContext().getRealPath("/"); //物理路径
		String filePath = "/cateUploadFile/"+dataformat.format(new Date());
		realPath = new File(realPath).getParent() + filePath;
		File fileDir = new File(realPath);
		if(!fileDir.exists()){
			fileDir.mkdirs();
		}
		String finalSaveFilePath = null;
		String imgUrl = null;
		try {
			if( !base64.trim().isEmpty() ){
				//字节流形式保存文件
				String[] strArr = base64.replaceAll(" ", "+").split(","); //转移特殊字符，并把js读取的前缀去掉
				String suffix = strArr[0].split("/")[1].split(";")[0]; //获得文件扩展名
				base64 = strArr[1];
				String filename = File.separator + System.currentTimeMillis()+(int)(Math.random()*10) + "." + suffix;
				finalSaveFilePath = fileDir + filename;
				byte[] buffer = new BASE64Decoder().decodeBuffer(base64);
				FileOutputStream out = new FileOutputStream(finalSaveFilePath);
				out.write(buffer);
				out.close();
				imgUrl = filePath + filename;
			}
				
		} catch (IOException e) {
			e.printStackTrace();
		}
		return imgUrl;
	}

}
