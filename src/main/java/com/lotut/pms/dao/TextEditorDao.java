package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.EditorTest;

public interface TextEditorDao {
	void saveEditorText(EditorTest editorTest);
	
	List<Integer> findTextId();
	EditorTest findTextById(int editorId);
}
