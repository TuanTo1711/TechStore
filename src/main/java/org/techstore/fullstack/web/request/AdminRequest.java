package org.techstore.fullstack.web.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.techstore.fullstack.model.Category;

import java.math.BigDecimal;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminRequest {
    private Integer id;

    private String productName;

    private String description;

    private BigDecimal price;
}
