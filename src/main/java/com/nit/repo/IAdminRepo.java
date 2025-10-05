package com.nit.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nit.model.Admin;

public interface IAdminRepo extends JpaRepository<Admin, Integer>{

	@Query("from Admin where emailid=:email and password=:password")
	public Optional<Admin> checkAdminLogin(String email,String password);
}
