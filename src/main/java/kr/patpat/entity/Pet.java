package kr.patpat.entity;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Pet {

    // 반려동물 식별자
    private String petIdx;

    // 반려동물 이름
    private String petName;

    // 반려동물 입양일
    private Timestamp petAdoptionAt;

    // 반려동물 사진
    private String petPhoto;

    // 반려동물 성별
    private String petGender;

    // 주인 아이디
    private String mbIdx;

    public String getPetIdx() {
        return petIdx;
    }

    public void setPetIdx(String petIdx) {
        this.petIdx = petIdx;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public Timestamp getPetAdoptionAt() {
        return petAdoptionAt;
    }

    public void setPetAdoptionAt(Timestamp petAdoptionAt) {
        this.petAdoptionAt = petAdoptionAt;
    }

    public String getPetPhoto() {
        return petPhoto;
    }

    public void setPetPhoto(String petPhoto) {
        this.petPhoto = petPhoto;
    }

    public String getPetGender() {
        return petGender;
    }

    public void setPetGender(String petGender) {
        this.petGender = petGender;
    }

    public String getMbIdx() {
        return mbIdx;
    }

    public void setMbIdx(String mbIdx) {
        this.mbIdx = mbIdx;
    }
}