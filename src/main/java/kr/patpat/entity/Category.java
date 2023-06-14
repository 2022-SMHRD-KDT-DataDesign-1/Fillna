package kr.patpat.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Category {
	
	private String categoryIdx;

	private String categoryName;
	
	public String getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(String categoryIdx) {
		this.categoryIdx = categoryIdx;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	
}
