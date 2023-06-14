package org.techstore.fullstack.repository;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.techstore.fullstack.model.Customer;

import java.util.Optional;

public interface CustomerRepository extends JpaRepository<Customer, Integer>,
        JpaSpecificationExecutor<Customer> {

    @Cacheable(value = "existsByEmail", key = "#email")
    boolean existsByEmail(String email);

    @Cacheable(value = "findByEmail", key = "#email")
    Optional<Customer> findByEmail(String email);
}