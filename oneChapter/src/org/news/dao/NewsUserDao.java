package org.news.dao;

import java.util.List;

import org.news.entity.NewsUser;

public interface NewsUserDao {
	/**
	 * 用户注册插入数据
	 * @param newsUser
	 * @return
	 */
	int insert(NewsUser newsUser);
	/**
	 * 用户登录验证，用户登录判断与数据库是否一致
	 * @param newsUser
	 * @return
	 */
	boolean judgeUser(NewsUser newsUser);
	
	/**
	 * 根据用户id查询总数并，显示分页
	 * @return:总数量
	 */
	int getTotalCount();
	/**
	 * 查询制定页面的数据集合
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	List<NewsUser> getPageNewsList(int pageNo, int pageSize);
}
