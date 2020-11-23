package com.example.TimNhaTro.service;

import com.example.TimNhaTro.dao.CategoryRoomDAO;
import com.example.TimNhaTro.dao.RoleDAO;
import com.example.TimNhaTro.model.CategoryRoom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryRoomService {

    @Autowired
    CategoryRoomDAO categoryRoomDAO;

    public CategoryRoom findByIdCategoryRoom(Long id){
        return categoryRoomDAO.findByIdCategoryRoom(id);
    }
}
