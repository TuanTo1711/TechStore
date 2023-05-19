package org.techstore.fullstack.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.techstore.fullstack.DTO.UserDTO;
import org.techstore.fullstack.mapper.UserDTOMapper;
import org.techstore.fullstack.model.Product;
import org.techstore.fullstack.model.User;
import org.techstore.fullstack.repository.ProductRepo;
import org.techstore.fullstack.repository.UsersRepo;
import org.techstore.fullstack.service.ProductService;
import org.techstore.fullstack.service.UsersService;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UsersServiceImpl implements UsersService {

    private final UsersRepo usersRepo;
    private final UserDTOMapper userDTOMapper;

    @Override
    public List<UserDTO> getAllUsers() {
        List<User> usersList = usersRepo.findAll();
        return usersList.stream()
                .map(userDTOMapper)
                .collect(Collectors.toList());
    }
}
