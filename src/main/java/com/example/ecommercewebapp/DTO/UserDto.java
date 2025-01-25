package com.example.ecommercewebapp.DTO;

import lombok.*;

@Getter @Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
    private int id;
    private String name;
    private String email;
    private String password;
    private String role;
}
