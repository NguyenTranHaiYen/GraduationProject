package com.example.TimNhaTro.model;

import com.sun.org.apache.xpath.internal.operations.Bool;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;

import java.util.Collection;

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

    public Boolean wc;

    public Boolean wifi;

    public Boolean parking;

    @ManyToOne
    @JoinColumn(name = "status_id")
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Status status;

    @ManyToOne
    @JoinColumn(name = "category_room_id")
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private CategoryRoom categoryRoom;

    @ManyToOne
    @JoinColumn(name = "streets_id")
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Street street;

    @ManyToOne
    @JoinColumn(name = "users_id")
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private User user;

    @OneToMany( mappedBy = "room", cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Collection<Image> images;

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

    public Boolean getWc() {
        return wc;
    }

    public void setWc(Boolean wc) {
        this.wc = wc;
    }

    public Boolean getWifi() {
        return wifi;
    }

    public void setWifi(Boolean wifi) {
        this.wifi = wifi;
    }

    public Boolean getParking() {
        return parking;
    }

    public void setParking(Boolean parking) {
        this.parking = parking;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public CategoryRoom getCategoryRoom() {
        return categoryRoom;
    }

    public void setCategoryRoom(CategoryRoom categoryRoom) {
        this.categoryRoom = categoryRoom;
    }

    public Street getStreet() {
        return street;
    }

    public void setStreet(Street street) {
        this.street = street;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Collection<Image> getImages() {
        return images;
    }

    public void setImages(Collection<Image> images) {
        this.images = images;
    }
}
