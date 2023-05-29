package org.techstore.fullstack.web.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.techstore.fullstack.model.Product;

import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CategoryRequest {
    private Integer id;
    private String categoryName;
    private Set<Product> product;
}
