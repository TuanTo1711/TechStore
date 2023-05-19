package org.techstore.fullstack.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "Product")
public class Product extends DateAudit{
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @Size(max = 255)
    @Nationalized
    @Column(name = "name")
    private String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private Category category;

    @Column(name = "price", precision = 19, scale = 4)
    private BigDecimal price;

    @Column(name = "sale_off")
    private Integer saleOff;


    @OneToMany(mappedBy = "product")
    private Set<Comment> comments = new LinkedHashSet<>();

}