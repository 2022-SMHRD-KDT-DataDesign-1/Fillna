package kr.patpat.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Memo {
	private String memoIdx;

	private String mbIdx;
	
	private String categoryIdx;
	
	private String memoContent;
	
	private String photo;
	
	private String memoAt;
	
	private String memoUpdateAt;

	public String getMemoIdx() {
		return memoIdx;
	}

	public void setMemoIdx(String memoIdx) {
		this.memoIdx = memoIdx;
	}

	public String getMbIdx() {
		return mbIdx;
	}

	public void setMbIdx(String mbIdx) {
		this.mbIdx = mbIdx;
	}

	public String getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(String categoryIdx) {
		this.categoryIdx = categoryIdx;
	}

	public String getMemoContent() {
		return memoContent;
	}

	public void setMemoContent(String memoContent) {
		this.memoContent = memoContent;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getMemoAt() {
		return memoAt;
	}

	public void setMemoAt(String memoAt) {
		this.memoAt = memoAt;
	}

	public String getMemoUpdateAt() {
		return memoUpdateAt;
	}

	public void setMemoUpdateAt(String memoUpdateAt) {
		this.memoUpdateAt = memoUpdateAt;
	}

	
}
