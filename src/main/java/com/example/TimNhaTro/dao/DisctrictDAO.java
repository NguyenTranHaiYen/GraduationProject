package com.example.TimNhaTro.dao;

import com.example.TimNhaTro.model.District;
import com.example.TimNhaTro.model.Province;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DisctrictDAO extends JpaRepository<District, Long> {
    List<District> findByProvince(Province province);
    District findByIdDistrict(Long idDistrict);
}
