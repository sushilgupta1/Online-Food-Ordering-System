package com.nit.service;

import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nit.model.OrderedFood;
import com.nit.repo.IOrderdFoodRepo;
@Service
public class OrderedFoodServiceImpl implements IOrderedFoodService {

	@Autowired
	private IOrderdFoodRepo repo;
	
	@Override
	public List<OrderedFood> getAllOrderedFood() {
		
		return repo.findAll();
	}

	private OrderedFood addImage(OrderedFood food)
	{
		
			byte[] foodimage = food.getFoodimage();
			byte[] encode = Base64.getEncoder().encode(foodimage);
			
		
		return food;
	}
	@Override
	public OrderedFood addOnlyImage(OrderedFood food) {
		return this.addImage(food);
		
	}
	@Override
	public String addFood(OrderedFood food) {
		OrderedFood save = repo.save(food);
		return "food saved with foodid :"+save.getFoodid();
	}
}
