package kr.co.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.IOUtils;
import org.imgscalr.Scalr;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadFileUtils {
	
	public static ResponseEntity<byte[]> displayfile(String uploadPath, String filename){
		ResponseEntity<byte[]> entity = null;
		
		InputStream in = null;
		try {
			in = new FileInputStream(uploadPath+File.separator+filename);
			HttpHeaders headers = new HttpHeaders();
			
			setContent(headers, filename);
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			try {
				if(in!=null)in.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return entity;
	}
	
	private static void setContent(HttpHeaders headers, String filename) throws Exception {
		
		String formatName = filename.substring(filename.lastIndexOf(".")+1);
		
		if(formatName.equalsIgnoreCase("png")) {
			headers.setContentType(MediaType.IMAGE_PNG);
		}else if(formatName.equalsIgnoreCase("jpg")) {
			headers.setContentType(MediaType.IMAGE_JPEG);
		}else if(formatName.equalsIgnoreCase("jpeg")) {
			headers.setContentType(MediaType.IMAGE_JPEG);
		}else if(formatName.equalsIgnoreCase("gif")) {
			headers.setContentType(MediaType.IMAGE_GIF);
		}else {
			filename = filename.substring(filename.indexOf("_")+1);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); //클릭시 다운로드 되게 만드는 문장
			headers.add("Content-Disposition", "attachment;filename=\""+new String(filename.getBytes("UTF-8"), "ISO-8859-1")+"\"");
		}
	}
	
	public static String uploadFile(String uploadPath, MultipartFile file) throws Exception {
		
		String ori_name = file.getOriginalFilename();
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString()+"_new_"+ori_name;
		
		
		File target = new File(uploadPath, savedName);
		if(ori_name==null||ori_name.equals("")) {
			return "";
		}
		FileCopyUtils.copy(file.getBytes(), target);
		
		String formatName = ori_name.substring(ori_name.lastIndexOf(".")+1);
		
		if(checkFormat(formatName)) {
			String ap = makeIcon(uploadPath, savedName);
			return ap;
		}else {
			String bp = File.separator + savedName;
			String ap = bp.replace(File.separatorChar, '/');
			
			return ap;
		}
		
	}
	
	public static String uploadFileLogo(String uploadPath, MultipartFile file) throws Exception {
		
		String ori_name = "SIGMA로고.png";
		String savedName = ori_name;
		
		
		File target = new File(uploadPath, savedName);
		if(ori_name==null||ori_name.equals("")) {
			return "";
		}
		FileCopyUtils.copy(file.getBytes(), target);
		
		String formatName = ori_name.substring(ori_name.lastIndexOf(".")+1);
		
		if(checkFormat(formatName)) {
			String ap = makeIcon(uploadPath, savedName);
			return ap;
		}else {
			String bp = File.separator + savedName;
			String ap = bp.replace(File.separatorChar, '/');
			
			return ap;
		}
		
	}

	public static String uploadFileBG(String uploadPath, MultipartFile file) throws Exception {
		
		String ori_name = "backgroundimg2.jpg";
		String savedName = ori_name;
		
		
		File target = new File(uploadPath, savedName);
		if(ori_name==null||ori_name.equals("")) {
			return "";
		}
		FileCopyUtils.copy(file.getBytes(), target);
		
		String formatName = ori_name.substring(ori_name.lastIndexOf(".")+1);
		
		if(checkFormat(formatName)) {
			String ap = makeIcon(uploadPath, savedName);
			return ap;
		}else {
			String bp = File.separator + savedName;
			String ap = bp.replace(File.separatorChar, '/');
			
			return ap;
		}
		
	}

	public static String makeIcon(String uploadPath, String savedName) throws Exception {
		
		File file = new File (uploadPath, savedName);
		
		BufferedImage sourceImg = ImageIO.read(file);
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT, 200);
		
		String thumbnailName = uploadPath + File.separator+"s_"+savedName;
		
		String formatName = savedName.substring(savedName.lastIndexOf(".")+1);
		
		File newFile = new File(thumbnailName);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		String bp = thumbnailName.substring(uploadPath.length());
		
		String bp_suffix = bp.substring(bp.lastIndexOf(".")+1);
		bp = bp.replace(bp_suffix, bp_suffix.toLowerCase());
		
		String ap = bp.replace(File.separatorChar, '/');
		
		return ap;
	}
	
	private static boolean checkFormat(String formatName) {
		List<String> list = new ArrayList<String>();
		list.add("jpg");
		list.add("jpeg");
		list.add("png");
		list.add("gif");
		list.add("jpg".toUpperCase());
		list.add("jpeg".toUpperCase());
		list.add("png".toUpperCase());
		list.add("gif".toUpperCase());
		return list.contains(formatName);
	}
}
