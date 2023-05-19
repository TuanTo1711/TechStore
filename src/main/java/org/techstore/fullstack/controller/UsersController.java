package org.techstore.fullstack.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.techstore.fullstack.DTO.UserDTO;
import org.techstore.fullstack.model.User;
import org.techstore.fullstack.service.UsersService;

import java.util.List;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
public class UsersController {

    final UsersService usersService;

    @GetMapping("/User")
    public List<UserDTO> getAllUsers(){
        return usersService.getAllUsers();
    }

}
