package kr.patpat.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Alarm {
	private String alarmIdx;

	private String actionIdx;
	
	private String mbIdx;
	
	private String alarmType;
	
	private String alarmContent;
	
	private Timestamp alarm_at;
	
	private char alarmYn;
	
	public String getAlarmIdx() {
		return alarmIdx;
	}
	
	public void setAlarmIdx(String alarmIdx) {
		this.alarmIdx = alarmIdx;
	}
	
	public String getActionIdx() {
		return actionIdx;
	}
	
	public void setActionIdx(String actionIdx) {
		this.actionIdx = actionIdx;
	}
	
	public String getMbIdx() {
		return mbIdx;
	}
	
	public void setMbIdx(String mbIdx) {
		this.mbIdx = mbIdx;
	}
	
	public String getAlarmType() {
		return alarmType;
	}
	
	public void setAlarmType(String alarmType) {
		this.alarmType = alarmType;
	}
	
	public String getAlarmContent() {
		return alarmContent;
	}
	
	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}
	
	public Timestamp getAlarm_at() {
		return alarm_at;
	}
	
	public void setAlarm_at(Timestamp alarm_at) {
		this.alarm_at = alarm_at;
	}
	
	public char getAlarmYn() {
		return alarmYn;
	}
	
	public void setAlarmYn(char alarmYn) {
		this.alarmYn = alarmYn;
	}
	
}
