package com.lotut.pms.service.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import com.lotut.pms.domain.Patent;

public class PatentExcelGenerator {
	public static void writerPatentRecodesToExcel(List<Patent> patents,String resultExcelPath) throws IOException{
		final String CTREATE_SHEET = "专利清单详情";
		FileOutputStream resultExcelOutputStream=new FileOutputStream(resultExcelPath);
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet(CTREATE_SHEET);
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		HSSFRow creatRowName = sheet.createRow(0);
		writelRowName(creatRowName,style);
		
		for (int i = 0; i < patents.size(); i++) {
			Patent patent =patents.get(i);
			HSSFRow row = sheet.createRow(i + 1);
			writeFeeRecordToRow(patent,row,i+1,style);
		}
		workbook.write(resultExcelOutputStream);
		workbook.close();
		
	}
	
	private static void writelRowName( HSSFRow row,HSSFCellStyle style) {
		HSSFCell seqNoCellRowName = row.createCell(0);
		seqNoCellRowName.setCellValue("序号");
		seqNoCellRowName.setCellStyle(style);
		
		HSSFCell appNoCellRowName = row.createCell(1);
		appNoCellRowName.setCellValue("申请号");
		appNoCellRowName.setCellStyle(style);
		
		HSSFCell patentNameCellRowName = row.createCell(2);
		patentNameCellRowName.setCellValue("专利名称");
		patentNameCellRowName.setCellStyle(style);
		
		HSSFCell firstAppPersonCellRowName = row.createCell(3);
		firstAppPersonCellRowName.setCellValue("第一申请人");
		firstAppPersonCellRowName.setCellStyle(style);
		
		HSSFCell  appDateRowName= row.createCell(4);
		appDateRowName.setCellValue("申请日");
		appDateRowName.setCellStyle(style);
		
		HSSFCell  patentTypeCellRowlName= row.createCell(5);
		patentTypeCellRowlName.setCellValue("专利类型");
		patentTypeCellRowlName.setCellStyle(style);
		
		HSSFCell  patentStatusTextRowName= row.createCell(6);
		patentStatusTextRowName.setCellValue("案件状态");
		patentStatusTextRowName.setCellStyle(style);
		
		HSSFCell invoiceCodeCellRowName = row.createCell(7);
		invoiceCodeCellRowName.setCellValue("内部编码");
		invoiceCodeCellRowName.setCellStyle(style);
	}
	
	private static void writeFeeRecordToRow(Patent patent,HSSFRow row,int rowIndex,HSSFCellStyle style){
		HSSFCell seqNoCell = row.createCell(0);
		seqNoCell.setCellValue(rowIndex);
		seqNoCell.setCellStyle(style);
		
		HSSFCell appNoCell = row.createCell(1);
		appNoCell.setCellValue(patent.getAppNo());
		appNoCell.setCellStyle(style);
		
		HSSFCell patentNameCell = row.createCell(2);
		patentNameCell.setCellValue(patent.getName());
		patentNameCell.setCellStyle(style);
		
		HSSFCell firstAppPersonCell= row.createCell(3);
		firstAppPersonCell.setCellValue(patent.getFirstAppPerson());
		firstAppPersonCell.setCellStyle(style);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		HSSFCell  appDateCell= row.createCell(4);
		appDateCell.setCellValue(sdf.format(patent.getAppDate()));
		appDateCell.setCellStyle(style);
		
		HSSFCell  patentTypeCell= row.createCell(5);
		patentTypeCell.setCellValue(patent.getPatentType().getTypeDescription());
		patentTypeCell.setCellStyle(style);
		
		HSSFCell  patentStatusTextCell= row.createCell(6);
		patentStatusTextCell.setCellValue(patent.getPatentStatusText());
		
		HSSFCell invoiceCodeCell = row.createCell(7);
		invoiceCodeCell.setCellValue(patent.getInternalCode());
		invoiceCodeCell.setCellStyle(style);
	}
	
	public static void writePatentRecordsToExcel(List<Patent> patentRecords, String resultExcelPath) throws IOException {
		final String SHEET_NAME = "专利清单表";
		FileOutputStream resultExcelOutputStream = new FileOutputStream(resultExcelPath);
		HSSFWorkbook workbook = new HSSFWorkbook();
		
		HSSFSheet sheet = workbook.createSheet(SHEET_NAME);

		HSSFRow creatRowName = sheet.createRow(0);
		
		writePatentRowName(creatRowName);

		for (int i = 0; i < patentRecords.size(); i++) {
			Patent patentRecord = patentRecords.get(i);
			HSSFRow row = sheet.createRow(i + 1);
			writePatentRecordToRow(patentRecord, row, i+1);
		}

		workbook.write(resultExcelOutputStream);
		workbook.close();
	}	
	
	private static void writePatentRowName( HSSFRow row) {
		HSSFCell seqNoCellRowName = row.createCell(0);
		seqNoCellRowName.setCellValue("序号");
		
		HSSFCell patentTypeCellRowName = row.createCell(1);
		patentTypeCellRowName.setCellValue("专利类型");
		
		HSSFCell appNoCellRowName = row.createCell(2);
		appNoCellRowName.setCellValue("申请号");
		
		HSSFCell patentNameCellRowName = row.createCell(3);
		patentNameCellRowName.setCellValue("专利名称");
		
		HSSFCell userNameCellRowName = row.createCell(4);
		userNameCellRowName.setCellValue("第一申请人");
		
		HSSFCell appDateRowName = row.createCell(5);
		appDateRowName.setCellValue("申请日");
		
		HSSFCell deadlineRowName = row.createCell(6);
		deadlineRowName.setCellValue("缴费年日");
		
		HSSFCell addDateRowName = row.createCell(7);
		addDateRowName.setCellValue("添加日");
		
		HSSFCell  patentStatusTextRowName= row.createCell(8);
		patentStatusTextRowName.setCellValue("案件状态");
		
		HSSFCell internalCodeRowName = row.createCell(9);
		internalCodeRowName.setCellValue("内部编码");
		
		HSSFCell shareUsersCellName = row.createCell(10);
		shareUsersCellName.setCellValue("共享人");
		
	}
	
	private static void writePatentRecordToRow(Patent patent, HSSFRow row, int rowIndex) {
		HSSFCell seqNoCell = row.createCell(0);
		seqNoCell.setCellValue(rowIndex);
		
		HSSFCell patentTypeCell = row.createCell(1);
		patentTypeCell.setCellValue(patent.getPatentType().getTypeDescription());
		
		HSSFCell appNoCell = row.createCell(2);
		appNoCell.setCellValue(patent.getAppNo());
		
		HSSFCell patentNameCell = row.createCell(3);
		patentNameCell.setCellValue(patent.getName());
		
		HSSFCell  appPersonCell= row.createCell(4);
		appPersonCell.setCellValue(patent.getAppPerson());
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		HSSFCell appDateCell = row.createCell(5);
		appDateCell.setCellValue(sdf.format(patent.getAppDate()));
		
		SimpleDateFormat sd=new SimpleDateFormat("M月dd日");
		HSSFCell feeDateCell = row.createCell(6);
		feeDateCell.setCellValue(sd.format(patent.getAppDate()));
		
		SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		HSSFCell amountCell = row.createCell(7);
		amountCell.setCellValue(s.format(patent.getCreateTime()));
		
		HSSFCell patentStatusTextCell = row.createCell(8);
		patentStatusTextCell.setCellValue(patent.getPatentStatusText());
		
		HSSFCell internalCodeCell = row.createCell(9);
		internalCodeCell.setCellValue(patent.getInternalCode());
		
		HSSFCell shareUsersCell = row.createCell(10);
		shareUsersCell.setCellValue(patent.getShareUsersAsString());
	}
}
