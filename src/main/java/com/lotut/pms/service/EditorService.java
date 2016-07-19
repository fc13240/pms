package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.EditorTest;

public interface EditorService {
	void saveEditorText(EditorTest editorTest);
	
	List<Integer> findTextId();
	EditorTest findTextById(int editorId);
}
