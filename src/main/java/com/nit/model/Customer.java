package com.nit.model;

import java.io.Serializable;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Entity
@Data
public class Customer implements Serializable{

    @Id
    @SequenceGenerator(name = "CUS_SEQ", allocationSize = 1, initialValue = 100,sequenceName = "CUS_SEQ")
    @GeneratedValue(generator = "CUS_SEQ", strategy = GenerationType.SEQUENCE )
    private Integer cid;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private Long contactnumber;
    private String address;

    transient private int totalorder;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customer",targetEntity = Cart.class)
    private Set<Cart> cart;  
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "customer",targetEntity = Order.class)
    private Set<Order> order;  
}
