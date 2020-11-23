package com.example.TimNhaTro.controller;

import com.example.TimNhaTro.model.*;
import com.example.TimNhaTro.service.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import javax.xml.bind.DatatypeConverter;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/nhatro/")
public class Controller {
    @Autowired
    DistrictService districtService;

    @Autowired
    StreetService streetService;

    @Autowired
    CategoryRoomService categoryRoomService;

    @Autowired
    StatusService statusService;

    @Autowired
    UserService userService;

    @Autowired
    RoomService roomService;

    @Autowired
    ImageService imageService;

    public static String md5Hash(String c) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(c.getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
        return myHash;
    }

    @GetMapping("/getDistricts")
    public List<District> getDistricts() {
        Province province = new Province();
        province.setIdProvince((long) 1);
        province.setName("Hồ Chí Minh");
        List<District> districts = new ArrayList<>();
        try {
            districts = districtService.findByProvince(province);
        } catch (Exception e) {
            System.out.println(e);
        }
        return districts;
    }


    @GetMapping("/getStreets")
    public List<Street> getStreetsByDistrict(@RequestParam Long districtid) {
        District district = new District();
        try {
            district = districtService.findByIdDistrict(districtid);
        } catch (Exception e) {
            System.out.println(e);
        }
        List<Street> streets = new ArrayList<>();
        try {
            streets = streetService.findByDistricts(district);
        } catch (Exception e) {
            System.out.println(e);
        }
        return streets;
    }

    @PostMapping("/createPost")
    public Boolean createPost(@RequestParam(value = "file", required = true) MultipartFile[] file, @RequestParam("data") String data) throws IOException, NoSuchAlgorithmException {

        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = objectMapper.readValue(data, Map.class);

        Room room = new Room();
        room.setAcreage(Float.parseFloat((String) map.get("acreage")));
        room.setPriceRoom(Float.parseFloat((String) map.get("priceRoom")));
        room.setPriceElectric(Float.parseFloat((String) map.get("priceElectric")));
        room.setPriceWater(Float.parseFloat((String) map.get("priceWater")));
        room.setTitle((String) map.get("title"));
        room.setDescription((String) map.get("description"));
        room.setWc((Boolean) map.get("toilet"));
        room.setWifi((Boolean) map.get("wifi"));
        room.setParking((Boolean) map.get("parking"));

        if (("Integer").equals(map.get("statusId").getClass().getSimpleName())) {
            room.setStatus(statusService.findByIdStatus(Long.parseLong(String.valueOf((Integer) map.get("statusId")))));
        } else {
            room.setStatus(statusService.findByIdStatus(Long.parseLong((String) map.get("statusId"))));
        }
        if (("Integer").equals(map.get("categoryRoomId").getClass().getSimpleName())) {
            room.setCategoryRoom(categoryRoomService.findByIdCategoryRoom(Long.parseLong(String.valueOf((Integer) map.get("categoryRoomId")))));
        } else {
            room.setCategoryRoom(categoryRoomService.findByIdCategoryRoom(Long.parseLong((String) map.get("categoryRoomId"))));
        }
        if (("Integer").equals(map.get("streetId").getClass().getSimpleName())) {
            room.setStreet(streetService.findByIdStreet(Long.parseLong(String.valueOf((Integer) map.get("streetId")))));
        } else {
            room.setStreet(streetService.findByIdStreet(Long.parseLong((String) map.get("streetId"))));
        }
        if (("Integer").equals(map.get("userId").getClass().getSimpleName())) {
            room.setUser(userService.findByIdUser(Long.parseLong(String.valueOf((Integer) map.get("userId")))));
        } else {
            room.setUser(userService.findByIdUser(Long.parseLong((String) map.get("userId"))));
        }

        Room newRoom = roomService.save(room);

        Collection<Image> imageCollection = new ArrayList<>();

        for (int i = 0; i < file.length; i++) {
            Image image = new Image();
            image.setData(file[i].getBytes());
            image.setFileName(file[i].getOriginalFilename());
            image.setFileType(file[i].getContentType());
            image.setImageUuid(md5Hash(image.getData().toString() + image.getFileName()));
            image.setRoom(newRoom);
            imageCollection.add(image);
        }
        for(Image image1:imageCollection){
            Image image2= imageService.save(image1);
        }
        return true;
    }
}
