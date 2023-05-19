package org.techstore.fullstack.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
public class Category {
    @Id
    @Size(max = 255)
    @Nationalized
    @Column(name = "id", nullable = false)
    private String id;

    @Nationalized
    @Lob
    @Column(name = "description")
    private String description;

    @OneToMany(mappedBy = "category")
    private Set<Product> products = new LinkedHashSet<>();

}