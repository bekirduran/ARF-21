package com.ARF21.pack.shop.controller;


import com.ARF21.pack.shop.controller.request.ApplicationDto;
import com.ARF21.pack.shop.controller.request.AttiRequest;
import com.ARF21.pack.shop.controller.request.Imagerequest;
import com.ARF21.pack.shop.controller.request.OrderDto;
import com.ARF21.pack.shop.controller.request.OrderResponse;
import com.ARF21.pack.shop.entity.Application;
import com.ARF21.pack.shop.entity.Category;
import com.ARF21.pack.shop.entity.Company;
import com.ARF21.pack.shop.entity.Orders;
import com.ARF21.pack.shop.entity.Product;
import com.ARF21.pack.shop.entity.ProductAttribute;
import com.ARF21.pack.shop.entity.ProductDto;
import com.ARF21.pack.shop.entity.ProductImage;
import com.ARF21.pack.shop.entity.Supplier;
import com.ARF21.pack.shop.service.ProductService;
import com.ARF21.pack.shop.service.PostmanService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/shop")
public class ShopController {

    
    @Autowired
    ProductService productService;
    
    
    @Autowired
    PostmanService postmanservice;
    
    
    @GetMapping("/all")
    public List<ProductDto> allAccess() {

        return postmanservice.allAccess();
    }
    
    @GetMapping("/item/{id}")
    public ProductDto getProductById(@PathVariable Long id){
        return productService.getProductById(id);
    }
    
    @GetMapping("/category/{id}")
    public Category getCategorytById(@PathVariable Long id){
        return productService.getCateById(id);
    }
    
    @GetMapping("/allcategories")
    public List<Category> getAllCategories() {

        return postmanservice.getAllCategories();
    }
    
    @PostMapping("/savecategory")
    public ResponseEntity<?> postcategory(@Valid @RequestBody Category request) {
    	
    	return postmanservice.postcata(request);
    }
    
    @PostMapping("/savesupplier")
    public ResponseEntity<?> postsupplier(@Valid @RequestBody Supplier request) {
    	
    	return postmanservice.postsup(request);
    }
    
    @PostMapping("/saveimage")
    public ProductImage postimage(@Valid @RequestBody Imagerequest request) {
    	
    	return postmanservice.postimage(request);
    	
    	
    }
    
    @PostMapping("/saveattribute")
    public ResponseEntity<?> postatti(@Valid @RequestBody ProductAttribute request) {
    	postmanservice.postatti(request);
    	return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    	
    }
    
    @PostMapping("/saveproductattribute")
    public ResponseEntity<?> postproductAttribute(@RequestBody AttiRequest request) {
    	postmanservice.postproductAttribute(request);
    	return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    
    }
    
    @PostMapping("/saveproduct")
    public ResponseEntity<?> postproduct(@RequestBody ProductDto request) {
    	productService.create(request);
    	return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    }
    
    
    @GetMapping("/searchcategory")
    public List<Category> getCate(@RequestParam String name) {
       
       return postmanservice.getCate(name);
    }
    
    @GetMapping("/searchproduct")
    public List<Product> getProduct(@RequestParam String name) {
       
       return postmanservice.getProduct(name);
    }
    
  //@Transactional
    @PostMapping("/saveorder")
    public ResponseEntity<?> postorder( @RequestBody OrderDto request) {
       postmanservice.postorder(request);
       return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");

    }

    @GetMapping("/getorders/{id}")
    public List<OrderResponse> getOrdersOfUser(@PathVariable Long id) {
        
        return postmanservice.getOrdersOfUser(id);
    }
    
    @GetMapping("/searchcompany/{id}")
    public Optional<Company> getCompany(@PathVariable Long id) {
	       
	       return postmanservice.getCompany(id);
	    } 
    
    @GetMapping("/searchcompany")
    public List<Company> getCompanyall() {
	       
	       return postmanservice.getCompanyall();
	    } 
    
    
    @PostMapping("/savecompany")
    public ResponseEntity<?> postcompany(@RequestBody Company request) {
    	postmanservice.comppush(request);
    	return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    }
    
    @PostMapping("/postapplication")
    public ResponseEntity<?> postapplication(@RequestBody ApplicationDto request) {
       
        
       postmanservice.postapplication(request);
       return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    }
    
    @GetMapping("/getapplication/{id}")
    public List<String> getapplication(@PathVariable Long id) {
	       
	       return postmanservice.getapplication(id);
	    } 
    

}
