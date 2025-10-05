package com.nit.service;

import java.util.List;

import com.nit.model.Cart;
import com.nit.model.Customer;

public interface ICartService {

	public String addToCart(Integer foodid,Integer cid);
	
	public List<Cart> getCartByCid(Customer customer);
	
	public String updateQtyByid(String cartId,Integer qty);
	
	public String deleteById(Integer id);
	
	public long countByCid(Integer cid);
	
	public String deleteAllById(List<Integer> ids);
	
	public List<Integer> getCartIdByFoodId(Integer foodid);
}
