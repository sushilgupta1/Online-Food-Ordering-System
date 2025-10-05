package com.nit.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nit.model.Admin;
import com.nit.model.Order;
import com.nit.model.OrderItem;
import com.nit.repo.IAdminRepo;
@Service
public class AdminServiceImpl implements IAdminService {

	@Autowired
	private IAdminRepo repo;
	@Autowired
	private IOrderService orderService;
	@Override
	public Admin login(String email, String password) {
		Optional<Admin> adminLogin = repo.checkAdminLogin(email, password);
		if(adminLogin.isPresent())return adminLogin.get();
		return null;
	}
	@Override
	public Double getSelling() {
		Double price = 0.0;
		List<Order> list = orderService.getAllOrder();
		for (Order order : list) {
			List<OrderItem> orderItems = order.getOrderItems();
			for (OrderItem item : orderItems) {
				if(!order.getStatus().equalsIgnoreCase("cancelled"))
					price += item.getPrice();
			}

		}
		return price;
	}

}
