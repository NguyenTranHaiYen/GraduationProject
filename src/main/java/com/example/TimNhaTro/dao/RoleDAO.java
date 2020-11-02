package com.example.TimNhaTro.dao;

import com.example.TimNhaTro.Enum.ERole;
import com.example.TimNhaTro.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RoleDAO extends JpaRepository<Role, Long> {
    Optional<Role> findByRole(String role);
}
