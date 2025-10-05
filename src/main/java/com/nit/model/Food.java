package com.nit.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.SequenceGenerator;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
public class Food implements Serializable {

    @Id
    @SequenceGenerator(name = "FOOD_SEQ", initialValue = 100, allocationSize = 1)
    @GeneratedValue(generator = "FOOD_SEQ", strategy = GenerationType.SEQUENCE)
    private Integer foodid;
    private String foodname;
    private String description;
    private Double discount;
    private Double price;
    private String category;
    @Lob
    private byte[] foodimage;

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "food",targetEntity = Cart.class) 
    private Set<Cart> cart=new HashSet<Cart>();

    transient private String base64;

	@Override
	public String toString() {
		return "Food [foodid=" + foodid + ", foodname=" + foodname + ", description=" + description + ", discount="
				+ discount + ", price=" + price + ", category=" + category + "Bse64: "+base64+"]";
	}

	
    
}
