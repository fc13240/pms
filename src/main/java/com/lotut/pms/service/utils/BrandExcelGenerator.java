package com.lotut.pms.service.utils;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.lotut.pms.domain.BrandManagement;

public class BrandExcelGenerator {
	public static void writeBrandToexcel(List<BrandManagement> brands,String resultBrandExcelPath){
		final String excelName = "商标清单";
		try {
			FileOutputStream fileOutputStream = new FileOutputStream(resultBrandExcelPath);
			HSSFWorkbook hwb = new HSSFWorkbook();
			HSSFSheet sheet= hwb.createSheet(excelName);
			
			HSSFRow createRowName = sheet.createRow(0);
			
			writeBrandFirstRowName(createRowName);
			
			for(int i = 0; i<brands.size();i++){
				BrandManagement brand = brands.get(i);
				HSSFRow createRow = sheet.createRow(i+1);
				wirteBrandRowValue(createRow,brand,i+1);
			}
			
			
			hwb.write(fileOutputStream);
			hwb.close();
			fileOutputStream.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	private static void writeBrandFirstRowName(HSSFRow createRowName){
		HSSFCell  sequenceNumberRowName = createRowName.createCell(0);
		sequenceNumberRowName.setCellValue("序号");
		
		HSSFCell brandTypeRowName = createRowName.createCell(1);
		brandTypeRowName.setCellValue("商标类别");
		
		HSSFCell applicationNumberRowName = createRowName.createCell(2);
		applicationNumberRowName.setCellValue("申请号");
		
		HSSFCell registerNumberRowName = createRowName.createCell(3);
		registerNumberRowName.setCellValue("注册号");
		
		HSSFCell brandNameRowName = createRowName.createCell(4);
		brandNameRowName.setCellValue("商标名称");
		
		HSSFCell appPersonRowName = createRowName.createCell(5);
		appPersonRowName.setCellValue("专有人");
		
		HSSFCell sharePersonRowName = createRowName.createCell(6);
		sharePersonRowName.setCellValue("共享人");
		
		HSSFCell applicationDateRowName = createRowName.createCell(7);
		applicationDateRowName.setCellValue("申请日");
		
		HSSFCell registerDateRowName = createRowName.createCell(8);
		registerDateRowName.setCellValue("注册日");
		
		HSSFCell legalStatusRowName = createRowName.createCell(8);
		legalStatusRowName.setCellValue("法律状态");
		
		HSSFCell priceRowName = createRowName.createCell(8);
		priceRowName.setCellValue("交易价格");
		
		HSSFCell transactionStatusRowName = createRowName.createCell(8);
		transactionStatusRowName.setCellValue("交易状态");
	}
	
	private static void wirteBrandRowValue(HSSFRow createRow,BrandManagement brand,int rowIndex){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		HSSFCell  sequenceNumber = createRow.createCell(0);
		//sequenceNumber.setCellValue("序号");
		sequenceNumber.setCellValue(rowIndex);
		
		HSSFCell brandType = createRow.createCell(1);
		//brandType.setCellValue("商标类别");
		brandType.setCellValue(brand.getBrandCategory()==null ? "无" : brand.getBrandCategory().getCategoryName());
		
		HSSFCell applicationNumber = createRow.createCell(2);
		//applicationNumber.setCellValue("申请号");
		applicationNumber.setCellValue(brand.getAppNo());
		
		HSSFCell registerNumber = createRow.createCell(3);
		//registerNumber.setCellValue("注册号");
		registerNumber.setCellValue(brand.getBrandNo());
		
		HSSFCell brandName = createRow.createCell(4);
		//brandName.setCellValue("商标名称");
		brandName.setCellValue(brand.getName());
		
		HSSFCell appPerson = createRow.createCell(5);
		//appPerson.setCellValue("专有人");
		appPerson.setCellValue(brand.getAppPerson());
		
		HSSFCell sharePerson = createRow.createCell(6);
		//sharePerson.setCellValue("共享人");
		sharePerson.setCellValue(brand.getShareUsers().isEmpty()==true ? "无" : brand.getShareUsersAsString());
		
		HSSFCell applicationDate = createRow.createCell(7);
		//applicationDate.setCellValue("申请日");
		applicationDate.setCellValue(brand.getAppDate()==null ? "" : sdf.format(brand.getAppDate()));
		
		HSSFCell registerDate = createRow.createCell(8);
		//registerDate.setCellValue("注册日");
		registerDate.setCellValue(brand.getPublishDate()==null ? "" : sdf.format(brand.getPublishDate()));
		
		HSSFCell legalStatus = createRow.createCell(8);
		//legalStatus.setCellValue("法律状态");
		legalStatus.setCellValue(brand.getBrandLegalStatus()==null ? "" : brand.getBrandLegalStatus().getLegalStatusName());
		
		HSSFCell price = createRow.createCell(8);
		//price.setCellValue("交易价格");
		price.setCellValue(brand.getPrice());
		
		HSSFCell transactionStatus = createRow.createCell(8);
		//transactionStatus.setCellValue("交易状态");
		transactionStatus.setCellValue(brand.getTransactionStatusText());
		
	}

}
