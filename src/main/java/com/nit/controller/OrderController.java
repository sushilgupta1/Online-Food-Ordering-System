package com.nit.controller;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nit.model.Cart;
import com.nit.model.Customer;
import com.nit.model.Food;
import com.nit.model.Order;
import com.nit.model.OrderItem;
import com.nit.model.OrderedFood;
import com.nit.service.ICartService;
import com.nit.service.IFoodService;
import com.nit.service.IOrderService;
import com.nit.service.IOrderedFoodService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

	@Autowired
	private IOrderService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private ICartService cartService;
	@Autowired
	private IFoodService foodService;
	@Autowired
	private IOrderedFoodService orderedFoodService;
	
	
	@GetMapping("/checkout")
	public String checkout(@ModelAttribute("order") Order order,
			Map<String, Object>map,HttpServletRequest req)
	{
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
			{
				map.put("msg", "Session Expired!!!");
				return "redirect:login";
			}
		
		List<Cart> cartByCid = cartService.getCartByCid(customer);
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
		map.put("fooddata", cartByCid);
		long countByCid = cartService.countByCid(customer.getCid());
		map.put("count", countByCid);
		req.setAttribute("count", countByCid);
		return "checkout";
	}
	
	@PostMapping("/confirmorder")
	public String confirmOrder(@ModelAttribute Order order,
								@RequestParam("paymentMode")String paymentMode,
								Map<String,Object>map)
	{
		
		
		Customer customer = (Customer) session.getAttribute("customer");
	    if (customer == null) {
	        map.put("msg", "Session Expired!!!");
	        return "redirect:login";
	    }
	    
	    List<Cart> cartByCid = cartService.getCartByCid(customer);
	    System.err.println("*************************************************");
		System.err.println(cartByCid);
		System.err.println("*************************************************");

	    List<OrderItem> orderItems = new ArrayList<>();
	    for (Cart cartItem : cartByCid) {
	        List<Food> foodList = new ArrayList<>(cartItem.getFood());
	        if (!foodList.isEmpty()) {
	            OrderItem orderItem = new OrderItem();
	            orderItem.setOrder(order);
	            
	            OrderedFood of = new OrderedFood();
	            BeanUtils.copyProperties(foodList.get(0), of);
	            System.err.println("**************************************");
	            System.out.println(foodList.get(0));
	            System.out.println(of);
	            System.err.println("**************************************");
	            if (of != null) {
	                orderItem.setFood(of);
	            } 
	            
	            orderItem.setQuantity(cartItem.getQty());
	            orderItem.setPrice(cartItem.getPrice());
	            orderItems.add(orderItem);
	        } 
	    }

	    
	    order.setOrderItems(orderItems);
	    order.setPaymentmode(paymentMode);
	    order.setCustomer(customer);
	    order.setOrderDate(LocalDateTime.now());
	    order.setStatus("Order Placed");
	    order.setPaymentstatus("Pending");
	    service.SaveOrder(order);
	    
	    List<Integer> cartIds = cartByCid.stream().map(Cart::getCartid).collect(Collectors.toList());
	    String deleteAllById = cartService.deleteAllById(cartIds);
	    System.out.println(deleteAllById);
	    
	    return "redirect:home";
		
	}
	
	
	@GetMapping("/order")
	public String order(Map<String,Object>map)
	{
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
			{
				map.put("msg", "Session Expired!!!");
				return "redirect:login";
			}
		
		List<Order> orderByCustomerId = service.getOrderByCustomerId(customer.getCid());
		for(Order order:orderByCustomerId)
		{
			List<OrderItem> orderItems = order.getOrderItems();
			for(OrderItem item:orderItems)
			{
				OrderedFood food = item.getFood();
				food = orderedFoodService.addOnlyImage(food);
			}
			String setOrderStatus = service.setOrderStatus(order);
			System.out.println(setOrderStatus);
			
		}
		orderByCustomerId=orderByCustomerId.stream().sorted(Comparator.comparing(Order::getOrderid).reversed()).collect(Collectors.toList());
		map.put("order", orderByCustomerId);
		long countByCid = cartService.countByCid(customer.getCid());
		map.put("count", countByCid);
		return "odor";
	}
	@GetMapping("/cancel")
	public String cancelOrder(@RequestParam("orderid")Integer orderId,
			Map<String,Object>map,RedirectAttributes rAttr)
	{
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
			{
				map.put("msg", "Session Expired!!!");
				return "redirect:login";
			}
		Order orderById = service.getOrderById(orderId);
		Duration between = Duration.between(orderById.getOrderDate(), LocalDateTime.now());
		if(between.toMinutes()<20&&!orderById.getStatus().equalsIgnoreCase("cancelled"))
		{
			orderById.setStatus("Cancelled");
			orderById.setPaymentstatus("Not Applicable");
			
			String saveOrder = service.SaveOrder(orderById);
			System.out.println("Order Cancelled :"+saveOrder);
			rAttr.addFlashAttribute("error", "Orderid: "+orderId+" is Cancelled ");
		}
		else if(orderById.getStatus().equalsIgnoreCase("cancelled"))
		{
			rAttr.addFlashAttribute("error", "Orderid: "+orderId+" is already Cancelled");
		}
		else
		{
			
			rAttr.addFlashAttribute("error", "Orderid: "+orderId+" is already delivered, So it can't be Cancel");
		}
		return "redirect:order";
	}
	@GetMapping("/invoice")
	public String ordersummary(Map<String,Object>map,
			@RequestParam("orderid")Integer orderId)
	{
		Customer customer=(Customer)session.getAttribute("customer");
		if(customer==null)
			{
				map.put("msg", "Session Expired!!!");
				return "redirect:login";
			}
		Order orderById = service.getOrderById(orderId);
		List<OrderItem> orderItems = orderById.getOrderItems();
		for(OrderItem item:orderItems)
		{
			OrderedFood food = item.getFood();
			food=orderedFoodService.addOnlyImage(food);
			item.setFood(food);
		}
		map.put("item", orderById);
		long countByCid = cartService.countByCid(customer.getCid());
		map.put("count", countByCid);
		return "ordersummary";
	}
}
