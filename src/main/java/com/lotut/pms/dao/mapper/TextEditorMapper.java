package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.EditorTest;

public interface TextEditorMapper {
	void saveEditorText(EditorTest editorTest);
	List<Integer> findTextId();
	EditorTest findTextById(@Param("editorId") int editorId);
}
