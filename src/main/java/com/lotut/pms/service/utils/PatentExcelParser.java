package com.lotut.pms.service.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.lotut.pms.domain.Patent;
import com.lotut.pms.service.exception.DateFormatException;
import com.lotut.pms.util.PrincipalUtils;

public class PatentExcelParser {
	
	public static void main(String[] args) throws Exception {
		InputStream in = new FileInputStream("C:\\Users\\Administrator\\Desktop\\变更20160202.xls");
		List<Patent> patentRecords = parsePatentFile(in);
		for (Patent p: patentRecords) {
			System.out.println(p.getPatentType().getPatentTypeId());
		}
	}
	
	public static List<Patent> parsePatentFile(InputStream fileInputStream) throws IOException {
		try (Workbook wb = new HSSFWorkbook(fileInputStream); ) {
			Sheet patentSheet = wb.getSheetAt(0);
			List<Patent> patentRecords = parseSheet(patentSheet);
			
			return patentRecords;
		}
	}
	
	
	private static List<Patent> parseSheet(Sheet sheet) {
		List<Patent> patentRecords = new ArrayList<>();
		Iterator<Row> rowIter = sheet.rowIterator();
		if (rowIter.hasNext()) rowIter.next();
		
		while (rowIter.hasNext()) {
			Row row = rowIter.next();
			if (isEmptyRow(row)) {
				break;
			}
			Patent patent = parseRow(row);
			patentRecords.add(patent);
		}
		
		return patentRecords;
	}
	
	private static boolean isEmptyRow(Row row) {
		if (row == null || row.getCell(0) == null || row.getCell(0).getStringCellValue().trim() == "") {
			return true;
		}
		
		return false;
	}
	
	private static Patent parseRow(Row row) {
		String appNo = row.getCell(0).getStringCellValue().trim();
		String name = row.getCell(1).getStringCellValue();
		String appPerson = row.getCell(2).getStringCellValue();
		Date appDate = parseDate(row.getCell(3).getStringCellValue());
		int patentType = getPatentType(row.getCell(4).getStringCellValue());
		int patentStatus = getPatentStatus(row.getCell(6).getStringCellValue());
		int userId = PrincipalUtils.getCurrentUserId();
		
		Patent patent = new Patent(appNo, name, appPerson, appDate, patentType, patentStatus);
		patent.setOwnerId(userId);
		
		return patent;
	}
	
	private static int getPatentType(String patentTypeDescription) {
		final String INVENT_TYPE = "发明";
		final String PRACTICAL_TYPE = "实用";
		
		if (patentTypeDescription.contains(INVENT_TYPE)) {
			return 1;
		} else if (patentTypeDescription.contains(PRACTICAL_TYPE)) {
			return 2;
		} else {
			return 3;
		}
	}
	
	private static int getPatentStatus(String patentStatusDescription) {
		if (patentStatusDescription.contains("等待申请费")) {
			return 1;
		} else if (patentStatusDescription.contains("待答复")) {
			return 2;
		} else if (patentStatusDescription.contains("等年登印费")) {
			return 3;
		} else if (patentStatusDescription.contains("待恢复")) {
			return 4;
		} else if (patentStatusDescription.contains("失效")) {
			return 5;
		} else if (patentStatusDescription.contains("专利权维持")) {
			return 6;
		} else {
			return 7;
		}
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
}
