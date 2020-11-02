package com.example.TimNhaTro.model;

import lombok.*;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name="roles")
public class Role {

    @Id
    private Long idRole;

    private String role;

    public Role() {

    }

    public Long getIdRole() {
        return idRole;
    }

    public void setIdRole(Long idRole) {
        this.idRole = idRole;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

//    @OneToMany(mappedBy = "role", cascade = CascadeType.ALL)
//    @EqualsAndHashCode.Exclude
//    @ToString.Exclude
//    private Collection<User> user;

    public Role(Long idRole, String role) {
        this.idRole = idRole;
        this.role = role;
    }

}
