package com.lotut.pms.service.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.lotut.pms.domain.Notice;

public class NoticeExcelGenerator {
	public static void writeNoticeRecordsToExcel(List<Notice> noticeRecords, String resultExcelPath) throws IOException {
		final String SHEET_NAME = "通知书清单表";
		FileOutputStream resultExcelOutputStream = new FileOutputStream(resultExcelPath);
		HSSFWorkbook workbook = new HSSFWorkbook();
		
		HSSFSheet sheet = workbook.createSheet(SHEET_NAME);

		HSSFRow creatRowName = sheet.createRow(0);
		
		writeNoticeRowName(creatRowName);

		for (int i = 0; i < noticeRecords.size(); i++) {
			Notice noticeRecord = noticeRecords.get(i);
			HSSFRow row = sheet.createRow(i + 1);
			writeNocticRecordToRow(noticeRecord, row, i+1);
		}

		workbook.write(resultExcelOutputStream);
		workbook.close();
	}	
	
	private static void writeNoticeRowName( HSSFRow row) {
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
		
		HSSFCell shareUsersCellName = row.createCell(5);
		shareUsersCellName.setCellValue("共享人");
		
		HSSFCell dispatchDateRowName = row.createCell(6);
		dispatchDateRowName.setCellValue("发文日");
		
		HSSFCell noticeNameRowName = row.createCell(6);
		noticeNameRowName.setCellValue("通知书名称");
		
		HSSFCell paperAppRowName = row.createCell(6);
		paperAppRowName.setCellValue("纸件申请");
		
		HSSFCell deadlineRowName = row.createCell(7);
		deadlineRowName.setCellValue("期限和通知状态");
		
		
		
		
	}
	
	private static void writeNocticRecordToRow(Notice notice, HSSFRow row, int rowIndex) {
		HSSFCell seqNoCell = row.createCell(0);
		seqNoCell.setCellValue(rowIndex);
		
		HSSFCell appNoCell = row.createCell(1);
		appNoCell.setCellValue(notice.getPatent().getAppNo());
		
		HSSFCell patentNameCell = row.createCell(2);
		patentNameCell.setCellValue(notice.getPatent().getName());
		
		HSSFCell  patentStatusTextCell= row.createCell(3);
		patentStatusTextCell.setCellValue(notice.getPatent().getPatentStatusText());
		
		HSSFCell userNameCell = row.createCell(4);
		userNameCell.setCellValue(notice.getPatent().getShareUsersAsString());
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		HSSFCell dispatchCell = row.createCell(5);
		dispatchCell.setCellValue(sdf.format(notice.getDispatchDate()));
	
		HSSFCell noticeNameCell = row.createCell(8);
		noticeNameCell.setCellValue(notice.getName());
		
		HSSFCell paperApplyRowNameCell = row.createCell(9);
		paperApplyRowNameCell.setCellValue(notice.getPaperApplyType().getPaperTypeDescription());
		
		HSSFCell deadlineCell = row.createCell(10);
		deadlineCell.setCellValue(notice.getProcessStatus().getProcessStatusDescription());
	}
}
