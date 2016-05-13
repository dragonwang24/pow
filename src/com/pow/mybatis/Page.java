package com.pow.mybatis;


/**
 * 
 * @Description 对分页的基本数据进行一个简单的封装
 */
public class Page {
	
	/**
	 * Page对象存入Map时的key
	 */
	public static final String KEY = "page";

	/**
	 * pageSize : TODO
	 */
	private int pageSize;
	/**
	 * pageNumber : TODO
	 */
	private int pageNumber;
	/**
	 * searchText : TODO
	 */
	private String searchText;
	/**
	 * sortName : TODO
	 */
	private String sortName;
	/**
	 * sortOrder : TODO
	 */
	private String sortOrder;
	
	/**
	 * totalNumber : TODO
	 */
	private int totalNumber;
	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}
	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * @return the pageNumber
	 */
	public int getPageNumber() {
		return pageNumber;
	}
	/**
	 * @param pageNumber the pageNumber to set
	 */
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	/**
	 * @return the searchText
	 */
	public String getSearchText() {
		return searchText;
	}
	/**
	 * @param searchText the searchText to set
	 */
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	/**
	 * @return the sortName
	 */
	public String getSortName() {
		return sortName;
	}
	/**
	 * @param sortName the sortName to set
	 */
	public void setSortName(String sortName) {
		this.sortName = sortName;
	}
	/**
	 * @return the sortOrder
	 */
	public String getSortOrder() {
		return sortOrder;
	}
	/**
	 * @param sortOrder the sortOrder to set
	 */
	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}
	/**
	 * @return the totalNumber
	 */
	public int getTotalNumber() {
		return totalNumber;
	}
	/**
	 * @param totalNumber the totalNumber to set
	 */
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}

}
