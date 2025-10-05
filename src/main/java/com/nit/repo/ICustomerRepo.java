package com.nit.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nit.model.Customer;

public interface ICustomerRepo extends JpaRepository<Customer, Integer>{

	@Query("from Customer where email=:email and password=:password")
	public Optional<Customer> login(String email,String password);
	
	public Optional<Customer> findByEmail(String email);
}
