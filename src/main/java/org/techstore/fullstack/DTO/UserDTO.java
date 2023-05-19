package org.techstore.fullstack.DTO;

import jakarta.validation.constraints.Size;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.List;


public record UserDTO(
        Integer id,
        @Size(max = 255) String email,
        @Size(max = 50) String name,
        LocalDateTime createAt,
        LocalDateTime updateAt,
        LocalDateTime deleteAt,
        List<Double> point) {
}
