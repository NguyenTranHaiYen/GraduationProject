package com.example.TimNhaTro.controller;

import com.example.TimNhaTro.model.District;
import com.example.TimNhaTro.model.Province;
import com.example.TimNhaTro.model.Street;
import com.example.TimNhaTro.service.DistrictService;
import com.example.TimNhaTro.service.StreetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/nhatro/")
public class Controller {
    @Autowired
    DistrictService districtService;

    @Autowired
    StreetService streetService;

    @GetMapping("/getDistricts")
    public List<District> getDistricts(){
        Province province = new Province();
        province.setIdProvince((long) 1);
        province.setName("Hồ Chí Minh");
        List<District> districts = new ArrayList<>();
        try {
            districts=districtService.findByProvince(province);
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        return districts;
    }


    @GetMapping("/getStreets")
    public List<Street> getStreetsByDistrict(@RequestParam Long districtid){
        District district = new District();
        try {
            district= districtService.findByIdDistrict(districtid);
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        List<Street> streets = new ArrayList<>();
        try {
            streets= streetService.findByDistricts(district);
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        return streets;
    }
}
