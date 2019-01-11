package org.news.basedao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.junit.Test;

public class BaseDao {
	private static String driver;
	private static String url;
	private static String user;
	private static String password;
	private static Connection conn;
	private static PreparedStatement ps;
	private static ResultSet rs;
//	/**
//	 * JNDI方式是实现数据库
//	 * @return
//	 */
//	public static Connection getConnection() {
//		//1.实例化context对象
//		try {
//			Context ctx = new InitialContext();
//			if(ctx != null) {
//				System.out.println("添加ctx");
//			}
//			//2.context对象lookup得到数据源对象DataSource
//			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/news");
//			if(ds != null) {
//				System.out.println("添加ds");
//			}
//			//3.DataSource对象的getConnection方法开启数据库连接
//			conn = ds.getConnection();
//			if(conn != null) {
//				System.out.println("添加conn");
//			}else {
//				System.out.println("添加conn未成功");
//			}
//		} catch (NamingException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return conn;
//	}
	static {
		init() ;
		getConnection();
	}
	@Test
	public static void init() {
		Properties params = new Properties();
		String config = "database.properties";
		InputStream  is = BaseDao.class.getClassLoader().getResourceAsStream(config);
		try {
			params.load(is);
			driver = params.getProperty("driver");
			System.out.println(driver);
			url= params.getProperty("url");
			System.out.println(url);
			user = params.getProperty("user");
			System.out.println(user);
			password = params.getProperty("password");
			System.out.println(password);
			Class.forName(driver);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取Coonection连接
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("连接数据库成功！");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;

	}
	/**
	 * 查看数据库中数据的总条数
	 * @param sql
	 * @return
	 */
	public static int getTotalCount(String sql){
		int count = -1;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, null, ps, rs);
		}
		return count;
	}
	/**
	 * 查询操作
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	protected static ResultSet query(String sql, Object... params) {
		try {
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} // 只要带有resultSet返回值的不能直接在DAO层去关闭数据库连接，否则在impl或者server层去接受时会出现错误
		return rs;
	}

	/**
	 * 增删改操作
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	protected static int update(String sql, Object... params) {
		int countResult = 0;
		try {
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}
			countResult = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, null, ps, null);
		}
		return countResult;
	}

	/**
	 * 关闭所有通道
	 * 
	 * @param Connection        c
	 * @param Statement         stms
	 * @param PreparedStatement ps
	 * @param ResultSet         rs
	 */
	public static void closeAll(Connection conn, Statement stms, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (stms != null) {
				stms.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}