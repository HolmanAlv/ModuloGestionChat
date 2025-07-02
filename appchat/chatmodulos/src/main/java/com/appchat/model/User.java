package com.appchat.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;
    private String apellido;
    private String email;
    private String celular;
    private Date fechaRegistro;

    // Getters and Setters
}