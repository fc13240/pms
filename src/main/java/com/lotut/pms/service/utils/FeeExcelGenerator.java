package com.lotut.pms.service.utils;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.service.constants.FeeTypeCode;

public class FeeExcelGenerator {
	public static void writeFeeRecordsToExcel(List<Fee> feeRecords, String resultExcelPath) throws IOException {
		try (FileInputStream templateExcelInputStream = new FileInputStream(Settings.FEE_EXPORT_EXCEL_TEMPLATE);
				FileOutputStream resultExcelOutputStream = new FileOutputStream(resultExcelPath);
				HSSFWorkbook workbook = new HSSFWorkbook(templateExcelInputStream);) {
			
			HSSFSheet sheet = workbook.getSheet(Settings.FEE_EXPORT_EXCEL_SHEET_NAME);
			
			HSSFRow summaryRow = sheet.getRow(1);
			
			writeTotalRow(feeRecords, summaryRow);

			for (int i = 0; i < feeRecords.size(); i++) {
				Fee feeRecord = feeRecords.get(i);
				HSSFRow row = sheet.getRow(i + 2);
				writeFeeRecordToRow(feeRecord, row, i+1);
			}

			workbook.write(resultExcelOutputStream);
			workbook.close();
		}
	}	
	
	private static void writeTotalRow(List<Fee> feeRecords, HSSFRow summaryRow) {
		HSSFCell totalAmountCell = summaryRow.getCell(5);
		
		double totalAmount = 0.0;
		for (Fee feeRecord: feeRecords) {
			totalAmount += feeRecord.getAmount();
		}
		
		totalAmountCell.setCellValue(totalAmount);
	}
	
	private static void writeFeeRecordToRow(Fee fee, HSSFRow row, int rowIndex) {
		HSSFCell seqNoCell = row.getCell(0);
		HSSFCell appNoCell = row.getCell(1);
		HSSFCell userCell = row.getCell(2);
		HSSFCell feeNameCell = row.getCell(3);
		HSSFCell feeCodeCell = row.getCell(4);
		HSSFCell amountCell = row.getCell(5);
		
		seqNoCell.setCellValue(rowIndex);
		appNoCell.setCellValue(fee.getPatent().getAppNo());
		userCell.setCellValue(fee.getInvoiceTitle());
		feeNameCell.setCellValue(fee.getFeeType());
		feeCodeCell.setCellValue(getFeeCode(fee.getPatent().getPatentType().getPatentTypeId(), fee.getFeeType()));
		amountCell.setCellValue(fee.getAmount());
	}
	
	private static String getFeeCode(int patentType, String feeType) {
		return FeeTypeCode.getFeeCodeByType(patentType, feeType);
	}
}
