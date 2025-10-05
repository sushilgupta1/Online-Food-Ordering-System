package com.nit.service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nit.model.Order;
import com.nit.repo.IOrderItemRepo;
import com.nit.repo.IOrderRepo;

@Service
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private IOrderRepo repo;

	@Override
	public String SaveOrder(Order order) {
		Order save = repo.save(order);
		return "Item Saved with Order Id:" + save.getOrderid();
	}

	@Override
	public List<Order> getAllOrder() {
		List<Order> findAll = repo.findAll();
		return findAll;
	}

	@Override
	public List<Order> getOrderByCustomerId(Integer cId) {
		List<Order> byCustomer_cid = repo.findByCustomer_cid(cId);
		return byCustomer_cid;
	}

	@Override
	public Order getOrderById(Integer orderId) {
		Optional<Order> findById = repo.findById(orderId);
		if (findById.isPresent())
			return findById.get();
		return null;
	}
	@Override
	public String setOrderStatus(Order order) {
		LocalDateTime orderDate = order.getOrderDate();
		if(!(order.getStatus().equalsIgnoreCase("delivered")||order.getStatus().equalsIgnoreCase("cancelled")))
		{
			Duration between = Duration.between(orderDate, LocalDateTime.now());
			long minutes = between.toMinutes();
			
			if(minutes>=3&&minutes<10)
			{
				order.setStatus("Preparing");
			}
			else if(minutes>=10&&minutes<20)
			{
				order.setStatus("Dispatched");
			}
			else if(minutes>=20)
			{
				order.setStatus("Delivered");
				order.setPaymentstatus("Payment Is Succesfull");
			}
			this.SaveOrder(order);
			return "Status Changed";
		}
		return "Not changed";
	}
}
