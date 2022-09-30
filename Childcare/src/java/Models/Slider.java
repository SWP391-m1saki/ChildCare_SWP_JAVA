/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class Slider {
    private int sliderId;
    private String banner, reference;
    private LocalDate createAt;
    private boolean isShow;

    public Slider() {
    }

    public Slider(int sliderId, String banner, String reference, LocalDate createAt, boolean isShow) {
        this.sliderId = sliderId;
        this.banner = banner;
        this.reference = reference;
        this.createAt = createAt;
        this.isShow = isShow;
    }

    public int getSliderId() {
        return sliderId;
    }

    public void setSliderId(int sliderId) {
        this.sliderId = sliderId;
    }

    public String getBanner() {
        return banner;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public LocalDate getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDate createAt) {
        this.createAt = createAt;
    }

    public boolean isIsShow() {
        return isShow;
    }

    public void setIsShow(boolean isShow) {
        this.isShow = isShow;
    }
    
    
}
