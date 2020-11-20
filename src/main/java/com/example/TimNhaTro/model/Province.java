package com.example.TimNhaTro.model;

import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;

import java.util.Collection;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="provinces")
public class Province {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long idProvince;

    private String name;

    // @ManyToMany, @OneToMany default fetch = FetchType.LAZY,

    @OneToMany( mappedBy = "province", cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Collection<District> districts;

    public Long getIdProvince() {
        return idProvince;
    }

    public void setIdProvince(Long idProvince) {
        this.idProvince = idProvince;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
