package org.techstore.fullstack.repository;

import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.techstore.fullstack.model.Product;
import org.techstore.fullstack.model.User;

public interface UsersRepo extends JpaRepository<User, Long> {
}
