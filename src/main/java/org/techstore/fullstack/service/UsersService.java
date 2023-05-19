package org.techstore.fullstack.service;

import org.springframework.stereotype.Repository;
import org.techstore.fullstack.DTO.UserDTO;
import org.techstore.fullstack.model.Product;
import org.techstore.fullstack.model.User;

import java.util.List;

@Repository
public interface UsersService {
    List<UserDTO> getAllUsers();
}
