package org.news.entity;

import java.util.List;

public class NewsUserPaging {
	/**
	 * 总数据量
	 */
	private int totalCount = 0;
	/**
	 * 总页数
	 */
	private int totalPageCount = 0;
	/**
	 * 每页显示条数
	 */
	private int pageSize = 5;
	/**
	 * 当前页码
	 */
	private int currPageNo = 1;
	/**
	 * 每页的集合
	 */
	private List<NewsUser> newList;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		if (this.totalCount > 0) {
			this.totalCount = totalCount;
			// 设置总页数
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
