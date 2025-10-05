package com.nit.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nit.model.OrderedFood;

public interface IOrderdFoodRepo extends JpaRepository<OrderedFood, Integer>{

}
