package com.example.TimNhaTro.dao;

import com.example.TimNhaTro.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO extends JpaRepository<User, Long> {
    User findByUsername( String username);
    Boolean existsByUsername(String userName);
    Boolean existsByEmail(String email);
}
