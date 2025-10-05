package com.nit.repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nit.model.Cart;
import com.nit.model.Customer;

public interface ICartRepo extends JpaRepository<Cart, Integer>{

	//@Query(value = "select * from cart where CUSTOMER_CID=:cid and FOOD_FOODID=:foodid",nativeQuery = true)
	//@Query("FROM Cart c JOIN c.foodItems f WHERE c.customer.cid = :cid AND f.foodid = :foodid")
	//@Query(value = "SELECT * FROM CART AS f JOIN CART_FOOD AS cf ON f.CART_ID = cf.CART_ID WHERE f.CUSTOMER_CID =:cid AND cf.FOOD_ID = :foodid",nativeQuery = true)
	//@Query("SELECT c FROM Cart c JOIN c.foodItems f WHERE c.customer.cid = :cid AND f.foodid = :foodid")
	//public Optional<Cart> findByCustomerCidAndFoodFoodid(Integer cid,Integer foodid);
	Optional<Cart> findByCustomer_CidAndFood_Foodid(Integer cid, Integer foodid);
	
	public long countByCustomer_Cid(Integer cid);
	@Query("FROM Cart c WHERE c.customer.cid = :customerId")
	public List<Cart> getFoodidfromCid(Integer customerId); 
	
	@Query(value = "select cartid from cart_food where foodid=:foodid",nativeQuery = true)
	public List<Integer> getCartIdFromFoodId(Integer foodid);
	
}
