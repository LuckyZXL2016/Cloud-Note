package com.zxl.tsc.note.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.zxl.tsc.note.bean.Article;
import com.zxl.tsc.note.bean.Note;
import com.zxl.tsc.note.bean.NoteBook;
import com.zxl.tsc.note.bean.SearchBean;
import com.zxl.tsc.note.dao.CreateIndexDao;
import com.zxl.tsc.note.dao.DataDao;
import com.zxl.tsc.note.dao.RedisDao;
import com.zxl.tsc.note.dao.SearchIndexDao;
import com.zxl.tsc.note.service.NoteService;
import com.zxl.tsc.util.constants.Constants;

import net.sf.json.JSONArray;

@Service
public class NoteServiceImpl implements NoteService {
	@Resource(name = "redisDaoImpl")
	private RedisDao redisDao;
	@Resource(name = "dataDaoImpl")
	private DataDao dataDao;
	@Resource(name = "searchIndexDaoImpl")
	private SearchIndexDao searchIndexDao;
	@Resource(name = "createIndexDaoIpml")
	private CreateIndexDao createIndexDao;
	private static Logger logger = LoggerFactory
			.getLogger(NoteServiceImpl.class);

	/**
	 * 获取指定用户的所有笔记本 userIdAndName:userId_loginName IOException：IO异常
	 * 
	 * @throws IOException
	 */
	public List<NoteBook> getAllNoteBook(String userIdAndName)
			throws IOException {
		List<NoteBook> notebookNames = null;
		try {
			notebookNames = redisDao.getNotebook(userIdAndName);// 从redis中获取笔记本列表
		} catch (Exception e) {// 如果在redis中出现异常，在hbase中获取
			ResultScanner queryByReg = dataDao.queryByReg(
					Constants.NOTEBOOK_TABLE_NAME, "userIdAndName" + "*");
			for (Result row : queryByReg) {// 循环结果集
				NoteBook noteBook = new NoteBook();
				String rowKey = new String(row.getRow());// rowKey
				noteBook.setRowKey(rowKey);
				String notebookName = new String(row.getValue(Bytes.toBytes(Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO), Bytes.toBytes(Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTEBOOKNAME)));
				noteBook.setName(notebookName);
				notebookNames.add(noteBook);
			}
		}
		if (notebookNames == null || notebookNames.size() <= 0) {// 如果从redis中查不到值，去hbase中查询
			ResultScanner queryByReg = dataDao.queryByReg(
					Constants.NOTEBOOK_TABLE_NAME, userIdAndName + "*");
			for (Result row : queryByReg) {// 循环结果集
				NoteBook noteBook = new NoteBook();
				String rowKey = new String(row.getRow());// rowKey
				noteBook.setRowKey(rowKey);
				String notebookName = new String(row.getValue(Bytes.toBytes(Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO), Bytes.toBytes(Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTEBOOKNAME)));
				noteBook.setName(notebookName);
				notebookNames.add(noteBook);
			}
		}
		return notebookNames;
	}

	public List<Note> getNoteListByNotebook(String rowkey) throws IOException {
		// 从hbase获取笔记列表
		return dataDao.queryNoteListByRowKey(rowkey);
	}

	public boolean addNoteBook(String noteBookName, String userName,
			String createTime, int status) {
		// 事务的成功
		boolean ifsuccess = false;
		// redis是否成功
		ifsuccess = addNoteBookToRedis(noteBookName, userName, createTime,
				status);
		// 如果redis成功，保存hbase
		if (ifsuccess) {
			try {
				// 保存hbase是否成功
				ifsuccess = addNoteBookToHbase(noteBookName, userName,
						createTime, status);
				// 如果不成功，删除redis
				if (!ifsuccess) {
					deleteNoteBookFromRedis(noteBookName, userName, createTime, status);
				}
			} catch (Exception e) {
				// 报异常，删除redis，返回false
				deleteNoteBookFromRedis(noteBookName, userName, createTime, status);
				e.printStackTrace();
				return false;
			}
		}
		return ifsuccess;
	}

	public boolean addNoteBookToRedis(String noteBookName, String userName,
			String createTime, int status) {
		StringBuffer noteBookToString = new StringBuffer();
		// wangsf@163.com_312312|java基础|123213|0
		noteBookToString
				.append(userName + Constants.ROWKEY_SEPARATOR
						+ createTime.trim()).append(Constants.STRING_SEPARATOR)
				.append(noteBookName).append(Constants.STRING_SEPARATOR)
				.append(createTime).append(Constants.STRING_SEPARATOR)
				.append(status);
		// 保存redis，用戶名為key，笔记本信息为value
		boolean flag = redisDao.saveNotebookToRedis(userName,
				noteBookToString.toString());// 将笔记本存放到redis中
		return flag;
	}

	public boolean addNoteBookToHbase(String noteBookName, String userName,
			String createTime, int status) {
		// 创建rowkey
		String rowKey = userName.trim() + Constants.ROWKEY_SEPARATOR
				+ createTime.trim();
		// 创建笔记列表
		List<String> noteList = new ArrayList<String>();
		// list转json
		String noteListToJson = JSONArray.fromObject(noteList).toString();
		// 封装二维数组，[[famliy，qualifier，value],……………………]，调用dao的公共方法
		String famQuaVals[][] = new String[4][3];
		famQuaVals[0][0] = Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO;
		famQuaVals[0][1] = Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTEBOOKNAME;
		famQuaVals[0][2] = noteBookName;
		famQuaVals[1][0] = Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO;
		famQuaVals[1][1] = Constants.NOTEBOOK_NOTEBOOKINFO_CLU_CREATETIME;
		famQuaVals[1][2] = createTime;
		famQuaVals[2][0] = Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO;
		famQuaVals[2][1] = Constants.NOTEBOOK_NOTEBOOKINFO_CLU_STATUS;
		famQuaVals[2][2] = status + "";// 状态：未设置
		famQuaVals[3][0] = Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO;
		famQuaVals[3][1] = Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST;
		famQuaVals[3][2] = noteListToJson;
		// 调用dao的公共方法
		boolean insertData = dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
				rowKey, famQuaVals);
		return insertData;
	}

	public boolean deleteNoteBook(String oldNoteBookName, String userName,
			String createTime, int status) {
		boolean ifSucess = false;
		ifSucess = deleteNoteBookFromRedis(oldNoteBookName, userName,
				createTime, status);
		if (ifSucess) {
			try {
				ifSucess = deleteNoteBookFromHbase(oldNoteBookName, userName,
						createTime, status);
				if (!ifSucess) {
					addNoteBookToRedis(oldNoteBookName, userName, createTime,
							status);
				}
			} catch (Exception e) {
				addNoteBookToRedis(oldNoteBookName, userName, createTime,
						status);
				e.printStackTrace();
				return false;
			}
		}
		return ifSucess;
	}

	public boolean deleteNoteBookFromRedis(String oldNoteBookName,
			String userName, String createTime, int status) {
		StringBuffer oldNoteBookToString = new StringBuffer();
		// 拼笔记本信息
		oldNoteBookToString
				.append(userName + Constants.ROWKEY_SEPARATOR
						+ createTime.trim()).append(Constants.STRING_SEPARATOR)
				.append(oldNoteBookName).append(Constants.STRING_SEPARATOR)
				.append(createTime).append(Constants.STRING_SEPARATOR)
				.append(status);
		// 从redis中删除list中的笔记本
		return redisDao.delNotebookToRedis(userName,
				oldNoteBookToString.toString());
	}

	public boolean deleteNoteBookFromHbase(String oldNoteBookName,
			String userName, String createTime, int status) {
		// 拼接rowkey
		String rowKey = userName.trim() + Constants.ROWKEY_SEPARATOR
				+ createTime.trim();
		// 删除笔记本
		return dataDao.deleteData(Constants.NOTEBOOK_TABLE_NAME, rowKey);
	}

	/**
	 * 重命名笔记本
	 */
	public boolean updateNoteBook(String noteBookName, String oldNoteBookName,
			String userName, String createTime, int status) {
		boolean ifSucess = false;
		ifSucess = renameNoteBookToRedis(noteBookName, oldNoteBookName,
				userName, createTime, status);
		if (ifSucess) {
			try {
				ifSucess = renameNoteBookToHbase(noteBookName, oldNoteBookName,
						userName, createTime, status);
				if (!ifSucess) {
					renameNoteBookToRedis(oldNoteBookName, noteBookName,
							userName, createTime, status);
				}
			} catch (Exception e) {
				renameNoteBookToRedis(oldNoteBookName, noteBookName, userName,
						createTime, status);
				e.printStackTrace();
				return false;
			}
		}
		return ifSucess;
	}

	public boolean renameNoteBookToRedis(String noteBookName,
			String oldNoteBookName, String userName, String createTime,
			int status) {
		StringBuffer noteBookToString = new StringBuffer();
		// 需要新增的信息
		noteBookToString
				.append(userName + Constants.ROWKEY_SEPARATOR
						+ createTime.trim()).append(Constants.STRING_SEPARATOR)
				.append(noteBookName).append(Constants.STRING_SEPARATOR)
				.append(createTime).append(Constants.STRING_SEPARATOR)
				.append(status);
		// 需要删除的信息
		StringBuffer oldNoteBookToString = new StringBuffer();
		oldNoteBookToString
				.append(userName + Constants.ROWKEY_SEPARATOR
						+ createTime.trim()).append(Constants.STRING_SEPARATOR)
				.append(oldNoteBookName).append(Constants.STRING_SEPARATOR)
				.append(createTime).append(Constants.STRING_SEPARATOR)
				.append(status);
		// 先删后加
		return redisDao.updateNotebookToRedis(userName,
				oldNoteBookToString.toString(), noteBookToString.toString());
	}

	public boolean renameNoteBookToHbase(String newNoteBookName,
			String oldNoteBookName, String userName, String createTime,
			int status) {
		// pingrowkey
		String rowKey = userName.trim() + Constants.ROWKEY_SEPARATOR
				+ createTime.trim();
		return dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME, rowKey,
				Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
				Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTEBOOKNAME,
				newNoteBookName);
	}

	public boolean addNote(String noteRowKey, String noteName,
			String createTime, String status, String noteBookRowkey) {
		boolean ifSucess = false;
		// 查询旧的笔记列表
		List<String> noteList = dataDao.queryByRowKeyString(
				Constants.NOTEBOOK_TABLE_NAME, noteBookRowkey);
		ifSucess = addNoteToNoteList(noteRowKey, noteName, createTime, status,
				noteBookRowkey, noteList);
		if (ifSucess) {
			try {
				ifSucess = addNoteToOrderTable(noteRowKey, noteName,
						createTime, status, noteBookRowkey);
				if (!ifSucess) {
					dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
							noteBookRowkey,
							Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
							Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST,
							JSONArray.fromObject(noteList).toString());
				}
			} catch (Exception e) {
				dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
						noteBookRowkey, Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
						Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST, JSONArray
								.fromObject(noteList).toString());
				e.printStackTrace();
				return false;
			}
		}
		return ifSucess;
	}

	public boolean addNoteToNoteList(String noteRowKey, String noteName,
			String createTime, String status, String noteBookRowkey,
			List<String> noteList) {
		if (noteList==null) {
			noteList = new ArrayList<String>();
		}
		// 拼装新的笔记信息
		StringBuffer noteBookToString = new StringBuffer();
		noteBookToString.append(noteRowKey).append(Constants.STRING_SEPARATOR)
				.append(noteName).append(Constants.STRING_SEPARATOR)
				.append(createTime).append(Constants.STRING_SEPARATOR)
				.append(status);
		// 添加到笔记列表
		noteList.add(noteBookToString.toString());
		JSONArray jsonarray = JSONArray.fromObject(noteList);// list转json
		String noteListToJson = jsonarray.toString();// list转json
		// 修改笔记本中的笔记list信息
		return dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
				noteBookRowkey, Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
				Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST, noteListToJson);
	}

	public boolean addNoteToOrderTable(String noteRowKey, String noteName,
			String createTime, String status, String noteBookRowkey) {
		// 封装笔记信息
		String noteFamQuaVals[][] = new String[4][3];
		noteFamQuaVals[0][0] = Constants.NOTE_FAMLIY_NOTEINFO;
		noteFamQuaVals[0][1] = Constants.NOTE_NOTEINFO_CLU_NOTENAME;
		noteFamQuaVals[0][2] = noteName;
		noteFamQuaVals[1][0] = Constants.NOTE_FAMLIY_NOTEINFO;
		noteFamQuaVals[1][1] = Constants.NOTE_NOTEINFO_CLU_STATUS;
		noteFamQuaVals[1][2] = status;
		noteFamQuaVals[2][0] = Constants.NOTE_FAMLIY_NOTEINFO;
		noteFamQuaVals[2][1] = Constants.NOTE_NOTEINFO_CLU_CREATETIME;
		noteFamQuaVals[2][2] = createTime;
		noteFamQuaVals[3][0] = Constants.NOTE_FAMLIY_CONTENTINFO;
		noteFamQuaVals[3][1] = Constants.NOTE_CONTENTINFO_CLU_CONTENT;
		noteFamQuaVals[3][2] = "";
		return dataDao.insertData(Constants.NOTE_TABLE_NAME, noteRowKey,
				noteFamQuaVals);
	}

	public boolean deleteNote(String noteRowKey, String createTime,
			String status, String oldNoteName, String noteBookRowkey) {
		boolean ifSuccess = false;
		// 查询旧笔记信息
		List<String> noteList = dataDao.queryByRowKeyString(
				Constants.NOTEBOOK_TABLE_NAME, noteBookRowkey);
		ifSuccess = deleteNoteFromNoteBookTable(noteRowKey, createTime, status,
				oldNoteName, noteBookRowkey, noteList);
		if (ifSuccess) {
			try {
				ifSuccess = deleteNoteFromNoteTable(noteRowKey);
				if (!ifSuccess) {
					dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
							noteBookRowkey,
							Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
							Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST,
							JSONArray.fromObject(noteList).toString());
				}
			} catch (Exception e) {
				dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
						noteBookRowkey, Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
						Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST, JSONArray
								.fromObject(noteList).toString());
				e.printStackTrace();
				return false;
			}
		}
		return ifSuccess;
	}

	public boolean deleteNoteFromNoteBookTable(String noteRowKey,
			String createTime, String status, String oldNoteName,
			String noteBookRowkey, List<String> noteList) {
		// 修改对应笔记本信息
		StringBuffer oldNoteBookToString = new StringBuffer();
		oldNoteBookToString.append(noteRowKey)
				.append(Constants.STRING_SEPARATOR).append(oldNoteName)
				.append(Constants.STRING_SEPARATOR).append(createTime)
				.append(Constants.STRING_SEPARATOR).append(status);
		noteList.remove(oldNoteBookToString.toString());
		String noteListToJson = JSONArray.fromObject(noteList).toString();// list转json

		return dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
				noteBookRowkey, Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
				Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST, noteListToJson);
	}

	public boolean deleteNoteFromNoteTable(String noteRowKey) {
		// 删除笔记信息
		return dataDao.deleteData(Constants.NOTE_TABLE_NAME, noteRowKey);
	}

	public boolean updateNote(String noteRowKey, String noteName,
			String createTime, String content, String status,
			String oldNoteName, String noteBookRowkey) {

		// 获取旧的笔记列表
		List<String> noteList = dataDao.queryByRowKeyString(
				Constants.NOTEBOOK_TABLE_NAME, noteBookRowkey);
		boolean ifSuccess = false;
		ifSuccess = updateNoteListFromNoteBookTanle(noteRowKey, noteName,
				createTime, content, status, oldNoteName, noteBookRowkey,
				noteList);
		if (ifSuccess) {
			try {
				ifSuccess = updateNoteFromNoteTable(noteRowKey, noteName,
						createTime, content, status, oldNoteName,
						noteBookRowkey);
				if (!ifSuccess) {
					dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
							noteBookRowkey,
							Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
							Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST,
							JSONArray.fromObject(noteList).toString());
				}
			} catch (Exception e) {
				dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
						noteBookRowkey, Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
						Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST, JSONArray
								.fromObject(noteList).toString());
				e.printStackTrace();
				return false;
			}
		}

		return ifSuccess;
	}

	public boolean updateNoteListFromNoteBookTanle(String noteRowKey,
			String noteName, String createTime, String content, String status,
			String oldNoteName, String noteBookRowkey, List<String> noteList) {
		StringBuffer noteBookToString = new StringBuffer();
		noteBookToString.append(noteRowKey).append(Constants.STRING_SEPARATOR)
				.append(noteName).append(Constants.STRING_SEPARATOR)
				.append(createTime).append(Constants.STRING_SEPARATOR)
				.append(status);
		StringBuffer oldNoteBookToString = new StringBuffer();
		oldNoteBookToString.append(noteRowKey)
				.append(Constants.STRING_SEPARATOR).append(oldNoteName)
				.append(Constants.STRING_SEPARATOR).append(createTime)
				.append(Constants.STRING_SEPARATOR).append(status);
		noteList.remove(oldNoteBookToString.toString());
		noteList.add(noteBookToString.toString());
		JSONArray jsonarray = JSONArray.fromObject(noteList);// list转json
		String noteListToJson = jsonarray.toString();// list转json
		return dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
				noteBookRowkey, Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
				Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST, noteListToJson);
	}

	public boolean updateNoteFromNoteTable(String noteRowKey, String noteName,
			String createTime, String content, String status,
			String oldNoteName, String noteBookRowkey) {
		// 笔记信息存hbase
		String noteFamQuaVals[][] = new String[4][3];
		noteFamQuaVals[0][0] = Constants.NOTE_FAMLIY_NOTEINFO;
		noteFamQuaVals[0][1] = Constants.NOTE_NOTEINFO_CLU_NOTENAME;
		noteFamQuaVals[0][2] = noteName;
		noteFamQuaVals[1][0] = Constants.NOTE_FAMLIY_NOTEINFO;
		noteFamQuaVals[1][1] = Constants.NOTE_NOTEINFO_CLU_STATUS;
		noteFamQuaVals[1][2] = status;
		noteFamQuaVals[2][0] = Constants.NOTE_FAMLIY_NOTEINFO;
		noteFamQuaVals[2][1] = Constants.NOTE_NOTEINFO_CLU_CREATETIME;
		noteFamQuaVals[2][2] = createTime;
		noteFamQuaVals[3][0] = Constants.NOTE_FAMLIY_CONTENTINFO;
		noteFamQuaVals[3][1] = Constants.NOTE_CONTENTINFO_CLU_CONTENT;
		noteFamQuaVals[3][2] = content;
		return dataDao.insertData(Constants.NOTE_TABLE_NAME, noteRowKey,
				noteFamQuaVals);
	}

	public boolean moveAndDeleteNote(String noteRowKey,
			String oldNoteBookRowkey, String newNoteBookRowkey, String noteName) {
		// 查询旧笔记本下的笔记信息
		List<String> oldNoteBookNoteList = dataDao.queryByRowKeyString(
				Constants.NOTEBOOK_TABLE_NAME, oldNoteBookRowkey);
		// 查询新笔记本下的笔记信息
		List<String> newNoteBookNoteList = dataDao.queryByRowKeyString(
				Constants.NOTEBOOK_TABLE_NAME, newNoteBookRowkey);
		// 创建时间
		String createTime = noteRowKey.split(Constants.ROWKEY_SEPARATOR)[1];
		boolean ifSuccess = false;
		// 删除旧笔记本下的笔记
		ifSuccess = deleteNoteFromNoteBookTable(noteRowKey, createTime, "0",
				noteName, oldNoteBookRowkey, oldNoteBookNoteList);
		if (ifSuccess) {
			try {
				// 添加新笔记本下的笔记
				ifSuccess = addNoteToNoteList(noteRowKey, noteName, createTime,
						"0", newNoteBookRowkey, newNoteBookNoteList);
				if (!ifSuccess) {
					dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
							oldNoteBookRowkey, Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
							Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST, JSONArray
									.fromObject(oldNoteBookNoteList).toString());
				}
			} catch (Exception e) {
				dataDao.insertData(Constants.NOTEBOOK_TABLE_NAME,
						oldNoteBookRowkey, Constants.NOTEBOOK_FAMLIY_NOTEBOOKINFO,
						Constants.NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST, JSONArray
								.fromObject(oldNoteBookNoteList).toString());
				e.printStackTrace();
				return false;
			}
		}
		return ifSuccess;
	}

	/**
	 * 获取笔记
	 */
	public Note getNoteByRowKey(String noteRowkey) {
		Note note = dataDao.queryNoteByRowKey(noteRowkey);
		return note;
	}

	/**
	 * 分享笔记 rowKey：rowKey
	 * 
	 * @throws IOException
	 * @throws CorruptIndexException
	 */
	public boolean shareNote(String rowKey) throws CorruptIndexException,
			IOException {
		Result queryByRowKey = dataDao.queryByRowKey(Constants.NOTE_TABLE_NAME,
				rowKey);// 查询笔记
		// 封装参数
		String noteName = new String(queryByRowKey.getValue(
				Bytes.toBytes(Constants.NOTE_FAMLIY_NOTEINFO),
				Bytes.toBytes(Constants.NOTE_NOTEINFO_CLU_NOTENAME)));
		String content = new String(queryByRowKey.getValue(
				Bytes.toBytes(Constants.NOTE_FAMLIY_CONTENTINFO),
				Bytes.toBytes(Constants.NOTE_CONTENTINFO_CLU_CONTENT)));
		String time = new String(queryByRowKey.getValue(
				Bytes.toBytes(Constants.NOTE_FAMLIY_NOTEINFO),
				Bytes.toBytes(Constants.NOTE_NOTEINFO_CLU_CREATETIME)));
		Article article = new Article();
		article.setId(rowKey);
		article.setTitle(noteName);
		article.setTime(time);
		article.setContent(content);
		boolean saveNoteToLucene = createIndexDao.saveNoteToLucene(article);// 创建索引
		return saveNoteToLucene;
	}

	/**
	 * 根据关键字获取技术问答列表 key：关键字 page：页码
	 */
	public List<Article> search(String key, int page)
			throws InterruptedException, ParseException, IOException,
			InvalidTokenOffsetsException {
		SearchBean searchBean = new SearchBean();// 封装参数
		searchBean.setKey(key);
		searchBean.setPage(page);
		List<Article> articles = searchIndexDao.searchIndex(searchBean);// 查询文章
		return articles;
	}

	/**
	 * 收藏笔记
	 */
	public boolean starOtherNote(String noteRowKey, String starBtRowKey) {
		Note note = getNoteByRowKey(noteRowKey);// 获取笔记信息
		boolean addNote = addNote(noteRowKey, note.getName(),
				note.getCreateTime(), note.getStatus(), starBtRowKey);
		return addNote;
	}
	/**
	 * 活动笔记
	 */
	public boolean activeMyNote(String noteRowKey, String activityBtRowKey) {
		Note note = getNoteByRowKey(noteRowKey);// 获取笔记信息
		boolean addNote = addNote(noteRowKey, note.getName(),
				note.getCreateTime(), note.getStatus(), activityBtRowKey);
		return addNote;
	}
}
