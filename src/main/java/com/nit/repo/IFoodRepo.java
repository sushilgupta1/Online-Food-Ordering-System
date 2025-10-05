package com.nit.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nit.model.Food;

public interface IFoodRepo extends JpaRepository<Food, Integer>{

	public List<Food> findByCategory(String category);
	
	@Query("from Food where LOWER(category) like LOWER(CONCAT('% ',:category,'%')) OR LOWER(description)like LOWER(CONCAT('%',:category,'%')) OR LOWER(foodname)like LOWER(CONCAT('%',:category,'%'))")
	public List<Food>  showByCategory(String category);
	
	@Query("from Food where WHERE LOWER(description) LIKE LOWER(CONCAT('%',:data,'%')) OR LOWER(foodname) LIKE LOWER(CONCAT('%',:data,'%')) OR LOWER(category) LIKE LOWER(CONCAT('%',:data,'%'))")
	public List<Food> showFood(String data);
}
