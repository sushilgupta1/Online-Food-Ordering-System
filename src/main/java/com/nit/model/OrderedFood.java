package com.nit.model;


import java.util.Base64;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
public class OrderedFood {
    @Id
	private Integer foodid;

    private String foodname;
    private String description;
    private Double discount;
    private Double price;
    private String category;

    @Lob
    private byte[] foodimage;

    public String getBase64() {
        if (foodimage != null) {
            return Base64.getEncoder().encodeToString(foodimage);
        }
        return null;
    }

	@Override
	public String toString() {
		return "OrderedFood [foodid=" + foodid + ", foodname=" + foodname + ", description=" + description
				+ ", discount=" + discount + ", price=" + price + ", category=" + category + "]";
	}
    
}

