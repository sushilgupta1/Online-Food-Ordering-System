package com.nit.service;

import java.util.Base64;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nit.model.Food;
import com.nit.repo.IFoodRepo;

@Service
public class FoodServiceImpl implements IFoodService {

	@Autowired
	private IFoodRepo repo;

	private List<Food> addImage(List<Food> list)
	{
		for (Food food : list) {
			byte[] foodimage = food.getFoodimage();
			byte[] encode = Base64.getEncoder().encode(foodimage);
			food.setBase64(new String(encode));
		}
		return list;
	}
	private Food addImage(Food food)
	{
		
			byte[] foodimage = food.getFoodimage();
			byte[] encode = Base64.getEncoder().encode(foodimage);
			food.setBase64(new String(encode));
		
		return food;
	}
	
	
	@Override
	public Integer addFood(Food food) {
		Food f = repo.save(food);
		return f.getFoodid();
	}

	@Override
	public List<Food> getAllFood() {
		List<Food> list = repo.findAll();
		list = this.addImage(list);
		return list;
	}

	@Override
	public Food getFoodById(Integer id) {
		Optional<Food> findById = repo.findById(id);
		if (findById.isPresent()) {
			Food food = findById.get();
			
			List<Food> list = this.addImage(List.of(food));
			food=list.get(0);
			return food;
		}
		throw new IllegalArgumentException("Invalid Food");
	}

	@Override
	public List<Food> getFoodByCategory(String category) {
		List<Food> list = repo.showByCategory(category);
		list = this.addImage(list);
		return list;
	}
	
	@Override
	public List<Food> searchFood(String data) {
		List<Food> list = repo.showFood(" "+data);
		list = this.addImage(list);
		return list;
	}
	@Override
	public Food addOnlyImage(Food food) {
		food = this.addImage(food);
		return food;
	}
	@Override
	public String deleteById(Integer id) {
		Optional<Food> findById = repo.findById(id);
		if(findById.isPresent())
		{
			repo.deleteById(id);
			return "Id : "+findById.get().getFoodid()+" is deleted";
		}
		return "Food not found";
	}
}
