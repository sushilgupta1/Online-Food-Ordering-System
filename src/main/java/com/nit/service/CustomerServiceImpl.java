package com.nit.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nit.model.Customer;
import com.nit.repo.ICustomerRepo;
@Service
public class CustomerServiceImpl implements ICustomerService {

	@Autowired
	private ICustomerRepo repo;
	@Autowired
	private IOrderService orderService;
	
	@Override
	public Customer doLogin(String username, String password) {
		Optional<Customer> login = repo.login(username, password);
		if(login.isPresent())
		return login.get();
		return null;
	}

	@Override
	public String register(Customer customer) {
		Customer save = repo.save(customer);
		return "Customer saved with id: "+save.getCid();
	}
	@Override
	public Optional<Customer> checkExistance(Customer customer)
	{
		return repo.findByEmail(customer.getEmail());
		
	}
	
	@Override
	public List<Customer> getAllCustomer() {
		List<Customer> findAll = repo.findAll();
		for(Customer c:findAll)
		{
			int countByCid = orderService.getOrderByCustomerId(c.getCid()).size();
			c.setTotalorder(countByCid);
		}
		return findAll;
	}
}
