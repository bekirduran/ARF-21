package com.ARF21.pack.shop.repository;

import com.ARF21.pack.shop.entity.Category;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


public interface CategoryRepository extends JpaRepository<Category,Long> {

	
	List<Category> findByCategoryNameContaining(String categoryName);

	
	
}