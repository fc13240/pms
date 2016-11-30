package com.lotut.pms.service.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.lotut.pms.domain.Brand;
import com.lotut.pms.domain.BrandAndBrandCategory;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.exception.DateFormatException;

public class BrandExcelParser {
	
	public static void main(String[] args) throws Exception {
		InputStream in = new FileInputStream("C:\\Users\\xw\\Desktop\\智慧殿商标11.28日.xls");
//		InputStream in = new FileInputStream("C:\\Users\\xw\\Desktop\\智慧殿初审合格商标.xlsx");
		BrandAndBrandCategory brandRecords = parseBrandFile(in,2);
		for (BrandCategory p: brandRecords.getBrandCategoryRecords()) {
//			System.out.println(p.getCaseStatus());
		}
		System.out.println(brandRecords.getBrandCategoryRecords().size());
	}
	
	public static BrandAndBrandCategory parseBrandFile(InputStream fileInputStream,int userId) throws IOException, EncryptedDocumentException, InvalidFormatException {
//		try (Workbook wb = new XSSFWorkbook(fileInputStream); ) {
//			Sheet brandSheet = wb.getSheetAt(0);
//			List<Brand> brandRecords = parseSheet(brandSheet,userId);
//			return brandRecords;
//		}
		
		try (Workbook wb =WorkbookFactory.create(fileInputStream); ) {
			Sheet brandSheet = wb.getSheetAt(0);
//			List<Brand> brandRecords = parseSheet(brandSheet,userId);
			BrandAndBrandCategory bac=parseSheet(brandSheet,userId);
			return bac;
		}
	}
	
	
	private static BrandAndBrandCategory parseSheet(Sheet sheet,int userId) {
		BrandAndBrandCategory bac = new BrandAndBrandCategory();
		List<Brand> brandRecords = new ArrayList<>();
		List<BrandCategory> categoryRecords=new ArrayList<>();
		Iterator<Row> rowIter = sheet.rowIterator();
		if (rowIter.hasNext()) rowIter.next();
		while (rowIter.hasNext()) {
			Row row = rowIter.next();
			
			if (isEmptyRow(row)) {
				break;
			}
			if(isTrueRow(row)){
			Brand brand = parseRow(row,userId);
			BrandCategory bc=getBrandCategory(row);
//			System.out.println(bc.getCategoryId()+"=============="+bc.getCategoryName());
			brandRecords.add(brand);
			categoryRecords.add(bc);
			}
		}
		bac.setBrandCategoryRecords(categoryRecords);
		bac.setBrandRecords(brandRecords);
		return bac;
	}
	
	private static boolean isEmptyRow(Row row) {
		if (row == null || row.getCell(0) == null || row.getCell(0).getStringCellValue().trim() == "") {
			return true;
		}else{
		return false;
		}
	}
	
	private static boolean isTrueRow(Row row){
		if(row.getCell(0).getStringCellValue().trim().equals("注册/登记地") || row.getCell(0).getStringCellValue().equals("默认")){
			return false;
		}
		return true;
		
	}
	private static Brand parseRow(Row row,int userId) {
		List<String> dateString= new ArrayList<>();
		int cellNumber=row.getPhysicalNumberOfCells();
		String targetDate="";
		for (int i = 0; i <cellNumber; i++) {
			if(row.getCell(i)!=null){
				row.getCell(i).setCellType(Cell.CELL_TYPE_STRING);
				
				
			}
			
		}
//		System.out.println(row.getCell(13).getCellType());
		String publishDate="";
		if(row.getCell(12)!=null){
		if (0 == row.getCell(12).getCellType()) {

			//判断是否为日期类型

			if(HSSFDateUtil.isCellDateFormatted(row.getCell(12))){
			//用于转化为日期格式

			Date d = row.getCell(12).getDateCellValue();

			DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

			 publishDate = formater.format(d);

			}else{

			// 用于格式化数字，只保留数字的整数部分

			DecimalFormat df = new DecimalFormat("########");

			 publishDate = df.format(row.getCell(12).getNumericCellValue());

			}
		}
		}
		String startDate="";
		if(row.getCell(13)!=null){
		if (0 == row.getCell(13).getCellType()) {

			//判断是否为日期类型

			if(HSSFDateUtil.isCellDateFormatted(row.getCell(13))){
			//用于转化为日期格式

			Date d = row.getCell(13).getDateCellValue();

			DateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

			startDate = formater.format(d);

			}else{

			// 用于格式化数字，只保留数字的整数部分

			DecimalFormat df = new DecimalFormat("########");

			startDate = df.format(row.getCell(13).getNumericCellValue());

			}
		}
		}
		String address = row.getCell(0).getStringCellValue().trim();
		String caseStatus = row.getCell(1).getStringCellValue().trim();
		String categoryName = row.getCell(2).getStringCellValue().trim();
//		System.out.println(categoryName);
		String brandNo = row.getCell(3).getStringCellValue().trim();
		String name = row.getCell(4).getStringCellValue().trim();
		String similarNo=row.getCell(6).getStringCellValue().replace("、", ".");
		String scope=row.getCell(7).getStringCellValue();
		int transactionMode=getTransactionMode(row.getCell(8).getStringCellValue());
		String appPerson=row.getCell(10).getStringCellValue();
	    String price=row.getCell(9).getStringCellValue();
		int categoryId=getCategoryId(categoryName);
		Brand brand = new Brand();
		User user=new User();
		BrandCategory brandCategory=new BrandCategory();
		brandCategory.setCategoryId(categoryId);
		user.setUserId(userId);
		brand.setUser(user);
		brand.setAddress(address);
		brand.setCaseStatus(caseStatus);
		brand.setBrandCategory(brandCategory);
		brand.setBrandNo(brandNo);
		brand.setName(name);
		brand.setScope(scope);
		brand.setTransactionMode(transactionMode);
//		System.out.println(price);
		brand.setPrice(Integer.valueOf(price));
		brand.setSimilarNo(similarNo);
		brand.setAppPerson(appPerson);
		brand.setPublishDate(publishDate == null? null:parseDate(publishDate));
		brand.setStartDate(startDate == null ? null:parseDate(startDate));
		return brand;
	}

	
	private static int getTransactionMode(String transactionMode){
		if(transactionMode.contains("转让")){
			return 2;
		}else if(transactionMode.contains("出售")){
			return 1;
		}
		return 0; 
	}
	
	private static Date parseDate(String dateStr) {
		if (dateStr == null || dateStr.trim() == "") {
			return null;
		}
		
		DateFormat dt = new SimpleDateFormat("yyyyMMdd");
		if (dateStr.contains("/")) {
			dt = new SimpleDateFormat("yyyy/MM/dd");
		} else if (dateStr.contains("-")) {
			dt = new SimpleDateFormat("yyyy-MM-dd");
		}
		
		try {
			return dt.parse(dateStr);
		} catch (ParseException e) {
			throw new DateFormatException("申请日格式错误，正确的格式为yyyyMMdd, 文件中的格式为 " + dateStr);
		}
	}
	
	private static int getCategoryId(String categoryName){
		int targetNumber=0;
		char a=categoryName.charAt(1);
		char b=categoryName.charAt(2);
		if(a==0){
			targetNumber=b;
		}else{
			targetNumber=Integer.valueOf(categoryName.substring(1,3))  ;
		}
		return targetNumber;
		
	}
	
	private static String getCategoryName(String categoryName){
		String targetName=categoryName.substring(categoryName.lastIndexOf("-")+1);
		return targetName;
	}
	
	private static BrandCategory getBrandCategory(Row row){
		String categoryNode = row.getCell(2).getStringCellValue().trim();
		int categoryId=getCategoryId(categoryNode);
		String categoryName=getCategoryName(categoryNode);
		BrandCategory brandCategory=new BrandCategory();
		brandCategory.setCategoryId(categoryId);
		brandCategory.setCategoryName(categoryName);
		return brandCategory;
	}
	
//	public static void main(String[] args) {
//		String categoryName="第13类-日化用品";
//		System.out.println(getCategoryName(categoryName));
//	}
}
