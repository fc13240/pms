package com.lotut.pms.service.utils;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.lotut.pms.domain.BrandNotice;

public class BrandNoticeExcelGenerator {
	public static void writeBrandNoticeToExcel(List<BrandNotice> notices,String resultNoticeExcelPath) throws Exception{
		FileOutputStream outputStream = new FileOutputStream(resultNoticeExcelPath);
		HSSFWorkbook hwb = new HSSFWorkbook();
		HSSFSheet sheet=hwb.createSheet("商标通知书清单");
		HSSFRow excelFirstRow = sheet.createRow(0);
		
		writeFirstRowValue(excelFirstRow);
		for(int i = 0; i < notices.size(); i++){
			BrandNotice notice = notices.get(i);
			HSSFRow noticeRow = sheet.createRow(i+1);
			writenoticeValueToRowCell(notice, noticeRow, i+1);
		}
		hwb.write(outputStream);
		hwb.close();
		outputStream.close();
	}
	
	private static void writeFirstRowValue(HSSFRow excelFirstRow){
		HSSFCell  sequenceNumberRowName= excelFirstRow.createCell(0);
		sequenceNumberRowName.setCellValue("序号");
		
		HSSFCell  brandTypeRowName= excelFirstRow.createCell(1);
		brandTypeRowName.setCellValue("商标类别");
		
		HSSFCell  appNoRowName= excelFirstRow.createCell(2);
		appNoRowName.setCellValue("申请号");
		
		HSSFCell  registerRowName= excelFirstRow.createCell(3);
		registerRowName.setCellValue("注册号");
		
		HSSFCell  brandNameRowName= excelFirstRow.createCell(4);
		brandNameRowName.setCellValue("商标名称");
		
		HSSFCell  appPersonRowName= excelFirstRow.createCell(5);
		appPersonRowName.setCellValue("专有人");
		
		HSSFCell  sharePersonRowName= excelFirstRow.createCell(6);
		sharePersonRowName.setCellValue("共享人");
		
		HSSFCell  appDateRowName= excelFirstRow.createCell(7);
		appDateRowName.setCellValue("申请日");
		
		HSSFCell  dispatchDateRowName= excelFirstRow.createCell(8);
		dispatchDateRowName.setCellValue("发文日");
		
		HSSFCell  noticeNameRowName= excelFirstRow.createCell(9);
		noticeNameRowName.setCellValue("通知书名称");
		
		HSSFCell  internalCodeRowName= excelFirstRow.createCell(9);
		internalCodeRowName.setCellValue("内部编码");
		
		HSSFCell  remainDaysRowName= excelFirstRow.createCell(9);
		remainDaysRowName.setCellValue("剩余天数");
	}
	
	
	private static void writenoticeValueToRowCell(BrandNotice notice, HSSFRow noticeRow,int rowIndex){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		HSSFCell sequenceNumber = noticeRow.createCell(0);
		sequenceNumber.setCellValue(rowIndex);
		
		HSSFCell  brandType= noticeRow.createCell(1);
		//brandType.setCellValue("商标类别");
		brandType.setCellValue(notice.getBrand().getBrandCategory()==null ? "" : notice.getBrand().getBrandCategory().getCategoryName());
		
		HSSFCell  appNo= noticeRow.createCell(2);
		//appNo.setCellValue("申请号");
		appNo.setCellValue(notice.getBrand().getAppNo());
		
		HSSFCell  register= noticeRow.createCell(3);
		//register.setCellValue("注册号");
		register.setCellValue(notice.getBrand().getBrandNo());
		
		HSSFCell  brandName= noticeRow.createCell(4);
		//brandName.setCellValue("商标名称");
		brandName.setCellValue(notice.getBrand().getName());
		
		HSSFCell  appPerson= noticeRow.createCell(5);
		//appPerson.setCellValue("专有人");
		appPerson.setCellValue(notice.getBrand().getAppPerson());
		
		HSSFCell  sharePerson= noticeRow.createCell(6);
		//sharePerson.setCellValue("共享人");
		sharePerson.setCellValue(notice.getBrand().getShareUsersAsString());
		
		HSSFCell  appDate= noticeRow.createCell(7);
		//appDate.setCellValue("申请日");
		appDate.setCellValue(notice.getBrand().getAppDate()==null ? "" : sdf.format(notice.getBrand().getAppDate()));
		
		HSSFCell  dispatchDate= noticeRow.createCell(8);
		//dispatchDate.setCellValue("发文日");
		dispatchDate.setCellValue(notice.getDispatchDate()==null ? "" : sdf.format(notice.getDispatchDate()));
		
		HSSFCell  noticeName= noticeRow.createCell(9);
		//noticeName.setCellValue("通知书名称");
		noticeName.setCellValue(notice.getName());
		
		HSSFCell  internalCode= noticeRow.createCell(9);
		//internalCodeRowName.setCellValue("内部编码");
		internalCode.setCellValue(notice.getNoticeCode()==null ? "" : notice.getNoticeCode());
		
		HSSFCell  remainDays= noticeRow.createCell(9);
		//remainDays.setCellValue("剩余天数");
		remainDays.setCellValue(notice.getRemainDaysDescription());
	}
}
