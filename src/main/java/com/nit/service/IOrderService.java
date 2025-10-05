package com.nit.service;

import java.util.List;

import com.nit.model.Order;

public interface IOrderService {

	public String SaveOrder(Order order);
	
	public List<Order> getAllOrder();
	
	public List<Order> getOrderByCustomerId(Integer cId);
	public Order getOrderById(Integer orderId);
	
	public String setOrderStatus(Order order);
}
