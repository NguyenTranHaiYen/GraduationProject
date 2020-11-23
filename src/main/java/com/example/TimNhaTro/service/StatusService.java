package com.example.TimNhaTro.service;

import com.example.TimNhaTro.dao.StatusDAO;
import com.example.TimNhaTro.model.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatusService {

    @Autowired
    StatusDAO statusDAO;
    public Status findByIdStatus(Long id){
        return statusDAO.findByIdStatus(id);
    }
}
