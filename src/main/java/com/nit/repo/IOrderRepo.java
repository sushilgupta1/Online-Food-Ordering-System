package com.nit.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nit.model.Order;

public interface IOrderRepo extends JpaRepository<Order, Integer>{

	public List<Order> findByCustomer_cid(Integer cid);
}
