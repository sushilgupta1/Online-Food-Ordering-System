package com.nit.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nit.model.Admin;
import com.nit.model.Customer;
import com.nit.model.Food;
import com.nit.model.Order;
import com.nit.model.OrderItem;
import com.nit.model.OrderedFood;
import com.nit.service.IAdminService;
import com.nit.service.ICartService;
import com.nit.service.ICustomerService;
import com.nit.service.IFoodService;
import com.nit.service.IOrderService;
import com.nit.service.IOrderedFoodService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
@MultipartConfig
public class AdminController {

	@Autowired
	private IAdminService adminService;
	@Autowired
	private IFoodService service;
	@Autowired
	private ICustomerService cusService;
  
	@Autowired
	private IOrderService orderService;

	@Autowired
	private HttpSession session;

	@Autowired
	private IOrderedFoodService orderedFoodService;

	@Autowired
	private ICartService cartService;

	
	@GetMapping("/add")
	public String addProduct(@ModelAttribute Food food, RedirectAttributes rAttr) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		
		System.out.println("AdminController.addProduct()");
		return "addproduct";
	}

	@PostMapping("/add")
	public String add(HttpServletRequest req, Map<String, String> map, RedirectAttributes rAttr)
			throws IOException, ServletException {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		

		Food food = new Food();
		OrderedFood orderedFood=new OrderedFood();
		food.setFoodname(req.getParameter("foodname"));
		food.setDescription(" " + req.getParameter("description"));
		food.setDiscount(Double.parseDouble(req.getParameter("discount")));
		food.setPrice(Double.parseDouble(req.getParameter("price")));
		food.setFoodimage(req.getPart("foodimage").getInputStream().readAllBytes());
		food.setCategory(" " + req.getParameter("category"));
		
		 Integer foodId = service.addFood(food);
		Food foodById = service.getFoodById(foodId);
		BeanUtils.copyProperties(foodById, orderedFood);
		String msg = orderedFoodService.addFood(orderedFood);
		rAttr.addFlashAttribute("msg", msg);
		return "redirect:add";
	}

	@GetMapping("/adminlogin")
	public String adminLogin(@ModelAttribute("admin") Admin admin) {
		System.out.println("AdminController.adminLogin()");
		return "adminlogin";
	}

	@PostMapping("/adminlogin")
	public String adminLogin(@ModelAttribute("admin") Admin admin, Map<String, Object> map) {
		Admin login = adminService.login(admin.getEmailid(), admin.getPassword());
		if (login != null) {
			Double price = adminService.getSelling();
			login.setTotalselling(price);
			session.setAttribute("admin", login);

			return "adminhome";
		}

		map.put("msg", "invalid Username or Password");
		return "adminlogin";
	}

	@GetMapping("/adminhome")
	public String adminhome(RedirectAttributes rAttr) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		return "adminhome";
	}

	@GetMapping("/addfooditem")
	public String addFood(RedirectAttributes rAttr) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		return "addproduct";
	}

	@GetMapping("/getallfood")
	public String getAllFood(Map<String, Object> map, RedirectAttributes rAttr) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		System.err.println("*******************************");
		System.err.println(admin);
		System.err.println("*******************************");

		List<Food> allFood = service.getAllFood();
		for (Food food : allFood) {
			food = service.addOnlyImage(food);

		}
		map.put("foodItems", allFood);
		return "adminviewallfood";
	}

	@GetMapping("/allcustomers")
	public String allCustomer(Map<String, Object> map, RedirectAttributes rAttr) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		List<Customer> list = cusService.getAllCustomer();
		map.put("cust", list);
		return "custdata";
	}

	@GetMapping("/allorders")
	public String allOrder(Map<String, Object> map, RedirectAttributes rAttr) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		List<Order> list = orderService.getAllOrder();
		CopyOnWriteArrayList<Order> cal = new CopyOnWriteArrayList<Order>(list);
		for (Order order : cal) {
			List<OrderItem> orderItems = order.getOrderItems();
			CopyOnWriteArrayList<OrderItem> calOrderItems = new CopyOnWriteArrayList<OrderItem>(orderItems);
			for (OrderItem item : calOrderItems) {
				OrderedFood food = item.getFood();
				food = orderedFoodService.addOnlyImage(food);
				orderService.setOrderStatus(item.getOrder());
			}

		}
		map.put("order", list);
		return "allorder";
	}

	@GetMapping("/customerorder")
	public String orderByCustomer(@RequestParam("cid") Integer cid, Map<String, Object> map, RedirectAttributes rAttr) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		List<Order> list = orderService.getOrderByCustomerId(cid);
		CopyOnWriteArrayList<Order> cal = new CopyOnWriteArrayList<Order>(list);

		for (Order order : cal) {
			List<OrderItem> orderItems = order.getOrderItems();
			CopyOnWriteArrayList<OrderItem> calOrderItems = new CopyOnWriteArrayList<OrderItem>(orderItems);

			for (OrderItem item : calOrderItems) {
				OrderedFood food = item.getFood();
				food = orderedFoodService.addOnlyImage(food);
				orderService.setOrderStatus(item.getOrder());
			}

		}
		map.put("order", list);
		return "orderbycustomer";
	}

	@GetMapping("/manage")
	public String manageItem(Map<String, Object> map, RedirectAttributes rAttr) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		System.err.println("*******************************");
		System.err.println(admin);
		System.err.println("*******************************");

		List<Food> allFood = service.getAllFood();
		for (Food food : allFood) {
			food = service.addOnlyImage(food);
		}
		Collections.sort(allFood,(food1,food2)->food1.getFoodid()-food2.getFoodid());
		map.put("foodItems", allFood);
		return "manageitem";
	}

	@GetMapping("/delete")
	public String deleteFood(@RequestParam("foodid") Integer foodid, RedirectAttributes rAttr) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		List<Integer> cartIdByFoodId = cartService.getCartIdByFoodId(foodid);
		String deleteAllById = cartService.deleteAllById(cartIdByFoodId);
		System.out.println(deleteAllById);
		String deleteById = service.deleteById(foodid);
		rAttr.addFlashAttribute("msg", deleteById);
		System.out.println(deleteById);
		return "redirect:manage";
	}

	@GetMapping("/edit")
	public String editFood(@ModelAttribute("food") Food food, @RequestParam("foodid") Integer foodid,
			RedirectAttributes rAttr) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		Food foodById = service.getFoodById(foodid);
		BeanUtils.copyProperties(foodById, food);
		return "updateitem";
	}

	@PostMapping("/edit")
	public String editFood(@ModelAttribute("food") Food food, Map<String, Object> map, RedirectAttributes rAttr) {
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin == null) {
			rAttr.addFlashAttribute("msg", "Session Expired");
			return "redirect:adminlogin";
		}
		Double price = adminService.getSelling();
		admin.setTotalselling(price);
		Integer addFood = service.addFood(food);
		System.out.println(addFood+" is Updated");
		System.out.println(food);
		return "redirect:manage";
	}

}
