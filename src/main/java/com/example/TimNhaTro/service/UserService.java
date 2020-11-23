package com.example.TimNhaTro.service;

import com.example.TimNhaTro.dao.UserDAO;
import com.example.TimNhaTro.model.Street;
import com.example.TimNhaTro.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserDAO userDAO;

    public User getUserByUserName(String username){
        return userDAO.findByUsername(username);
    }

    public Boolean existsByUsername(String username){
        return userDAO.existsByUsername(username);
    }

    public Boolean existsByEmail(String email){
        return userDAO.existsByEmail(email);
    }

    public User save(User user){
        return userDAO.save(user);
    }

    public User findByIdUser(Long id){
        return userDAO.findByIdUser(id);
    }
}
