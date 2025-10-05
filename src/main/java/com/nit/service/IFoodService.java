package com.nit.service;

import java.util.List;

import com.nit.model.Food;


public interface IFoodService {

	public Integer addFood(Food food);
	public List<Food> getAllFood();
	
	public Food getFoodById(Integer id);
	
	public List<Food> getFoodByCategory(String category);
	
	public List<Food> searchFood(String data);
	
	public Food addOnlyImage(Food food);
	
	public String deleteById(Integer id);
}
