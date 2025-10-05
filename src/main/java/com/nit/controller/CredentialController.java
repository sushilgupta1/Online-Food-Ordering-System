package com.nit.controller;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nit.model.Customer;
import com.nit.service.ICustomerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CredentialController {

	@Autowired
	private ICustomerService service;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping({"/","/login"})
	public String login()
	{
		return "login";
	}
	@GetMapping("/register")
	public String register(@ModelAttribute Customer customer)
	{
		return "register";
	}
	
	@PostMapping("/login")
	public String loginChecker(@RequestParam("username")String username,
			@RequestParam("password")String password,
			Map<String,String>map)
	{
		Customer login = service.doLogin(username, password);
		if(login!=null)
		{
			session.setAttribute("customer", login);
			session.setAttribute("name", login.getFirstname());
			return "redirect:home";
		}
		map.put("msg", "Invalid Login Id or Password");
		return "login";
	}
	
	@PostMapping("/register")
	public String doRegister(@ModelAttribute Customer customer,
			Map<String,String>map,RedirectAttributes rAttr)
	{
		Optional<Customer> existance = service.checkExistance(customer);
		if(existance.isPresent())
		{
			rAttr.addFlashAttribute("msg", "Email is already exist");
			return "redirect:login";
		}
		String register = service.register(customer);
		map.put("success", "Registration Successfull");
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout()
	{
		session.invalidate();
		return "login";
	}
}
