package org.techstore.fullstack.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "INVENTORIES", schema = "dbo")
public class Inventory {
    @Id
    @Column(name = "PRODUCT_ID", nullable = false)
    private Integer id;

    @Column(name = "QUANTITY")
    private Integer quantity;

}