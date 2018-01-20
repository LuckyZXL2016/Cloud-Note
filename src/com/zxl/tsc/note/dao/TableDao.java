package com.zxl.tsc.note.dao;

import java.io.IOException;

import org.apache.hadoop.hbase.client.Table;

public interface TableDao {

	public void creatTable(String tableName,String[] familys) throws IOException;
	public void createTableSplit(String tableName, String[] familys) throws IOException;
	public void createTableSplit2(String tableName, String[] familys) throws IOException;
	public void deleteTable(String tableName) throws IOException;
	public Table getTable(String tableName) throws IOException;

}
