package com.nit.service;

import com.nit.model.Admin;

public interface IAdminService {

	public Admin login(String email,String password);
	
	public Double getSelling();
}
