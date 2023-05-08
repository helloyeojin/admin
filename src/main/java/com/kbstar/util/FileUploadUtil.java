package com.kbstar.util;

import java.io.FileOutputStream;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	public static void saveFile(MultipartFile mf, String dir) {
		byte [] data;
		String imgname = mf.getOriginalFilename();
		try {
			data = mf.getBytes();
			FileOutputStream fo = 
					new FileOutputStream(dir+imgname);
			fo.write(data);
			fo.close();
		}catch(Exception e) {
			
		}
		
	}
	
}




