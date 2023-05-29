package org.techstore.fullstack.Projection;

import java.math.BigDecimal;

public interface CategorySlim {
    Long getId();
    String getCategoryName();
    ProductWithId getProducts();

    interface  ProductWithId{
        Integer getId();
        String getName();
        String getDescription();
        BigDecimal getPrice();
    }


}
