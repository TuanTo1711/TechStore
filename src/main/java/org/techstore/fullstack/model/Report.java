package org.techstore.fullstack.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.math.BigDecimal;
import java.nio.file.LinkOption;
import java.time.LocalDateTime;

@SuppressWarnings("JpaAttributeTypeInspection")
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "Report", schema = "dbo")
public class Report implements Serializable {
    @Id
    @Column(name = "category")
    private Integer category;
    @Column(name = "category_Name")
    private String category_Name;
    @Column(name = "sum")
    private BigDecimal sum;
    @Column(name = "count")
    private Long count;
    @Column(name = "created_at")
    private LocalDateTime created_at;

    public Report(Integer category,String category_Name, BigDecimal sum, Long count) {
        this.category = category;
        this.category_Name = category_Name;
        this.sum = sum;
        this.count = count;
        this.created_at = LocalDateTime.now();
    }


}
