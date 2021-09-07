package com.ARF21.pack.shop.repository;

import com.ARF21.pack.shop.entity.Product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product,Long> {

	List<Product> findByProductNameContaining(String productName);
}
