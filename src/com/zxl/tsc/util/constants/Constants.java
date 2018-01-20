package com.zxl.tsc.util.constants;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTablePool;

/***
 * 程序中使用的静态字段定义在此处
 */
public class Constants {
	/**hbase配置*/
	public static  Configuration CONFIG;//配置信息类
	public static  HBaseAdmin ADMIN ;//表管理类
	public static Connection CONNECTION ;
	public static long HBASE_WRITE_BUFFER;  //批量写的buffer大小
	/**笔记本信息**/
	public static final String NOTEBOOK_TABLE_NAME="nb";//表名
	public static final String NOTEBOOK_FAMLIY_NOTEBOOKINFO="nbi";//列族1，笔记本信息
	public static final String NOTEBOOK_NOTEBOOKINFO_CLU_NOTEBOOKNAME="nbn";//列1，笔记本名字
	public static final String NOTEBOOK_NOTEBOOKINFO_CLU_CREATETIME="ct";//列2：创建笔记本时间
	public static final String NOTEBOOK_NOTEBOOKINFO_CLU_STATUS="st";//列3：笔记本状态
	public static final String NOTEBOOK_NOTEBOOKINFO_CLU_NOTELIST="nl";//列4：笔记本下笔记信息列表
	/**笔记信息**/
	public static final String NOTE_TABLE_NAME="n";//表名
	public static final String NOTE_FAMLIY_NOTEINFO="ni";//列族1：笔记信息
	public static final String NOTE_NOTEINFO_CLU_NOTENAME="nn";//列1：笔记名字
	public static final String NOTE_NOTEINFO_CLU_CREATETIME="ct";//列2：创建时间
	public static final String NOTE_NOTEINFO_CLU_STATUS="st";//列3：笔记状态
	public static final String NOTE_FAMLIY_CONTENTINFO="ci";//列族2：笔记内容
	public static final String NOTE_CONTENTINFO_CLU_CONTENT="c";//列1：笔记内容
	
	/**笔记rowKey前缀**/
	public static final String NOTE_PREFIX = "note"+Constants.ROWKEY_SEPARATOR;
	
	/**lucene配置，此次没有使用lucene*/
	public static String LUCENE_DIR;//lucene库文件夹
	public static String FILE_DIR;//content文件夹
	public static  int LUCENE_PAGE_COUNT;//lucene分页，每页大小
	
	/**redis配置*/
	public static  String REDIS_IP ;
	public static  int REDIS_PORT ;
	public static  int REDIS_TIMOUT ;
	public static  String REDIS_AUTH ;
	
	/**user信息**/
	public static final String USER_INFO="userinfo" ;
	
	/**特殊笔记列表*/
	public static final String RECYCLE= Constants.ROWKEY_SEPARATOR+"0000000000000" ;//回收站
	public static final String STAR=    Constants.ROWKEY_SEPARATOR+"0000000000001" ;//收藏
	public static final String ACTIVITY=Constants.ROWKEY_SEPARATOR+"0000000000002" ;//活动
	/**分隔符*/
	public static final String STRING_SEPARATOR = "|" ;
	public static final String ROWKEY_SEPARATOR = "_" ;//rowkey的分隔符
	
}
