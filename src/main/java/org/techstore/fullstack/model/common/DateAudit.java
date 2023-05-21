package org.techstore.fullstack.model.common;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import java.time.Instant;

@Getter
@Setter
@MappedSuperclass
public abstract class DateAudit {

    @CreatedDate
    @Column(name = "CREATED_AT")
    private Instant createdAt;

    @LastModifiedDate
    @Column(name = "UPDATED_AT")
    private Instant updatedAt;
}