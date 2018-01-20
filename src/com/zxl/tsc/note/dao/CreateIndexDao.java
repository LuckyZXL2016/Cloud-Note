package com.zxl.tsc.note.dao;

import java.io.IOException;

import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.store.LockObtainFailedException;

import com.zxl.tsc.note.bean.Article;

public interface CreateIndexDao {
	public boolean saveNoteToLucene(Article article) throws CorruptIndexException, IOException;
	public void forceDelete() throws CorruptIndexException,
	LockObtainFailedException, IOException;
	public void delete(String id) throws CorruptIndexException, LockObtainFailedException, IOException ;
}
