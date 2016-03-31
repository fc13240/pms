package com.lotut.pms.service.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public abstract class ExcelParser<T> {
	private InputStream inputStream;
	private int rowsSkipped = 0;
	
	public ExcelParser(String filePath) throws FileNotFoundException {
		this(new FileInputStream(filePath));
	}
	
	public ExcelParser (InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	public List<T> parseExcel() throws IOException {
		try (Workbook wb = new HSSFWorkbook(inputStream);) {
			Sheet sheet = wb.getSheetAt(0);
			List<T> records = new ArrayList<>();
			Iterator<Row> rowIter = sheet.rowIterator();
			skipRows(rowIter);
			
			while (rowIter.hasNext()) {
				Row row = rowIter.next();
				T record = parseRow(row);
				records.add(record);
			}
			
			return records;
		} 
	}
	
	private void skipRows(Iterator<Row> rowIter) {
		while (rowsSkipped > 0) {
			if (rowIter.hasNext()) {
				rowIter.next();
			}
			rowsSkipped--;
		}
	}
	
	protected abstract T parseRow(Row row);

	public int getRowsSkipped() {
		return rowsSkipped;
	}

	public void setRowsSkipped(int rowsSkipped) {
		if (rowsSkipped < 0) {
			throw new IllegalArgumentException("The rowsSkipped must be >= 0");
		}
		
		this.rowsSkipped = rowsSkipped;
	}
}
