package com.example.TimNhaTro.service;

import com.example.TimNhaTro.dao.DisctrictDAO;
import com.example.TimNhaTro.model.District;
import com.example.TimNhaTro.model.Province;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DistrictService {

    @Autowired
    DisctrictDAO disctrictDAO;

    public List<District> findByProvince(Province province){
        return disctrictDAO.findByProvince(province);
    }
    public District findByIdDistrict(Long idDistrict){ return disctrictDAO.findByIdDistrict(idDistrict);}
}
