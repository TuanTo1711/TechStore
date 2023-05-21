package org.techstore.fullstack.service.impl;

import jakarta.transaction.Transactional;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.techstore.fullstack.exception.EmailAlreadyExistsException;
import org.techstore.fullstack.exception.ResourceNotFoundException;
import org.techstore.fullstack.model.Customer;
import org.techstore.fullstack.model.JwtToken;
import org.techstore.fullstack.model.common.Role;
import org.techstore.fullstack.repository.CustomerRepository;
import org.techstore.fullstack.repository.JwtTokenRepository;
import org.techstore.fullstack.service.AuthService;
import org.techstore.fullstack.util.JwtUtil;
import org.techstore.fullstack.web.request.SignInRequest;
import org.techstore.fullstack.web.request.SignUpRequest;
import org.techstore.fullstack.web.response.SignInResponse;
import org.techstore.fullstack.web.response.SignUpResponse;

import java.time.LocalDateTime;
import java.util.Optional;

@Transactional
@Service
@RequiredArgsConstructor
@Slf4j
public class AuthServiceImpl implements AuthService {

    private final AuthenticationManager authenticationManager;
    private final CustomerRepository customerRepository;
    private final JwtTokenRepository tokenRepository;
    private final PasswordEncoder encoder;
    private final JwtUtil jwtUtil;

    @Override
    public SignUpResponse register(@NonNull SignUpRequest request) {
        boolean emailExists = customerRepository.existsByEmail(request.getEmail());

        if (emailExists) {
            throw new EmailAlreadyExistsException("Your email already taken !!!");
        }
        LocalDateTime now = LocalDateTime.now();

        Customer customer = Customer.builder()
                .name(request.getName())
                .email(request.getEmail())
                .password(encoder.encode(request.getPassword()))
                .role(Role.CUSTOMER)
                .build();

        customerRepository.save(customer);

        String token = jwtUtil.generateToken(customer);
        JwtToken jwtToken = JwtToken.builder()
                .token(token)
                .customer(customer)
                .createdAt(now)
                .expiredAt(now.plusMinutes(30))
                .build();

        tokenRepository.save(jwtToken);

        return SignUpResponse.builder()
                .userId(customer.getId())
                .name(customer.getName())
                .email(customer.getEmail())
                .build();
    }

    @Override
    public void confirmAccount(String token) {
        log.info("TODO: SEND EMAIL");
    }

    @Override
    @SneakyThrows
    public SignInResponse login(@NonNull SignInRequest request) {
        Optional<Customer> foundAccount = customerRepository.findByEmail(request.getEmail());
        Customer customer = foundAccount.orElseThrow(() -> new ResourceNotFoundException("Account not found"));

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getEmail(),
                        request.getPassword()
                )
        );

        String accessToken = jwtUtil.generateToken(customer);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return new SignInResponse(accessToken, customer.isVerification());
    }
}
