package org.techstore.fullstack.DTO;

import jakarta.validation.constraints.Size;
import org.techstore.fullstack.model.Category;

import java.io.Serializable;

/**
 * A DTO for the {@link Category} entity
 */
public record CategoryDto(@Size(max = 255) String id, String description) implements Serializable {
}