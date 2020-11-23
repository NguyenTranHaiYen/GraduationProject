package com.example.TimNhaTro.dao;

import com.example.TimNhaTro.model.District;
import com.example.TimNhaTro.model.Role;
import com.example.TimNhaTro.model.Street;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StreetDAO extends JpaRepository<Street, Long> {
    List<Street> findByDistricts(District district);
    Street findByIdStreet(Long id);
}
