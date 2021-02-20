package com.newneek.j1.util;

import lombok.Data;

@Data
public class C_Pager2 {
	
	
	private String kind;
	private String search;
	
	private long curPage; //현재 페이지 번호
	private long perPage; //한 페이지에 보여줄 글의 갯수
	
	private long startRow; 
	private long lastRow;
	
	private long startNum;
	private long lastNum;
	private boolean isBefore;
	private boolean isAfter;
	
	public C_Pager2() {

	}
	
	
	public String getSearch() {
		if(this.search == null) {
			this.search="";
		}
		return this.search;
	}



}
