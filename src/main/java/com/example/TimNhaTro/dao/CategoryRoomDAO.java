package com.example.TimNhaTro.dao;

import com.example.TimNhaTro.model.CategoryRoom;
import com.example.TimNhaTro.model.District;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRoomDAO extends JpaRepository<CategoryRoom, Long> {
    CategoryRoom findByIdCategoryRoom(Long id);
}
