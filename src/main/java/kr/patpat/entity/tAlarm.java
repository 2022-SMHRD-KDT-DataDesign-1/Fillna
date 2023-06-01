package kr.patpat.entity;

import lombok.Data;

@Data
public class tAlarm {
	private String objType;
	private String text;
	private String webUrl;
	private String mobileUrl;
	private String btnTitle;
}
