package org.techstore.fullstack.web.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductRequest {
    private Integer id;
    private String name;
    private String description;
    private BigDecimal price;
    private Set<CategoryRequest> categoryRequests;
}
