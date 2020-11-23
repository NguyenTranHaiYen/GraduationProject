package com.example.TimNhaTro.dao;

import com.example.TimNhaTro.model.District;
import com.example.TimNhaTro.model.Image;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageDAO extends JpaRepository<Image, Long> {
}
