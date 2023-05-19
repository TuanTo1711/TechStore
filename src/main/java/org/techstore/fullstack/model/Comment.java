package org.techstore.fullstack.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Nationalized;

@Getter
@Setter
@Entity
public class Comment {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    private Product product;

    @Size(max = 255)
    @Nationalized
    @Column(name = "name")
    private String name;

    @Nationalized
    @Lob
    @Column(name = "content")
    private String content;

    @Column(name = "rating")
    private Integer rating;

}