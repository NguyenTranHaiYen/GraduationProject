package com.example.TimNhaTro.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="interface_streets")
public class InterfaceStreet {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long idInterfaceStreet;

    private String name;

    private String prefix;

    public Long getIdInterfaceStreet() {
        return idInterfaceStreet;
    }

    public void setIdInterfaceStreet(Long idInterfaceStreet) {
        this.idInterfaceStreet = idInterfaceStreet;
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
}
