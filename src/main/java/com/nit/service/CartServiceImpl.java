package com.nit.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.hibernate.type.ConvertedBasicArrayType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nit.model.Cart;
import com.nit.model.Customer;
import com.nit.model.Food;
import com.nit.repo.ICartRepo;
import com.nit.repo.ICustomerRepo;
import com.nit.repo.IFoodRepo;
@Service
public class CartServiceImpl implements ICartService{

	@Autowired
	private ICartRepo repo;
	@Autowired
	private IFoodRepo foodRepo;
	@Autowired
	private ICustomerRepo customerRepo;
	
	@Override
	public String addToCart(Integer foodid, Integer cid) {
		
		Optional<Cart> check = repo.findByCustomer_CidAndFood_Foodid(cid, foodid);
		Optional<Food> food = foodRepo.findById(foodid);
		Optional<Customer> cus = customerRepo.findById(cid);
		
		boolean flag=false;
		if(food.isPresent())
		{
			
			if(cus.isPresent())
			{
				flag=true;
			}
		}
		if(!flag)throw new IllegalArgumentException("Something went wrong");
		if(check.isPresent())
		{
			System.err.println("*******************Prensent*********************");
			Cart cart = check.get();
			Food food2 = food.get();
			HashSet<Cart> cartSet = new HashSet<Cart>();
			cartSet.add(cart);
			HashSet<Food> foodSet = new HashSet<Food>();
			foodSet.add(food2);
			food2.setCart(cartSet);
			cart.setFood(foodSet);
			cart.setQty(cart.getQty()+1);
			cart.setPrice(food.get().getPrice()*cart.getQty());
			repo.save(cart);
		}
		else
		{
			System.err.println("*******************Not-Prensent*********************");
			Cart cart = new Cart();
			Food food2 = food.get();
			food2.setCart(Set.of(cart));
			cart.setQty(1);
			cart.setFood(Set.of(food2));
			cart.setPrice(food.get().getPrice());
			cart.setCustomer(cus.get());
			cart.setFood(Set.of(food.get()));
			repo.save(cart);
		}
		return "Added to Cart";
	}

	@Override
	public List<Cart> getCartByCid(Customer customer) {
		List<Cart> list = repo.getFoodidfromCid(customer.getCid());
		System.out.println(list);
		return list;
	}
	
	@Override
	public String updateQtyByid(String cartId, Integer qty) {
		// TODO Auto-generated method stu
		
		Optional<Cart> byId = repo.findById(Integer.parseInt(cartId));
		
		if(byId.isPresent())
		{
			Cart cart = byId.get();
			cart.setQty(qty);
			Cart save = repo.save(cart);
			return "Qty Updated with id :"+save.getCartid();
		}
		return "Invalid Cart Id";
	}
	@Override
	public String deleteById(Integer id) {
		Optional<Cart> findById = repo.findById(id);
		if(findById.isPresent())
		{
			repo.deleteById(id);
			return "deleted";
		}
		return "data not present";
		
	}
	
	@Override
	public long countByCid(Integer cid) {
		long countByCustomer_Cid = repo.countByCustomer_Cid(cid);
		return countByCustomer_Cid;
	}
	
	@Override
	public String deleteAllById(List<Integer> ids) {
		
		repo.deleteAllByIdInBatch(ids);
		return "deleted";
	}
	@Override
	public List<Integer> getCartIdByFoodId(Integer foodid) {
		List<Integer> cartIdFromFoodId = repo.getCartIdFromFoodId(foodid);
		return cartIdFromFoodId;
	}
}
