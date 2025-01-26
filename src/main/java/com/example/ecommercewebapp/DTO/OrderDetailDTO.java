package com.example.ecommercewebapp.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class OrderDetailDTO {
    private int id ;
    private int price;
    private int quantity;
    private int orderId;
    private int productId;
    private double total;
    private int uid;

    public OrderDetailDTO(int id, int price, int quantity, int orderId, int productId) {
        this.id = id;
        this.price = price;
        this.quantity = quantity;
        this.orderId = orderId;
        this.productId = productId;
    }

    public OrderDetailDTO( int quantity, int orderId, int productId, double total, int uid) {
        this.quantity = quantity;
        this.orderId = orderId;
        this.productId = productId;
        this.total = total;
        this.uid = uid;
    }
}


