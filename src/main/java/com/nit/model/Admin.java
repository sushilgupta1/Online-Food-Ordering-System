package com.nit.model;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Entity
@Data
public class Admin implements Serializable{

	@Id
	@SequenceGenerator(name = "ADMIN_SEQ",allocationSize = 1,initialValue = 100)
	@GeneratedValue(generator = "ADMIN_SEQ",strategy = GenerationType.SEQUENCE)
	private int adminid;
	private String name;
	private String emailid;
	private String password;
	transient double totalselling;
}
