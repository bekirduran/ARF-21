package com.ARF21.pack.shop.service;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ARF21.pack.shop.entity.Category;
import com.ARF21.pack.shop.entity.Product;
import com.ARF21.pack.shop.repository.CategoryRepository;
import com.ARF21.pack.shop.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
    private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	 public Product getProductById(Long id){
		 Product pd = productRepository.findById(id)
	                .orElseThrow(() -> new EntityNotFoundException("not found"));
		 			return pd;
	    }
	 
	 public Category getCateById(Long id){
		 Category ct = categoryRepository.findById(id)
	                .orElseThrow(() -> new EntityNotFoundException("not found"));
		 			return ct;
	    }

	    
}
