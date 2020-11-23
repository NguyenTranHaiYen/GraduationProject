package com.example.TimNhaTro.model;

import lombok.*;

import javax.persistence.*;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.GenerationType.*;

@Entity
@Table(name="users")
public class User {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long idUser;

    private String fullname;

    private String email;

    private String username;

    private String pass;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(	name = "roles_has_users",
            joinColumns = @JoinColumn(name = "users_id_user"),
            inverseJoinColumns = @JoinColumn(name = "roles_id_role"))
    private Set<Role> roles = new HashSet<>();

    @OneToMany( mappedBy = "user", cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Collection<Room> rooms;

    public User( String fullname, String email, String username, String pass) {
        this.fullname = fullname;
        this.email = email;
        this.username = username;
        this.pass = pass;
    }

    public User() {
    }

    public Long getIdUser() {
        return idUser;
    }

    public void setIdUser(Long idUser) {
        this.idUser = idUser;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public Collection<Room> getRooms() {
        return rooms;
    }

    public void setRooms(Collection<Room> rooms) {
        this.rooms = rooms;
    }
}
