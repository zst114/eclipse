package org.news.dao;

import java.util.List;

import org.news.entity.NewsUser;

public interface NewsUserDao {
	/**
	 * �û�ע���������
	 * @param newsUser
	 * @return
	 */
	int insert(NewsUser newsUser);
	/**
	 * �û���¼��֤���û���¼�ж������ݿ��Ƿ�һ��
	 * @param newsUser
	 * @return
	 */
	boolean judgeUser(NewsUser newsUser);
	
	/**
	 * �����û�id��ѯ����������ʾ��ҳ
	 * @return:������
	 */
	int getTotalCount();
	/**
	 * ��ѯ�ƶ�ҳ������ݼ���
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	List<NewsUser> getPageNewsList(int pageNo, int pageSize);
}
