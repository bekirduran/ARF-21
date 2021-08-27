package com.ARF21.pack.shop.service;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.ARF21.pack.response.MessageResponse;
import com.ARF21.pack.shop.entity.Category;
import com.ARF21.pack.shop.entity.Supplier;
import com.ARF21.pack.shop.repository.CategoryRepository;
import com.ARF21.pack.shop.repository.OrderItemsRepository;
import com.ARF21.pack.shop.repository.OrdersRepository;
import com.ARF21.pack.shop.repository.ProductRepository;
import com.ARF21.pack.shop.repository.SupplierRepository;

@Service
public class PostmanService {

	@Autowired
	CategoryRepository categoryRepository;
	
	@Autowired
	OrdersRepository ordersRepository;
	
	@Autowired
	OrderItemsRepository orderItemsRepository;
	
	@Autowired
	ProductRepository productRepository;
	
	
	@Autowired
	SupplierRepository supplierRepository;
	
	
	public ResponseEntity<?> postcata(@Valid @RequestBody Category request ){
		Category cata =new Category(request.getCategoryName(),
				request.getCategoryDesc(),request.getImage());
		categoryRepository.save(cata);
		return ResponseEntity.ok(new MessageResponse("category save success!"));
		
	}
	
	public ResponseEntity<?> postsup(@Valid @RequestBody Supplier request ){
		Supplier sup =new Supplier(request.getCompanyName());
		supplierRepository.save(sup);
		return ResponseEntity.ok(new MessageResponse("category save success!"));
		
	}
	
	
	
}
