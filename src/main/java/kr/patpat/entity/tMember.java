package kr.patpat.entity;

import java.sql.Timestamp;

public class tMember {

	// 회원 식별자
    private String mb_idx;

    // 회원 토큰
    private String mb_token;

    // 회원 이름
    private String mb_name;

    // 회원 닉네임
    private String mb_nick;

    // 회원 이메일
    private String mb_email;

    // 회원 전화번호
    private String mb_phone;

    // 회원 프로필사진
    private String mb_profile;

    // 회원 알림시간
    private String mb_alarm;

    // 회원 가입일자
    private Timestamp mb_join_at;

    // 회원 수정일자
    private Timestamp mb_update_at;

    // 관리자 여부
    private String admin_yn;

    public String getMbIdx() {
        return mb_idx;
    }

    public void setMbIdx(String mb_idx) {
        this.mb_idx = mb_idx;
    }

    public String getMbToken() {
        return mb_token;
    }

    public void setMbToken(String mb_token) {
        this.mb_token = mb_token;
    }

    public String getMbName() {
        return mb_name;
    }

    public void setMbName(String mb_name) {
        this.mb_name = mb_name;
    }

    public String getMbNick() {
        return mb_nick;
    }

    public void setMbNick(String mb_nick) {
        this.mb_nick = mb_nick;
    }

    public String getMbEmail() {
        return mb_email;
    }

    public void setMbEmail(String mb_email) {
        this.mb_email = mb_email;
    }

    public String getMbPhone() {
        return mb_phone;
    }

    public void setMbPhone(String mb_phone) {
        this.mb_phone = mb_phone;
    }

    public String getMbProfile() {
        return mb_profile;
    }

    public void setMbProfile(String mb_profile) {
        this.mb_profile = mb_profile;
    }

    public String getMbAlarm() {
        return mb_alarm;
    }

    public void setMbAlarm(String mb_alarm) {
        this.mb_alarm = mb_alarm;
    }

    public Timestamp getMbJoinAt() {
        return mb_join_at;
    }

    public void setMbJoinAt(Timestamp mb_join_at) {
        this.mb_join_at = mb_join_at;
    }

    public Timestamp getMbUpdateAt() {
        return mb_update_at;
    }

    public void setMbUpdateAt(Timestamp mb_update_at) {
        this.mb_update_at = mb_update_at;
    }

    public String getAdminYn() {
        return admin_yn;
    }

    public void setAdminYn(String admin_yn) {
        this.admin_yn = admin_yn;
    }
}
