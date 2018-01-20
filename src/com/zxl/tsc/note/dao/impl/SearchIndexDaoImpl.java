package com.zxl.tsc.note.dao.impl;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.SimpleSpanFragmenter;
import org.apache.lucene.util.Version;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.chenlb.mmseg4j.analysis.MMSegAnalyzer;
import com.zxl.tsc.note.bean.Article;
import com.zxl.tsc.note.bean.SearchBean;
import com.zxl.tsc.note.dao.SearchIndexDao;
import com.zxl.tsc.util.ArticleDocumentUtil;
import com.zxl.tsc.util.LuceneUtil;
import com.zxl.tsc.util.constants.Constants;

@Service("searchIndexDaoImpl")
public class SearchIndexDaoImpl implements SearchIndexDao {
	private static Logger logger = LoggerFactory
			.getLogger(SearchIndexDaoImpl.class);

	/**
	 * 分词高亮查询
	 * 
	 * @throws InvalidTokenOffsetsException
	 * @throws IOException
	 * @throws ParseException
	 */
	public List<Article> searchIndex(SearchBean searchBean)
			throws ParseException, IOException, InvalidTokenOffsetsException {
		List<Article> search = null;
		search = searcherByHighlighter(searchBean.getKey(),
				(searchBean.getPage() - 1) * Constants.LUCENE_PAGE_COUNT,
				Constants.LUCENE_PAGE_COUNT);
		return search;
	}

	/**
	 * 高亮查询
	 * 
	 * @param queryString
	 * @param firstResult
	 * @param maxResult
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 * @throws InvalidTokenOffsetsException
	 */
	private static List<Article> searcherByHighlighter(String queryString,
			int firstResult, int maxResult) throws ParseException, IOException,
			InvalidTokenOffsetsException {
		List<Article> list = null;
		IndexSearcher searcher = null;
		logger.debug("searcherByHighlighter start!");
		Analyzer a = new MMSegAnalyzer();// 创建分词
		searcher = LuceneUtil.getIndexSearcher();// 创建查询
		MultiFieldQueryParser parser = new MultiFieldQueryParser(
				Version.LUCENE_35, new String[] { "title", "content" }, a);// 在title与content中查询
		Query query = parser.parse(queryString);// 封装查询字段
		TopDocs tds = searcher.search(query, firstResult + maxResult);// 查询出前n条数据的中间值
		ScoreDoc[] scoreDocs = tds.scoreDocs;// 通过中间值获取文档集
		list = new ArrayList<Article>();// 用于封装article
		int endIndex = Math.min(firstResult + maxResult, scoreDocs.length);// 结果集尾�?
		for (int i = firstResult; i < endIndex; i++) { // 查询更多
			Document doc = searcher.doc(scoreDocs[i].doc);// 根据编号取出Document数据
			String highTitle = lighterStr(a, query, doc.get("title"), "title");// 设置高亮
			String highContent = lighterStr(a, query, doc.get("content"),
					"content");// 设置高亮
			String highTc100 = lighterStr(a, query, doc.get("tc100"), "tc100");// 设置高亮
			if (highContent != null) {
				((Field) doc.getFieldable("content")).setValue(highContent);// 将高亮数据放回document
			}
			if (highTitle != null) {
				((Field) doc.getFieldable("title")).setValue(highTitle);
			}
			if (highTc100 != null) {
				((Field) doc.getFieldable("tc100")).setValue(highTc100);
			}
			Article article = ArticleDocumentUtil.documentToArticle(doc);// document转换为article
			list.add(article);// 封装list
		}
		LuceneUtil.closeIndexSearcher(searcher);
		return list;
	}

	/**
	 * 设置高亮
	 * 
	 * @param a
	 * @param query
	 * @param txt
	 * @param fieldname
	 * @return
	 * @throws IOException
	 * @throws InvalidTokenOffsetsException
	 */
	private static String lighterStr(Analyzer a, Query query, String txt,
			String fieldname) throws IOException, InvalidTokenOffsetsException {
		String str = null;
		logger.debug("lighterStr start!");
		Formatter fmt = new SimpleHTMLFormatter("<b>", "</b>");// 配置前缀与后缀默认<b></b>
		QueryScorer scorer = new QueryScorer(query);
		Highlighter lighter = new Highlighter(fmt, scorer);
		Fragmenter fragmenter = new SimpleSpanFragmenter(scorer, 100);// 指定摘要大小，默认是100字符,返回
		lighter.setTextFragmenter(fragmenter);
		str = lighter.getBestFragments(
				a.tokenStream(fieldname, new StringReader(txt)), txt, 3,
				"......\n");// 使用高亮操作，一次高亮一段文本（字段值），如果当前高亮的字段中没有出现关键字，则返回null
		if (str == null || "".equals(str))
			return txt;
		return str;
	}

}
