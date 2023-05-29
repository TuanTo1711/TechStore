package org.techstore.fullstack.web.response;

/**
 * Projection for {@link org.techstore.fullstack.model.Customer}
 */
public interface CustomerInfo {
    Integer getId();

    String getName();

    String getEmail();

    String getPhone();

    String getAddress();

    Double getRewardPoints();

    boolean isVerification();
}