package com.example.TimNhaTro.model;

import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;

import java.util.Collection;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="category_rooms")
public class CategoryRoom {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long idCategoryRoom;

    private String category;

    @OneToMany( mappedBy = "categoryRoom", cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Collection<Room> rooms;
}
