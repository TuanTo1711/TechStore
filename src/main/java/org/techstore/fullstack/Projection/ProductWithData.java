package org.techstore.fullstack.Projection;

public interface ProductWithData {
    Integer getId();
    String getDescription();
    default String getVerData(){
        return getId().toString().concat(getDescription());
    }
}
