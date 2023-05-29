package org.techstore.fullstack.web.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GetProductsResponse {
    private Integer id;

    private String productName;

    private String description;

    private BigDecimal price;

    private String categoryName;

    private String brand;
}
