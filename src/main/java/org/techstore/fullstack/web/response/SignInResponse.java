package org.techstore.fullstack.web.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SignInResponse {

    private String accessToken;
    private String tokenType = "Bearer";
    private boolean enabled;

    public SignInResponse(String accessToken, boolean enabled) {
        this.accessToken = accessToken;
        this.enabled = enabled;
    }
}
