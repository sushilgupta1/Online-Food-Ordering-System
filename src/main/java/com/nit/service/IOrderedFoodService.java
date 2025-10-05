package com.nit.service;

import java.util.List;

import com.nit.model.OrderedFood;

public interface IOrderedFoodService {

	public List<OrderedFood> getAllOrderedFood();
	public OrderedFood addOnlyImage(OrderedFood food);
	public String addFood(OrderedFood food);
}
