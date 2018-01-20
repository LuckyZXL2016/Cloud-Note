package com.zxl.tsc.note.dao;

import java.io.IOException;
import java.util.List;

import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;

import com.zxl.tsc.note.bean.Article;
import com.zxl.tsc.note.bean.SearchBean;

public interface SearchIndexDao {
	public List<Article> searchIndex(SearchBean searchBean) throws ParseException, IOException, InvalidTokenOffsetsException;
}
