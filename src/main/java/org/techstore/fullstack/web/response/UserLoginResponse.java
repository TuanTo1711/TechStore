package org.techstore.fullstack.web.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.techstore.fullstack.DTO.UserDTO;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserLoginResponse {

    private UserDTO data;
    private String message;
    private Date loginAt;

}
