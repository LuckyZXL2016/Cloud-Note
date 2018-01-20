package com.zxl.tsc.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.MasterNotRunningException;
import org.apache.hadoop.hbase.ZooKeeperConnectionException;
import org.apache.hadoop.hbase.client.ConnectionFactory;

import com.zxl.tsc.util.constants.Constants;
public class InitStart {
	@SuppressWarnings("unused")
	private void InitSystem() {
		try {
			//hbase配置=================================================================
			ClassLoader loader = InitStart.class.getClassLoader();
			InputStream ips1 = loader.getResourceAsStream("hbase.properties");
			Properties p1 = new Properties();
			p1.load(ips1);
			String hbase_zookeeper_quorum = p1.getProperty("hbase_zookeeper_quorum");//地址
			String hbase_zookeeper_property_clientPort = p1.getProperty("hbase_zookeeper_property_clientPort");//端口
			int hbase_pool_size = Integer.parseInt(p1.getProperty("hbase_pool_size"));//连接池
			Constants.HBASE_WRITE_BUFFER = Long.parseLong(p1.getProperty("hbaseWriteBuffer"));//文件检索目录
			Constants.CONFIG = HBaseConfiguration.create();// 创建配置信息类
			Constants.CONFIG.set("hbase.zookeeper.quorum",hbase_zookeeper_quorum);// zookeeper的地址
			Constants.CONFIG.set("hbase.zookeeper.property.clientPort", hbase_zookeeper_property_clientPort);// zookeeper的端口
			Constants.CONNECTION = ConnectionFactory.createConnection(Constants.CONFIG);
			//lucene配置===================================================================================================
			InputStream ips2 = loader.getResourceAsStream("lucene.properties");
			Properties p2 = new Properties();
			p2.load(ips2);
			Constants.LUCENE_DIR = p2.getProperty("lucene_dir");//文件检索目录
			Constants.FILE_DIR = p2.getProperty("file_dir");//content保存目录
			String lucene_page_count = p2.getProperty("lucene_page_count");//查询分页
			Configuration.initFSDir(Constants.LUCENE_DIR);//初始化luceneFSD
			Constants.LUCENE_PAGE_COUNT = Integer.parseInt(lucene_page_count);
			
			//redis配置=====================================================================================================
			InputStream ips3 = loader.getResourceAsStream("redis.properties");
			Properties p3 = new Properties();
			p3.load(ips3);
			String redis_ip = p3.getProperty("redis_ip");
			int redis_port = Integer.parseInt(p3.getProperty("redis_port"));
			int redis_timeout = Integer.parseInt(p3.getProperty("redis_timeout"));
			String redis_auth = p3.getProperty("redis_auth");
			Constants.REDIS_IP=redis_ip;
			Constants.REDIS_PORT=redis_port;
			Constants.REDIS_TIMOUT=redis_timeout;
			Constants.REDIS_AUTH=redis_auth;
			
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (MasterNotRunningException e) {
			e.printStackTrace();
		} catch (ZooKeeperConnectionException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
}
