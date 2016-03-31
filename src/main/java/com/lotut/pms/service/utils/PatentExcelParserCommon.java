package com.lotut.pms.service.utils;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.poi.ss.usermodel.Row;

import com.lotut.pms.domain.Patent;
import com.lotut.pms.service.exception.DateFormatException;

public class PatentExcelParserCommon extends ExcelParser<Patent> {
	
	public static void main(String[] args) {
		
	}

	public PatentExcelParserCommon(InputStream inputStream) {
		super(inputStream);
	}
	
	public PatentExcelParserCommon(String filePath) throws FileNotFoundException {
		super(filePath);
	}

	@Override
	protected Patent parseRow(Row row) {
		String appNo = row.getCell(0).getStringCellValue();
		String name = row.getCell(1).getStringCellValue();
		String appPerson = row.getCell(2).getStringCellValue();
		Date appDate = parseDate(row.getCell(3).getStringCellValue());
		int patentType = getPatentType(row.getCell(4).getStringCellValue());
		int patentStatus = getPatentStatus(row.getCell(6).getStringCellValue());
		
		Patent patent = new Patent(appNo, name, appPerson, appDate, patentType, patentStatus);
		
		return patent;
	}
	
	public static int getPatentType(String patentTypeDescription) {
		final String INVENT_STRING = "发明";
		final String PRACTICAL_STRING = "实用";
		
		if (patentTypeDescription.contains(INVENT_STRING)) {
			return 1;
		} else if (patentTypeDescription.contains(PRACTICAL_STRING)) {
			return 2;
		} else {
			return 3;
		}
	}
	
	public static int getPatentStatus(String patentStatusDescription) {
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
	
	public static Date parseDate(String dateStr) {
		try {
			DateFormat dt = new SimpleDateFormat("yyyyMMdd");
			return dt.parse(dateStr);
		} catch (ParseException e) {
			throw new DateFormatException("申请日格式错误，正确的格式为yyyyMMdd, 文件中的格式为" + dateStr);
		}
	}

}
