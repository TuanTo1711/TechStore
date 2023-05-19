package org.techstore.fullstack.mapper;

import org.springframework.stereotype.Service;
import org.techstore.fullstack.DTO.UserDTO;
import org.techstore.fullstack.model.User;

import java.util.Collections;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class UserDTOMapper implements Function<User, UserDTO> {
    @Override
    public UserDTO apply(User user) {
        return new UserDTO(
        user.getId(),
                user.getEmail(),
                user.getName(),
                user.getCreateAt(),
                user.getUpdateAt(),
                user.getDeleteAt(),
                Collections.singletonList(user.getPoint())
        );
    }
}
