package com.nit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nit.model.Cart;
import com.nit.model.Customer;
import com.nit.model.Food;
import com.nit.service.ICartService;
import com.nit.service.IFoodService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@Autowired
	private HttpSession session;
	@Autowired
	private ICartService service;
	
	@Autowired
	private IFoodService foodService;
	
	@GetMapping("/addcart")
	public String addCart(@RequestParam("foodid")Integer foodid,
			Map<String,Object>map)
	{
		Customer cus=(Customer)session.getAttribute("customer");
		if(cus==null)
			{
				map.put("msg", "Session Expired!!!");
				return "redirect:login";
			}
		
		String msg = service.addToCart(foodid, cus.getCid());
		System.out.println(msg);
		return "redirect:home";
	}
	
	@GetMapping("/cart")
	public String getCart(Map<String,Object>map,HttpServletRequest req)
	{
		
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
			{
				map.put("msg", "Session Expired!!!");
				return "redirect:login";
			}
		
		List<Cart> cartByCid = service.getCartByCid(customer);
		System.err.println(cartByCid);
		for(Cart c:cartByCid)
		{
			
			Set<Food> food = c.getFood();
			ArrayList<Food> list = new ArrayList<Food>(food);
			System.out.println(list);
			if(list.size()>0)
			{
				Food addOnlyImage = foodService.addOnlyImage(list.get(0));
				c.setFood(Set.of(addOnlyImage));	
				
				c.setCopyFood(addOnlyImage);
			}
			
		}

		map.put("cartdata", cartByCid);
		long countByCid = service.countByCid(customer.getCid());
		map.put("count", countByCid);
		req.setAttribute("count", countByCid);
		return "cart";
	}
	
	@PostMapping("/updatecart")
	public String cartUpdate(@RequestParam("cartid")String cartid,
							@RequestParam("qty")String qty,
							@RequestParam("update")String update,
							Map<String,Object>map)
	{
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
			{
				map.put("msg", "Session Expired!!!");
				return "redirect:login";
			}
		int quantity=0;
		if(update.equalsIgnoreCase("+"))
		{
			quantity=Integer.parseInt(qty)+1;
		}
		else if(update.equalsIgnoreCase("-"))
		{
			quantity=Integer.parseInt(qty)-1;
		}
		System.err.println(cartid+"     "+qty);
		String qtyByid = service.updateQtyByid(cartid, quantity);
		if(quantity==0)
		{
			String deleteById = service.deleteById(Integer.parseInt(cartid));
			System.out.println(deleteById);
			
		}
		System.out.println(qtyByid);
		return "redirect:cart";
	}
	@GetMapping("/remove")
	public String remove(@RequestParam("cartid")Integer cartid)
	{
		String deleteById = service.deleteById(cartid);
		System.out.println(deleteById);
		return "redirect:cart";
	}
}
