package com.example.TimNhaTro.model;

import javax.persistence.*;

import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="streets")
public class Street {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long idStreet;

    private String name;

    private String prefix;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(	name = "streets_has_districts",
            joinColumns = @JoinColumn(name = "streets_id_street"),
            inverseJoinColumns = @JoinColumn(name = "districts_id_district"))
    private Set<District> districts = new HashSet<>();

    public Long getIdStreet() {
        return idStreet;
    }

    public void setIdStreet(Long idStreet) {
        this.idStreet = idStreet;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public Set<District> getDistricts() {
        return districts;
    }

    public void setDistricts(Set<District> districts) {
        this.districts = districts;
    }
}
