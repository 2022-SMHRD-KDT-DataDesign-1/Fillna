package kr.patpat.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Data
public class AlarmContent {
	
	private String alarm_content_idx;
	private String category_idx;
	private String alarm_type;
	private String alarm_content;
	private int cnt;
	
}
