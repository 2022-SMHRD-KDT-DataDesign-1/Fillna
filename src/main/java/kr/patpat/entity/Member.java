package kr.patpat.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	// 회원 식별자
    private String mbIdx;

    // 회원 닉네임
    private String mbNick;

    // 회원 이메일
    private String mbEmail;

    // 회원 전화번호
    private String mbPhone;

    // 회원 프로필사진
    private String mbProfile;

    // 회원 알림시간
    private String mbAlarm;

    // 회원 가입일자
    private Timestamp mbJoinAt;

    // 회원 수정일자
    private Timestamp mbUpdateAt;

    // 관리자 여부
    private String adminYn;

    public String getMbIdx() {
        return mbIdx;
    }

    public void setMbIdx(String mbIdx) {
        this.mbIdx = mbIdx;
    }

    public String getMbNick() {
        return mbNick;
    }

    public void setMbNick(String mbNick) {
        this.mbNick = mbNick;
    }

    public String getMbEmail() {
        return mbEmail;
    }

    public void setMbEmail(String mbEmail) {
        this.mbEmail = mbEmail;
    }

    public String getMbPhone() {
        return mbPhone;
    }

    public void setMbPhone(String mbPhone) {
        this.mbPhone = mbPhone;
    }

    public String getMbProfile() {
        return mbProfile;
    }

    public void setMbProfile(String mbProfile) {
        this.mbProfile = mbProfile;
    }

    public String getMbAlarm() {
        return mbAlarm;
    }

    public void setMbAlarm(String mbAlarm) {
        this.mbAlarm = mbAlarm;
    }

    public Timestamp getMbJoinAt() {
        return mbJoinAt;
    }

    public void setMbJoinAt(Timestamp mbJoinAt) {
        this.mbJoinAt = mbJoinAt;
    }

    public Timestamp getMbUpdateAt() {
        return mbUpdateAt;
    }

    public void setMbUpdateAt(Timestamp mbUpdateAt) {
        this.mbUpdateAt = mbUpdateAt;
    }

    public String getAdminYn() {
        return adminYn;
    }

    public void setAdminYn(String adminYn) {
        this.adminYn = adminYn;
    }
}
