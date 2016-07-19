package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.TextEditorDao;
import com.lotut.pms.dao.mapper.TextEditorMapper;
import com.lotut.pms.domain.EditorTest;

public class TextEditorMybatisDao extends SqlSessionDaoSupport implements TextEditorDao {
	private TextEditorMapper textEditorMapper;
	@Override
	public void saveEditorText(EditorTest editorTest) {
		textEditorMapper.saveEditorText(editorTest);
	}
	public TextEditorMapper getTextEditorMapper() {
		return textEditorMapper;
	}
	public void setTextEditorMapper(TextEditorMapper textEditorMapper) {
		this.textEditorMapper = textEditorMapper;
	}
	@Override
	public List<Integer> findTextId() {
		return textEditorMapper.findTextId();
	}
	@Override
	public EditorTest findTextById(int editorId) {
		return textEditorMapper.findTextById(editorId);
		
	}
	
}
