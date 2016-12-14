package com.lotut.pms.service.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.SalePatentGood;

public class PatentTransactionExcelGenerator {
	public static void writePatentRecordsToExcel(List<Patent> patentRecords, String resultExcelPath) throws IOException {
		final String SHEET_NAME = "专利交易清单表";
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
	
		HSSFCell patentStatusTextRowName = row.createCell(5);
		patentStatusTextRowName.setCellValue("案件状态");
			
		
		HSSFCell fieldFirstRowName = row.createCell(6);
		fieldFirstRowName.setCellValue("所属领域一级");
		
		HSSFCell fieldSecondRowName = row.createCell(7);
		fieldSecondRowName.setCellValue("所属领域二级");
		
		HSSFCell  transactionTypeRowName= row.createCell(8);
		transactionTypeRowName.setCellValue("交易类型");
		
		HSSFCell priceRowName = row.createCell(9);
		priceRowName.setCellValue("价格");
		
		HSSFCell sellStatusCellName = row.createCell(10);
		sellStatusCellName.setCellValue("交易状态");
		
		HSSFCell addDateRowName = row.createCell(11);
		addDateRowName.setCellValue("添加日");
		
		HSSFCell transactionDateCellName = row.createCell(12);
		transactionDateCellName.setCellValue("交易日");
		
		HSSFCell descriptionRowName = row.createCell(13);
		descriptionRowName.setCellValue("说明");
		
		HSSFCell transferorRowName = row.createCell(14);
		transferorRowName.setCellValue("转让方");		
	}
	
	private static void writePatentRecordToRow(Patent patent, HSSFRow row, int rowIndex) {
		SalePatentGood good = patent.getSalePatentGood();
		
		HSSFCell seqNoCell = row.createCell(0);
		seqNoCell.setCellValue(rowIndex);
		
		HSSFCell patentTypeCell = row.createCell(1);
		patentTypeCell.setCellValue(patent.getPatentType() == null ?"无":patent.getPatentType().getTypeDescription());
		
		HSSFCell appNoCell = row.createCell(2);
		appNoCell.setCellValue(patent.getAppNo());
		
		HSSFCell patentNameCell = row.createCell(3);
		patentNameCell.setCellValue(patent.getName());
		
		HSSFCell  appPersonCell= row.createCell(4);
		appPersonCell.setCellValue(patent.getAppPerson());
		
		
		HSSFCell  patentStatusTextCell= row.createCell(5);
		patentStatusTextCell.setCellValue(patent.getPatentStatusText());
				
		
		HSSFCell  fieldFirstCell= row.createCell(6);
		fieldFirstCell.setCellValue(good.getFirstColumn().getName());
				
		HSSFCell  fieldSecondCell= row.createCell(7);
		fieldSecondCell.setCellValue(good.getSecondColumn().getName());
					
		HSSFCell  transactionTypeCell= row.createCell(8);
		transactionTypeCell.setCellValue(good.getTransactionStatus(good.getTransactionType()));
		
		HSSFCell  priceCell= row.createCell(9);
		priceCell.setCellValue(good.getPrice());
					
		HSSFCell  sellStatusCell= row.createCell(10);
		sellStatusCell.setCellValue(good.getStatusText(good.getStatus()));
					
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		HSSFCell addDateCell = row.createCell(11);
		addDateCell.setCellValue(sdf.format(good.getAddDate()));										

		HSSFCell transactionDateCell = row.createCell(12);
		transactionDateCell.setCellValue(sdf.format(good.getTransactionDate()));										

		HSSFCell  descriptionTypeCell= row.createCell(13);
		descriptionTypeCell.setCellValue(good.getDescription());
		
		HSSFCell  transferorCell= row.createCell(14);
		transferorCell.setCellValue(good.getTransferor());
				
		
	}
}
