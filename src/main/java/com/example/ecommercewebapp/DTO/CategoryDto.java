package com.example.ecommercewebapp.DTO;

import lombok.*;

@Setter
@Getter
@Data@AllArgsConstructor
@NoArgsConstructor
public class CategoryDto {
    private int id;
    private String name;
    private String description;
}
