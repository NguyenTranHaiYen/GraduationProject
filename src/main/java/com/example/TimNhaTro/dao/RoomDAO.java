package com.example.TimNhaTro.dao;

import com.example.TimNhaTro.model.Role;
import com.example.TimNhaTro.model.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomDAO extends JpaRepository<Room, Long> {
}
