package com.nit.service;

import java.util.List;
import java.util.Optional;

import com.nit.model.Customer;

public interface ICustomerService {

	public Customer doLogin(String username,String password);
	public String register(Customer customer);
	
	public List<Customer> getAllCustomer();
	public Optional<Customer> checkExistance(Customer customer);
}
