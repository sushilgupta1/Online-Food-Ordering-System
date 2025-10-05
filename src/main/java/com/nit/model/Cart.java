package com.nit.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.Data;

@Entity
@Data
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"customer_id", "food_id"}))
public class Cart implements Serializable{

    @Id
    @SequenceGenerator(name = "CART_SEQ", allocationSize = 1, initialValue = 100)
    @GeneratedValue(generator = "CART_SEQ", strategy = GenerationType.SEQUENCE)
    private Integer cartid;

    @ManyToMany
    @JoinTable(
        name = "cart_food",
        joinColumns = @JoinColumn(name = "cartid",referencedColumnName = "cartid"),
        inverseJoinColumns = @JoinColumn(name = "foodid",referencedColumnName = "foodid")
    )
    private Set<Food> food=new HashSet<Food>();

    transient private Food copyFood;
    private Integer qty;
    private Double price;

    @ManyToOne(targetEntity = Customer.class)
    private Customer customer;
    
    @ManyToOne(targetEntity = Order.class)
    private Order order;

}
