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
	
	private String memoAt;
	
	private String memoUpdateAt;
	
	private String memoPhotoName;
	
	private String memoPhotoPath;

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

	public String getMemoPhotoName() {
		return memoPhotoName;
	}

	public void setMemoPhotoName(String memoPhotoName) {
		this.memoPhotoName = memoPhotoName;
	}

	public String getMemoPhotoPath() {
		return memoPhotoPath;
	}

	public void setMemoPhotoPath(String memoPhotoPath) {
		this.memoPhotoPath = memoPhotoPath;
	}

	
}
