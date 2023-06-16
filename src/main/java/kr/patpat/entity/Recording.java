package kr.patpat.entity;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Recording {
	private String recordingIdx;

	private String mbIdx;
	
	private String actionIdx;
	
	private String recordingFile;
	
	private String recordingAt;

	public String getRecordingIdx() {
		return recordingIdx;
	}

	public void setRecordingIdx(String recordingIdx) {
		this.recordingIdx = recordingIdx;
	}

	public String getMbIdx() {
		return mbIdx;
	}

	public void setMbIdx(String mbIdx) {
		this.mbIdx = mbIdx;
	}

	public String getActionIdx() {
		return actionIdx;
	}

	public void setActionIdx(String actionIdx) {
		this.actionIdx = actionIdx;
	}

	public String getRecordingFile() {
		return recordingFile;
	}

	public void setRecordingFile(String recordingFile) {
		this.recordingFile = recordingFile;
	}

	public String getRecordingAt() {
		return recordingAt;
	}

	public void setRecordingAt(String recordingAt) {
		this.recordingAt = recordingAt;
	}
	
	

	
}
