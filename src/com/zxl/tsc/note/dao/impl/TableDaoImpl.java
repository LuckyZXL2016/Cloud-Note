package com.zxl.tsc.note.dao.impl;

import java.io.IOException;

import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.zxl.tsc.note.dao.TableDao;
import com.zxl.tsc.util.constants.Constants;
@Service("tableDaoImpl")
public class TableDaoImpl implements TableDao{

	private static Logger logger = LoggerFactory.getLogger(TableDaoImpl.class);
	/**
	 * 创建hbase的表
	 * tableName：表名
	 * familys：列族数组
	 * IOException：IO异常
	 */
	public void creatTable(String tableName,String[] familys) throws IOException{
		if (Constants.ADMIN.tableExists(tableName)) {//验证所要创建的表是否存在
			logger.debug("表存在，名字为："+tableName);
		}else{
			HTableDescriptor table = new HTableDescriptor(tableName);//通过表名创建表
			for (int i = 0; i < familys.length; i++) {
				HColumnDescriptor family = new HColumnDescriptor(familys[i]);//创建列族
				table.addFamily(family);//向表中添加列族
			}
			Constants.ADMIN.createTable(table);//添加表
			logger.debug("创建表"+tableName+"成功");
		}
	}
	/**
	 * 创建hbase的表
	 * tableName：表名
	 * familys：列族数组
	 * IOException：IO异常
	 */
	public void createTableSplit(String tableName, String[] familys) throws IOException {
			if (Constants.ADMIN.tableExists(tableName)) {
				logger.debug("表存在，名字为："+tableName);
			} else {
				HTableDescriptor desc = new HTableDescriptor(tableName);
				for (int i = 0; i < familys.length; i++) {
					HColumnDescriptor family = new HColumnDescriptor(familys[i]);
					desc.addFamily(family);
				}
				Constants.ADMIN.createTable(desc, "a0".getBytes(), "a10000".getBytes(), 3);//切分表
				logger.debug("创建表"+tableName+"成功");
			}
	}
	/**
	 * 创建hbase的表
	 * tableName：表名
	 * familys：列族数组
	 * IOException：IO异常
	 */
	public void createTableSplit2(String tableName, String[] familys) throws IOException {
			if (Constants.ADMIN.tableExists(tableName)) {
				logger.debug("表存在，名字为："+tableName);
			} else {
				HTableDescriptor desc = new HTableDescriptor(tableName);
				for (int i = 0; i < familys.length; i++) {
					HColumnDescriptor family = new HColumnDescriptor(familys[i]);
					desc.addFamily(family);
				}
				byte[][] regions = new byte[][] { Bytes.toBytes("a3333333"),Bytes.toBytes("a6666666") };//切分表
				// 表示有三个region分别放入key：
				// [1] start key: , end key: A
				// [2] start key: A, end key: D
				// [3] start key: D, end key:
				Constants.ADMIN.createTable(desc, regions);
				logger.debug("创建表"+tableName+"成功");
			}
	}
	/**
	 * 删除表
	 * tableName:表名
	 * IOException:IO异常
	 */
	public void deleteTable(String tableName) throws IOException{
		if (!Constants.ADMIN.tableExists(tableName)) {//验证所要创建的表是否存在
			logger.debug("表不存在,表名："+tableName);
		} else {
			Constants.ADMIN.disableTable(tableName);//删除表之前，先要将表disable
			Constants.ADMIN.deleteTable(tableName);//删除表
			logger.debug("删除表"+tableName+"成功");
		}
	}
	/**
	 * 获取表
	 * tableName：表名
	 * HTableInterface：table操作类
	 * @throws IOException 
	 */
	public Table getTable(String tableName) throws IOException{
		return  Constants.CONNECTION.getTable(TableName.valueOf(tableName));//从连接池中获取表
	}
	public static void main(String[] args) throws IOException {
		TableDaoImpl tm = new TableDaoImpl();
		String[] familys ={"aaa1","aaa2","aaa3"};
		tm.creatTable("wangsf_aaa", familys);
		Table table = tm.getTable("wangsf_aaa");
		System.out.println(table.getTableDescriptor());
	}

}
