package com.example.ecommercewebapp.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class OrderDto {
    private int oid;
    private int uid;
    private double total;
}
