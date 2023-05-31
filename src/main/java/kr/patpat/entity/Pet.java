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
    private String pet_idx;

    // 반려동물 이름
    private String pet_name;

    // 반려동물 입양일
    private Timestamp pet_adoption_at;

    // 반려동물 사진
    private String pet_photo;

    // 반려동물 성별
    private String pet_gender;

    // 주인 아이디
    private String mb_idx;

    public String getPetIdx() {
        return pet_idx;
    }

    public void setPetIdx(String pet_idx) {
        this.pet_idx = pet_idx;
    }

    public String getPetName() {
        return pet_name;
    }

    public void setPetName(String pet_name) {
        this.pet_name = pet_name;
    }

    public Timestamp getPetAdoptionAt() {
        return pet_adoption_at;
    }

    public void setPetAdoptionAt(Timestamp pet_adoption_at) {
        this.pet_adoption_at = pet_adoption_at;
    }

    public String getPetPhoto() {
        return pet_photo;
    }

    public void setPetPhoto(String pet_photo) {
        this.pet_photo = pet_photo;
    }

    public String getPetGender() {
        return pet_gender;
    }

    public void setPetGender(String pet_gender) {
        this.pet_gender = pet_gender;
    }

    public String getMbIdx() {
        return mb_idx;
    }

    public void setMbIdx(String mb_idx) {
        this.mb_idx = mb_idx;
    }
}