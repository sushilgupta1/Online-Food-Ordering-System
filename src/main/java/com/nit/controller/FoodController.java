package com.nit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nit.model.Customer;
import com.nit.model.Food;
import com.nit.service.ICartService;
import com.nit.service.IFoodService;

import jakarta.servlet.http.HttpSession;

@Controller
public class FoodController {

	@Autowired
	private IFoodService service;
	@Autowired
	private ICartService cartService;
	@Autowired
	private HttpSession session;
	@GetMapping("/home")
	public String home(Map<String, Object>map)
	{
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
			{
				map.put("msg", "Session Expired!!!");
				return "redirect:login";
			}
		List<Food> allFood = service.getAllFood();
		map.put("allfood", allFood);
		long countByCid = cartService.countByCid(customer.getCid());
		map.put("count", countByCid);
		return "home";
	}
	
	@GetMapping("/getfood")
	public String getFood(@RequestParam("foodid")Integer foodid,
			Map<String,Object> map)
	{
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
			{
				map.put("msg", "Session Expired!!!");
				return "redirect:login";
			}
		Food food = service.getFoodById(foodid);
		map.put("food", food);
		long countByCid = cartService.countByCid(customer.getCid());
		map.put("count", countByCid);
		return "fooddetails";
	}
	@GetMapping("/category")
	public String getCategory(@RequestParam("type")String category,
			Map<String,Object>map)
	{
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
			{
				map.put("msg", "Session Expired!!!");
				return "redirect:login";
			}
		
		if(category.equalsIgnoreCase("All")||category.isBlank())return "redirect:home";
		List<Food> allFood = service.getFoodByCategory(category);
		map.put("allfood", allFood);
		long countByCid = cartService.countByCid(customer.getCid());
		map.put("count", countByCid);
		return "home";
	}
	
	@GetMapping("/search")
	public String searchFood(@RequestParam("value")String value,
			Map<String,Object>map)
	{
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
			{
				map.put("msg", "Session Expired!!!");
				return "redirect:login";
			}
		System.err.println(value);
		if(value.isBlank())return "redirect:home";
		List<Food> food = service.searchFood(value);
		map.put("allfood", food);
		long countByCid = cartService.countByCid(customer.getCid());
		map.put("count", countByCid);
		return "home";
	}
	@GetMapping("/aboutus")
	public String aboutus(RedirectAttributes rAttr,Map<String,Object>map)
	{
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
			{
			rAttr.addFlashAttribute("msg", "Session Expired!!!");
				return "redirect:login";
			}
		long countByCid = cartService.countByCid(customer.getCid());
		map.put("count", countByCid);
		return "aboutus";
	}
	
}
