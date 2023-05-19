package org.techstore.fullstack.DTO;

import jakarta.validation.constraints.Size;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * A DTO for the {@link org.techstore.fullstack.model.Product} entity
 */
public record ProductDto(Long id, @Size(max = 255) String name, BigDecimal price,
                         Integer saleOff) implements Serializable {
}