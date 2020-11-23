package com.example.TimNhaTro.service;

import com.example.TimNhaTro.dao.RoomDAO;
import com.example.TimNhaTro.model.Room;
import com.example.TimNhaTro.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomService {
    @Autowired
    RoomDAO roomDAO;

    public Room save(Room room){
        return roomDAO.save(room);
    }
}
