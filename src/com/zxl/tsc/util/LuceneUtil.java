package com.zxl.tsc.util;

import java.io.IOException;

import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.util.Version;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class LuceneUtil {
	private static Logger logger = LoggerFactory.getLogger(LuceneUtil.class);
	private static IndexWriter indexWriter=null;
	private static IndexSearcher indexSearcher;
	private LuceneUtil(){
		
	}
	public static void initSearch() {
		try {
			logger.debug("indexSearcher init start!");
			indexSearcher = new IndexSearcher(IndexReader.open(Configuration.getDirectory()));
			Runtime.getRuntime().addShutdownHook(new Thread() {
				public void run() {
					closeIndexSearcher();
				}
			});
		} catch (Exception e) {
			logger.error("indexSearcher init error!",e);
		}
	}
	public static IndexWriter getIndexWriter() {
		try {
			synchronized (LuceneUtil.class) {
				if(indexWriter==null){
					logger.debug("indexWriter init start!");
					indexWriter = new IndexWriter(Configuration.getDirectory(),new IndexWriterConfig(Version.LUCENE_35, Configuration.getAnalyzer()));
				}
			}
		} catch (Exception e) {
			logger.error("indexWriter init error!",e);
		}
		return indexWriter;
	}
	/*** 获取IndexSearcher实例 */
	public static IndexSearcher getIndexSearcher() {
		if (indexSearcher == null) {
			try {
				logger.debug("create indexSearcher start!");
				indexSearcher = new IndexSearcher(IndexReader.open(Configuration.getDirectory()));
			} catch (Exception e) {
				logger.error("create indexSearcher error!",e);
			}
		}
		return indexSearcher;
	}


	/** 关闭IndexSearcher */
	public static void closeIndexWriter() {
		if (indexWriter != null) {
			try {
				logger.debug("closeindexWriter start!");
				indexWriter.close();
			} catch (Exception e) {
				logger.error("closeindexWriter error!",e);
			}
		}
	}
	/** 关闭IndexSearcher */
	public static void closeIndexWriter(IndexWriter indexWriter) {
		if (indexWriter != null) {
			try {
				logger.debug("closeindexWriter start!");
				indexWriter.close();
			} catch (Exception e) {
				logger.error("closeindexWriter error!",e);
			}
		}
	}
	/** 关闭IndexSearcher */
	public static void closeIndexSearcher() {
		if (indexSearcher != null) {
			try {
				logger.debug("closeIndexSearcher start!");
				indexSearcher.close();
			} catch (Exception e) {
				logger.error("closeIndexSearcher error!",e);
			}
		}
	}
	/** 关闭IndexSearcher */
	public static void closeIndexSearcher(IndexSearcher indexSearcher) {
		if (indexSearcher != null) {
			try {
				logger.debug("closeIndexSearcher start!");
				indexSearcher.close();
			} catch (Exception e) {
				logger.error("closeIndexSearcher error!",e);
			}
		}
	}
	/** 通知索引索引库更改了 */
	public static void indexChanged() {
		if (indexSearcher != null) {
			try {
				logger.debug("indexChanged start!");
				indexSearcher.close();
				indexSearcher = null;
			} catch (IOException e) {
				logger.error("indexChanged error!",e);
			}
		}
	}

	

}
