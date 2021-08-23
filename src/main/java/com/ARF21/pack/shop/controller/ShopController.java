package com.ARF21.pack.shop.controller;

import com.ARF21.pack.shop.controller.request.AttiRequest;
import com.ARF21.pack.shop.controller.request.Imagerequest;
import com.ARF21.pack.shop.entity.AttributeValue;
import com.ARF21.pack.shop.entity.Category;
import com.ARF21.pack.shop.entity.Product;
import com.ARF21.pack.shop.entity.ProductAttribute;
import com.ARF21.pack.shop.entity.ProductDto;
import com.ARF21.pack.shop.entity.ProductImage;
import com.ARF21.pack.shop.entity.Supplier;
import com.ARF21.pack.shop.repository.AttributevalueRepository;
import com.ARF21.pack.shop.repository.CategoryRepository;
import com.ARF21.pack.shop.repository.ProductAttributeRepository;
import com.ARF21.pack.shop.repository.ProductImagerepository;
import com.ARF21.pack.shop.repository.ProductRepository;
import com.ARF21.pack.shop.service.ProductService;
import com.ARF21.pack.shop.service.postmanservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.validation.Valid;

@RestController
@RequestMapping("/api/shop")
public class ShopController {

    @Autowired
    ProductRepository productRepository ;
    
    @Autowired
    ProductService productService;
    
    @Autowired
    CategoryRepository categoryRepository;
    
    @Autowired
    postmanservice Postmanservice;
    
    @Autowired
    ProductImagerepository productImagerepository;

    @Autowired
    ProductAttributeRepository attribute; 
    
    @Autowired
    AttributevalueRepository attributevalueRepository;
    
    @GetMapping("/all")
    public List<ProductDto> allAccess() {

        return productRepository.findAll().stream()
                .map(ProductDto::new)
                .toList();
    }
    
    @GetMapping("/item/{id}")
    public ProductDto findProductById(@PathVariable Long id){
        return productService.getProductById(id);
    }
    
    @GetMapping("/cata/{id}")
    public Category findCatatById(@PathVariable Long id){
        return productService.getCateById(id);
    }
    
    @GetMapping("/allcata")
    public List<Category> allcataAccess() {

        return categoryRepository.findAll();
    }
    
    @PostMapping("/savecata")
    public void postcata(@Valid @RequestBody Category request) {
    	Postmanservice.postcata(request);
    }
    
    @PostMapping("/savesup")
    public void postsup(@Valid @RequestBody Supplier request) {
    	Postmanservice.postsup(request);
    }
    
    @PostMapping("/saveimage")
    public void postimage(@Valid @RequestBody Imagerequest request) {
    	Product pd = productRepository.findById(request.getId())
                .orElseThrow(() -> new EntityNotFoundException("not found"));
    	ProductImage pimage=new ProductImage(request.getImageURL(),pd);
    	productImagerepository.save(pimage);
    	
    	
    }
    
    @PostMapping("/saveattirubete")
    public void postatti(@Valid @RequestBody ProductAttribute request) {
    	ProductAttribute pat=new ProductAttribute(request.getAttributeName());
    	attribute.save(pat);
    	
    	
    }
    
    @PostMapping("/saveattu")
    public void potpatti(@RequestBody AttiRequest request) {
    	System.out.print(request.getValue()+"    "+request.getId()+"    "+request.getIid());
    	ProductAttribute pa = attribute.findById(Long.valueOf(request.getIid()))
                .orElseThrow(() -> new EntityNotFoundException("not found"));
    	Product pd = productRepository.findById(request.getId())
                .orElseThrow(() -> new EntityNotFoundException("not found"));
    	
    	
    	
    	AttributeValue Av =new AttributeValue(request.getValue(), pd, pa);
    	attributevalueRepository.save(Av);
    	
    	
    }

}
