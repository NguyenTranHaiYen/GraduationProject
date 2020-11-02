package com.example.TimNhaTro.service;

import com.example.TimNhaTro.Enum.ERole;
import com.example.TimNhaTro.dao.RoleDAO;
import com.example.TimNhaTro.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class RoleService {

    @Autowired
    RoleDAO roleDAO;

    public Optional<Role>  findByRole(String role){
        return roleDAO.findByRole(role);
    }
}
