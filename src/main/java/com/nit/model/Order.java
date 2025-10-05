package com.nit.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "Orders")
public class Order {

	@Id
    @SequenceGenerator(name = "ORDER_SEQ", allocationSize = 1, initialValue = 100)
    @GeneratedValue(generator = "ORDER_SEQ", strategy = GenerationType.SEQUENCE)
	private Integer orderid;
	private String paymentmode;
	private String deliveryaddress;
	private double price;
	private double discount;
	private double delivery;
	private double finalprice;
	private LocalDateTime orderDate;
	private String status;
	private String paymentstatus;
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL)
    private List<OrderItem> orderItems = new ArrayList<>();
}
