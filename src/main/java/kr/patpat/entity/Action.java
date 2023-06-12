package kr.patpat.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Action {
	private String actionIdx;

	private String petIdx;
	
	private String categoryIdx;
	
	private int cnt;
	
	private String actionAt;
	
	private String mbIdx;

	public String getActionIdx() {
		return actionIdx;
	}

	public void setActionIdx(String actionIdx) {
		this.actionIdx = actionIdx;
	}

	public String getPetIdx() {
		return petIdx;
	}

	public void setPetIdx(String petIdx) {
		this.petIdx = petIdx;
	}

	public String getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(String categoryIdx) {
		this.categoryIdx = categoryIdx;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getActionAt() {
		return actionAt;
	}

	public void setActionAt(String actionAt) {
		this.actionAt = actionAt;
	}

	public String getMbIdx() {
		return mbIdx;
	}

	public void setMbIdx(String mbIdx) {
		this.mbIdx = mbIdx;
	}

	
}
