package com.example.TimNhaTro.dao;

import com.example.TimNhaTro.model.Status;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StatusDAO extends JpaRepository<Status, Long> {
    Status findByIdStatus(Long id);
}
