package com.example.TimNhaTro.service;

import com.example.TimNhaTro.dao.ImageDAO;
import com.example.TimNhaTro.model.Image;
import com.example.TimNhaTro.model.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageService {
    @Autowired
    ImageDAO imageDAO;

    public Image save(Image image){
        return imageDAO.save(image);
    }
}
