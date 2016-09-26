package com.lotut.pms.service.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Patent;

public class PatentFeeExcelGenerator {
	
	public static void writeFeeRecordsToExcel(List<Fee> feeRecords, String resultExcelPath) throws IOException {
		final String SHEET_NAME = "专利交费清单表";
		FileOutputStream resultExcelOutputStream = new FileOutputStream(resultExcelPath);
		HSSFWorkbook workbook = new HSSFWorkbook();
		
		HSSFSheet sheet = workbook.createSheet(SHEET_NAME);

		HSSFRow creatRowName = sheet.createRow(0);
		
		writelRowName(creatRowName);

		for (int i = 0; i < feeRecords.size(); i++) {
			Fee feeRecord = feeRecords.get(i);
			HSSFRow row = sheet.createRow(i + 1);
			writeFeeRecordToRow(feeRecord, row, i+1);
		}

		workbook.write(resultExcelOutputStream);
		workbook.close();
	}	
	
	private static void writelRowName(HSSFRow row) {
		HSSFCell seqNoCellRowName = row.createCell(0);
		seqNoCellRowName.setCellValue("序号");
		
		HSSFCell appNoCellRowName = row.createCell(1);
		appNoCellRowName.setCellValue("申请号");
		
		HSSFCell patentNameCellRowName = row.createCell(2);
		patentNameCellRowName.setCellValue("专利名称");
		HSSFCell userNameCellRowName = row.createCell(3);
		
		userNameCellRowName.setCellValue("第一申请人");
		
		HSSFCell  patentStatusTextRowName= row.createCell(4);
		patentStatusTextRowName.setCellValue("案件状态");
		
		HSSFCell deadlineRowName = row.createCell(5);
		deadlineRowName.setCellValue("交费截止日");
		
		
		HSSFCell feeNameCellName = row.createCell(6);
		feeNameCellName.setCellValue("交费种类");
		
		HSSFCell amountCellRowname = row.createCell(7);
		amountCellRowname.setCellValue("交费金额");
		
		HSSFCell internalTitleRowName = row.createCell(8);
		internalTitleRowName.setCellValue("发票抬头");
		
		HSSFCell feePaymentStatus = row.createCell(9);
		feePaymentStatus.setCellValue("交费状态");
		
	}
	
	
	
	private static void writeFeeRecordToRow(Fee fee, HSSFRow row, int rowIndex) {
		HSSFCell seqNoCell = row.createCell(0);
		seqNoCell.setCellValue(rowIndex);
		
		HSSFCell appNoCell = row.createCell(1);
		appNoCell.setCellValue(fee.getPatent().getAppNo());
		
		HSSFCell patentNameCell = row.createCell(2);
		patentNameCell.setCellValue(fee.getPatent().getName());
		
		HSSFCell userNameCell = row.createCell(3);
		userNameCell.setCellValue(fee.getPatent().getFirstAppPerson());
		
		HSSFCell  patentStatusText= row.createCell(4);
		patentStatusText.setCellValue(fee.getPatent().getPatentStatusText());
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		HSSFCell deadlineCell = row.createCell(5);
		deadlineCell.setCellValue(sdf.format(fee.getDeadline()));
		
		
		HSSFCell feeNameCell = row.createCell(6);
		feeNameCell.setCellValue(fee.getFeeType());
		
		HSSFCell amountCell = row.createCell(7);
		amountCell.setCellValue("￥"+fee.getAmount());
		
		HSSFCell internalTitleCell = row.createCell(8);
		internalTitleCell.setCellValue(fee.getInvoiceTitle());
		
		HSSFCell feePaymentStatus = row.createCell(9);
		feePaymentStatus.setCellValue(fee.getPaymentStatus().getPayementStatusDescription());
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
