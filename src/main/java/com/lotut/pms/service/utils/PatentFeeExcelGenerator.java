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
	
	private static void writelRowName( HSSFRow row) {
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
}
