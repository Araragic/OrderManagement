package cn.emagsoftware.dm.bean;

import java.util.List;

/**
 * A simple POJO that maps to the JSON structure of a jqGrid. 
 * <p> 
 
The property names of this POJO must match the property names of your jqGrid's jsonReader.
 * 
 * @see <a href="http://www.trirand.com/jqgridwiki/doku.php?id=wiki:retrieving_data#json_data">JSON Data</a>
 *
 */
public class ReturnData {

	/**
	 * Current page of the query
	 */
	private int page;
	
	/**
	 * Total pages for the query
	 */
	private int total;
	
	/**
	 * Total number of records for the query
	 */
	private int records;
	
	/**
	 * An array containing the actual data
	 */
	private List<?> data;
	
	
	public ReturnData() {
		
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getRecords() {
		return records;
	}

	public void setRecords(int records) {
		this.records = records;
	}

	public List<?> getData() {
		return data;
	}

	public void setData(List<?> data) {
		this.data = data;
	}
}