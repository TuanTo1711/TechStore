package org.techstore.fullstack.service;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.techstore.fullstack.repository.CustomerRepository;

@Service
@RequiredArgsConstructor
public class AppUserService implements UserDetailsService {

    private final CustomerRepository customerRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return customerRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("Account not found !"));
    }
}
