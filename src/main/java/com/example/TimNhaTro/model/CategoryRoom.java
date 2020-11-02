package com.example.TimNhaTro.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="category_rooms")
public class CategoryRoom {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long idCategoryRoom;

    private String category;

    public Long getIdCategoryRoom() {
        return idCategoryRoom;
    }

    public void setIdCategoryRoom(Long idCategoryRoom) {
        this.idCategoryRoom = idCategoryRoom;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
