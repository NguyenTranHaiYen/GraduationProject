package com.example.TimNhaTro.service;

import com.example.TimNhaTro.dao.StreetDAO;
import com.example.TimNhaTro.model.District;
import com.example.TimNhaTro.model.Street;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StreetService {

    @Autowired
    StreetDAO streetDAO;

    public List<Street> findByDistricts(District district){
        return streetDAO.findByDistricts(district);
    }
    public Street findByIdStreet(Long id){
        return streetDAO.findByIdStreet(id);
    }
}
