package org.news.daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.news.basedao.BaseDao;
import org.news.dao.NewsUserDao;
import org.news.entity.NewsUser;

public class NewsUserImpl extends BaseDao implements NewsUserDao {

	@Override
	public int insert(NewsUser newsUser) {
		int result = 0;
		String sql = "insert into `news_users`(`uname`,`upwd`) values(?,?)";
		result = BaseDao.update(sql, newsUser.getUname(), newsUser.getUpwd());
		return result;
	}

	@Override
	public boolean judgeUser(NewsUser newsUser) {
		boolean fals = false;
		String sql = "select `uname`,`upwd` from `news_users` where `uname`=? and `upwd`=?;";
		ResultSet rss = BaseDao.query(sql, newsUser.getUname(), newsUser.getUpwd());
		System.out.println("²éÑ¯Íê±Ï£¡");
		try {
			while (rss.next()) {
				if (rss.getString("uname").equals(newsUser.getUname())
						&& rss.getString("upwd").equals(newsUser.getUpwd())) {
					System.out.println("fals = true");
					fals = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fals;
	}

	@Override
	public int getTotalCount() {
		String sql = "select count(`user_id) from news_users";
		int count = BaseDao.getTotalCount(sql);
		return count;
	}

	public static void main(String[] args) {
		NewsUserImpl a = new NewsUserImpl();
		System.out.println(a.getPageNewsList(1,2));
	}

	@Override
	@Test
	public List<NewsUser> getPageNewsList(int pageNo, int pageSize) {
		List<NewsUser> newsUserList = new ArrayList<NewsUser>();
		String sql = "select * from `news_users` limit ?,?";
		try {
			ResultSet rs = BaseDao.query(sql, (pageNo -1 < 0 ? pageNo:pageNo -1) * pageSize, pageSize);
			while (rs.next()) {
				NewsUser newsUser = new NewsUser(rs.getInt("user_id"), 
						rs.getString("uname"), rs.getString("upwd"));
				newsUserList.add(newsUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newsUserList;
	}
}
