package com.zxl.tsc.note.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.zxl.tsc.note.bean.Note;
import com.zxl.tsc.note.bean.NoteBook;
import com.zxl.tsc.note.dao.RedisDao;
import com.zxl.tsc.util.JsonUtil;
import com.zxl.tsc.util.RedisTools;
import com.zxl.tsc.util.constants.Constants;
@Service("redisDaoImpl")
public class RedisDaoImpl implements RedisDao {

	/**
	 * 获取笔记本
	 * key：key
	 * @throws DataCenterException 
	 */
	public List<NoteBook> getNotebook(String key)  {
		if (key==null) {
			return null;
		}
		List<String> list =RedisTools.getList(key);
		if (list==null) {
			return null;
		}
		List<NoteBook> noteBooks = new ArrayList<NoteBook>();
		for (String string : list) {
			String[] split = string.split("\\"+Constants.STRING_SEPARATOR);  // |属特殊字符，需转义
			NoteBook noteBook = new NoteBook();
			noteBook.setRowKey(split[0]);
			noteBook.setName(split[1]);
			noteBook.setCreateTime(split[2]);
			noteBook.setStatus(split[3]);
			noteBooks.add(noteBook);
		}
		return noteBooks;
	}
	/**
	 * 获取笔记 
	 * key：key
	 * @throws DataCenterException 
	 */
	public List<Note> getNote(String key)  {
		//list<rowkey|name|ct|status,...>
		if (key==null) {
			return null;
		}
		List<String> list = RedisTools.getList(key);
		List<Note> notes = new ArrayList<Note>();
		if (list!=null) {
			for (String string : list) {
				Note note = JsonUtil.changeStringToNote(string);
				notes.add(note);
			}
		}else{
			return null;
		}
		return notes;
	}
	/**
	 * 保存笔记本到redis 
	 * key：userId_loginName 
	 * value:noteBookName 
	 * boolean:成功与否
	 */
	public boolean saveNotebookToRedis(String key, String value) {
		Long returnSize = RedisTools.appendRightList(key, value);
		if (returnSize == 0) {
			return false;
		}
		return true;
	}

	/**
	 * 保存笔记本到redis 
	 * key：userId_loginName 
	 * values:noteBookNameList 
	 * boolean:成功与否
	 * @throws DataCenterException 
	 */
	public boolean saveNotebookListToRedis(String key, List<String> values)  {
		Long addLList = RedisTools.setLList(key, values);
		if (addLList==0) {
			return false;
		}
		return true;
	}

	/**
	 * 保存笔记到redis 
	 * key：userId_loginName_notebookname 
	 * value:note 
	 * boolean:成功与否
	 */
	public boolean saveNoteToRedis(String key, String value) {
		RedisTools.deleteValueOfList(key, 5,value);
		Long returnSize = RedisTools.appendLeftList(key, value);
		if (returnSize == 0) {
			return false;
		}
		return true;
	}


	/**
	 * 删除笔记本 
	 * key：userId_loginName 
	 * value:noteBookName 
	 * boolean:成功与否
	 */
	public boolean delNotebookToRedis(String key, String value) {
		Long lrem = RedisTools.deleteValueOfList(key, 1,value);
		if (lrem==0) {
			return false;
		}
		return true;
	}

	/**
	 * 删除笔记 
	 * key：userId_loginName_notebookname 
	 * value:note 
	 * boolean:成功与否
	 */
	public boolean delNoteToRedis(String key, String value) {
		Long lrem = RedisTools.deleteValueOfList(key, 5, value);
		if (lrem==0) {
			return false;
		}
		return true;
	}

	/**
	 * 更新笔记本 
	 * key：userId_loginName 
	 * oldValue：oldNoteBookName
	 * newValue：newNoteBookName 
	 * boolean:成功与否
	 */
	public boolean updateNotebookToRedis(String key, String oldValue,
			String newValue) {
		RedisTools.deleteValueOfList(key, 1, oldValue.trim());
		Long addRList = RedisTools.appendRightList(key, newValue);
		if (addRList==0) {
			return false;
		}
		return true;
	}

	/**
	 * 更新笔记 
	 * key：userId_loginName_notebookname 
	 * oldValue：oldNote 
	 * newValue：newNote
	 * boolean:成功与否
	 */
	public boolean updateNoteToRedis(String key, String newValue, String oldValue) {
		Long deleteListValue = RedisTools.deleteValueOfList(key, 5, oldValue.trim());
		Long addRList = RedisTools.appendRightList(key, newValue.trim());
		if (addRList==0) {
			return false;
		}
		return true;
	}
}
