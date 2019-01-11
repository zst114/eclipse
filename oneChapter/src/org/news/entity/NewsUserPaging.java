package org.news.entity;

import java.util.List;

public class NewsUserPaging {
	/**
	 * ��������
	 */
	private int totalCount = 0;
	/**
	 * ��ҳ��
	 */
	private int totalPageCount = 0;
	/**
	 * ÿҳ��ʾ����
	 */
	private int pageSize = 5;
	/**
	 * ��ǰҳ��
	 */
	private int currPageNo = 1;
	/**
	 * ÿҳ�ļ���
	 */
	private List<NewsUser> newList;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		if (this.totalCount > 0) {
			this.totalCount = totalCount;
			// ������ҳ��
			totalPageCount = totalCount % pageSize == 0 ? this.totalCount / pageSize : this.totalCount / pageSize + 1;
		}
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

//	public void setTotalPageCount(int totalPageCount) {
//		if(totalPageCount > 0) {
//			this.totalPageCount = totalPageCount;
//		}
//	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if(pageSize > 0) {
			this.pageSize = pageSize;
		}
	}

	public int getCurrPageNo() {
		return currPageNo;
	}

	public void setCurrPageNo(int currPageNo) {
		if(currPageNo > 0) {
			this.currPageNo = currPageNo;
		}
	}

	public List<NewsUser> getNewList() {
		return newList;
	}

	public void setNewList(List<NewsUser> newList) {
		this.newList = newList;
	}
}
