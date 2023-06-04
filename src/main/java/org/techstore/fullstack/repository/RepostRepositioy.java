package org.techstore.fullstack.repository;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.techstore.fullstack.model.Report;

import java.util.List;

public interface RepostRepositioy extends JpaRepository<Report, Integer>, JpaSpecificationExecutor<Report> {
    @Query("SELECT o FROM Report o WHERE o.category_Name like ?1")
    List<Report> findByCategoryName( String name);
}
