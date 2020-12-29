package com.newneek.j1.help;

import java.sql.Date;

import lombok.Data;

@Data
public class HelpVO {

	private long num;
	private String title;
	private String writer;
	private String contents;
	private Date regDate;
}
