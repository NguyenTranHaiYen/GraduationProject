package com.example.TimNhaTro.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="rooms")
public class Room {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long idRoom;

    private Float acreage;

    private Float priceRoom;

    private Float priceElectric;

    private Float priceWater;

    private String title;

    private String description;

    private Long statusId;

    private Long streetId;

    private Long categoryRoomId;

    public Long getIdRoom() {
        return idRoom;
    }

    public void setIdRoom(Long idRoom) {
        this.idRoom = idRoom;
    }

    public Float getAcreage() {
        return acreage;
    }

    public void setAcreage(Float acreage) {
        this.acreage = acreage;
    }

    public Float getPriceRoom() {
        return priceRoom;
    }

    public void setPriceRoom(Float priceRoom) {
        this.priceRoom = priceRoom;
    }

    public Float getPriceElectric() {
        return priceElectric;
    }

    public void setPriceElectric(Float priceElectric) {
        this.priceElectric = priceElectric;
    }

    public Float getPriceWater() {
        return priceWater;
    }

    public void setPriceWater(Float priceWater) {
        this.priceWater = priceWater;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getStatusId() {
        return statusId;
    }

    public void setStatusId(Long statusId) {
        this.statusId = statusId;
    }

    public Long getStreetId() {
        return streetId;
    }

    public void setStreetId(Long streetId) {
        this.streetId = streetId;
    }

    public Long getCategoryRoomId() {
        return categoryRoomId;
    }

    public void setCategoryRoomId(Long categoryRoomId) {
        this.categoryRoomId = categoryRoomId;
    }
}
