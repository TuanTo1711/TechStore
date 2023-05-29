package org.techstore.fullstack.repository.info;

import java.math.BigDecimal;

/**
 * Projection for {@link org.techstore.fullstack.model.Product}
 */
public interface ProductInfo {
    Integer getId();

    String getName();

    String getDescription();

    BigDecimal getPrice();

    CategoryInfo getCategory();

    interface CategoryInfo {

        String getCategoryName();

        String getCategoryBrand();
    }
}