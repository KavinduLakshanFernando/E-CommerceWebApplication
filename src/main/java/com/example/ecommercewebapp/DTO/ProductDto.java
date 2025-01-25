package com.example.ecommercewebapp.DTO;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductDto {

    private int id;
    private String name;
    private int categoryid;
    private String description;
    private double price;
    private int quantity;
    private String image;
}
