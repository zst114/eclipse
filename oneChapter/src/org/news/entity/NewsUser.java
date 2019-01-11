package org.news.entity;

public class NewsUser {
	private int userId;
	private String uname;
	private String upwd;

	public NewsUser() {

	}

	public NewsUser(int userId, String uname, String upwd) {
		super();
		this.userId = userId;
		this.uname = uname;
		this.upwd = upwd;
	}

	public NewsUser(String uname, String upwd) {
		this.uname = uname;
		this.upwd = upwd;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	@Override
	public String toString() {
		return "NewsUser [userId=" + userId + ", uname=" + uname + ", upwd=" + upwd + "]";
	}

}
