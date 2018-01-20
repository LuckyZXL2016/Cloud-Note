package com.zxl.tsc.note.dao.impl;

import java.io.IOException;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.store.LockObtainFailedException;
import org.apache.lucene.util.Version;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.zxl.tsc.note.bean.Article;
import com.zxl.tsc.note.dao.CreateIndexDao;
import com.zxl.tsc.util.Configuration;
import com.zxl.tsc.util.LuceneUtil;

@Service("createIndexDaoIpml")
public class CreateIndexDaoIpml implements CreateIndexDao {
	private static Logger logger = LoggerFactory.getLogger(CreateIndexDaoIpml.class);

	/**
	 * 把article存到lucene库
	 * 
	 * @throws IOException
	 * @throws CorruptIndexException
	 */
	public boolean saveNoteToLucene(Article article) throws CorruptIndexException,
			IOException {
		try {
			Document doc = null;
			doc = new Document();
			doc.add(new Field("id", article.getId(), Store.YES, Index.NOT_ANALYZED));//rowkey存储不分词
			doc.add(new Field("time", article.getTime(), Store.YES, Index.NOT_ANALYZED));//time存储不分词
			String title = article.getTitle();
			String content = article.getContent();
			doc.add(new Field("title", title, Store.YES, Index.ANALYZED));//笔记名字，存储分词
			doc.add(new Field("content", content, Store.NO, Index.ANALYZED));//笔记内容，不存储分词
			IndexWriter indexWriter = LuceneUtil.getIndexWriter();
			indexWriter.addDocument(doc);
			indexWriter.commit();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	/**
	 * 强制删除
	 */
	public void forceDelete() throws CorruptIndexException,
			LockObtainFailedException, IOException {
		IndexWriter writer = null;
		writer = new IndexWriter(Configuration.getDirectory(),
				new IndexWriterConfig(Version.LUCENE_35,
						Configuration.getAnalyzer()));
		writer.forceMergeDeletes();
		if (writer != null)
			writer.close();
	}
	/**
	 * 删除索引
	 * id：索引的id，即rowKey
	 */
	public void delete(String id) throws CorruptIndexException, LockObtainFailedException, IOException {
		IndexWriter writer = null;

		writer = new IndexWriter(Configuration.getDirectory(),
				new IndexWriterConfig(Version.LUCENE_35,
						Configuration.getAnalyzer()));
		// 参数是一个选项，可以是一个Query，也可以是一个term，term是一个精确查找的值
		// 此时删除的文档并不会被完全删除，而是存储在一个回收站中的，可以恢复
		writer.deleteDocuments(new Term("id", id));
		writer.commit();
		if (writer != null)
			writer.close();
	}
}
