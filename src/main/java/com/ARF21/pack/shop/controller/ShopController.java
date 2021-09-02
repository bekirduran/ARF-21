package com.ARF21.pack.shop.controller;


import com.ARF21.pack.shop.controller.request.AttiRequest;
import com.ARF21.pack.shop.controller.request.Imagerequest;
import com.ARF21.pack.shop.controller.request.OrderDto;
import com.ARF21.pack.shop.entity.Category;
import com.ARF21.pack.shop.entity.Company;
import com.ARF21.pack.shop.entity.ProductAttribute;
import com.ARF21.pack.shop.entity.ProductDto;
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
    public ResponseEntity<String> postcategory(@Valid @RequestBody Category request) {
    	postmanservice.postcata(request);
    	return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    }
    
    @PostMapping("/savesupplier")
    public ResponseEntity<String> postsupplier(@Valid @RequestBody Supplier request) {
    	postmanservice.postsup(request);
    	return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    }
    
    @PostMapping("/saveimage")
    public ResponseEntity<String> postimage(@Valid @RequestBody Imagerequest request) {
    	postmanservice.postimage(request);
    	return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    	
    	
    }
    
    @PostMapping("/saveattribute")
    public ResponseEntity<String> postatti(@Valid @RequestBody ProductAttribute request) {
    	postmanservice.postatti(request);
    	return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    	
    }
    
    @PostMapping("/saveproductattribute")
    public ResponseEntity<String> postproductAttribute(@RequestBody AttiRequest request) {
    	postmanservice.postproductAttribute(request);
    	return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    
    }
    
    @PostMapping("/saveproduct")
    public ResponseEntity<String> postproduct(@RequestBody ProductDto request) {
    	productService.create(request);
    	return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    }
    
    
    @GetMapping("/searchcategory")
    public ResponseEntity<String> getCate(@RequestParam String name) {
       postmanservice.getCate(name);
       return ResponseEntity.status(HttpStatus.OK).body("HTTP Status will be Success (CODE 200)\n");
    }
    
    @GetMapping("/searchproduct")
    public ResponseEntity<String> getProduct(@RequestParam String name) {
       postmanservice.getProduct(name);
       return ResponseEntity.status(HttpStatus.OK).body("HTTP Status will be Success (CODE 200)\n");
    }
    
  //@Transactional
    @PostMapping("/saveorder")
    public ResponseEntity<String> postorder( @RequestBody OrderDto request) {
       postmanservice.postorder(request);
       return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");

    }

    @GetMapping("/getorders/{id}")
    public ResponseEntity<String> getOrdersOfUser( @PathVariable Long id) {
        postmanservice.getOrdersOfUser(id);
        return ResponseEntity.status(HttpStatus.OK).body("HTTP Status will be Success (CODE 200)\n");
    }
    
    @GetMapping("/searchcompany/{id}")
    public ResponseEntity<String> getCompany(@PathVariable Long id) {
	       postmanservice.getCompany(id);
	       return ResponseEntity.status(HttpStatus.OK).body("HTTP Status will be Success (CODE 200)\n");
	    } 
    
    @GetMapping("/searchcompany")
    public ResponseEntity<String> getCompanyall() {
	       postmanservice.getCompanyall();
	       return ResponseEntity.status(HttpStatus.OK).body("HTTP Status will be Success (CODE 200)\n");
	    } 
    
    
    @PostMapping("/savecompany")
    public ResponseEntity<String> postcompany(@RequestBody Company request) {
    	postmanservice.comppush(request);
    	return ResponseEntity.status(HttpStatus.CREATED).body("HTTP Status will be CREATED (CODE 201)\n");
    }

}
