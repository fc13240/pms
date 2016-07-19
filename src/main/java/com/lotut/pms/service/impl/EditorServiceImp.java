package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.TextEditorDao;
import com.lotut.pms.domain.EditorTest;
import com.lotut.pms.service.EditorService;

public class EditorServiceImp implements EditorService{
	private TextEditorDao editorDao;
	@Override
	public void saveEditorText(EditorTest editorTest) {
		editorDao.saveEditorText(editorTest);
	}
	public EditorServiceImp(TextEditorDao editorDao) {
		this.editorDao = editorDao;
	}
	@Override
	public List<Integer> findTextId() {
		return editorDao.findTextId();
	}
	@Override
	public EditorTest findTextById(int editorId) {
		return editorDao.findTextById(editorId);
	}
	
	
}
