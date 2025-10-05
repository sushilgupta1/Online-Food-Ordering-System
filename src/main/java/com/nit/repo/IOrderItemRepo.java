package com.nit.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nit.model.OrderItem;

public interface IOrderItemRepo extends JpaRepository<OrderItem, Integer>{

}
