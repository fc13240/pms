package com.lotut.pms.web.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfWriter;

public class JpgToPdf {
	public static boolean imgToPdf(String imgFilePath, String pdfFilePath) throws IOException, DocumentException  {
		File imgFile=new File(imgFilePath);
		if(imgFile.exists()){
		BufferedImage img = ImageIO.read(imgFile);
		FileOutputStream fos = new FileOutputStream(pdfFilePath);
		// 创建PDF文档
		Document doc = new Document(null, 0, 0, 0, 0);
		// 设置尺寸为图片尺寸
		doc.setPageSize(new Rectangle(img.getWidth(), img.getHeight()));
		Image image = Image.getInstance(imgFilePath);
		PdfWriter.getInstance(doc, fos);
		doc.open();
		doc.add(image);
		doc.close();
		return true;
		}else{
			return false;
		}
	}
	
	public static void main(String[] args) throws IOException, DocumentException {
		String imgFilePath="C:\\Users\\xw\\Desktop\\小图\\2-农林渔牧食品-贾海波\\15.jpg";
		String pdfFilePath="C:\\Users\\xw\\Desktop\\小图\\2-农林渔牧食品-贾海波\\15.pdf";
		imgToPdf(imgFilePath, pdfFilePath);
	}
}
