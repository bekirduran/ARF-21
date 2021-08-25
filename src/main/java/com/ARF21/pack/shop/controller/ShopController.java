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
import com.ARF21.pack.shop.repository.AttributeValueRepository;
import com.ARF21.pack.shop.repository.CategoryRepository;
import com.ARF21.pack.shop.repository.ProductAttributeRepository;
import com.ARF21.pack.shop.repository.ProductImagerepository;
import com.ARF21.pack.shop.repository.ProductRepository;
import com.ARF21.pack.shop.service.ProductService;
import com.ARF21.pack.shop.service.PostmanService;

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
    PostmanService Postmanservice;
    
    @Autowired
    ProductImagerepository productImagerepository;

    @Autowired
    ProductAttributeRepository productAttributeRepository;
    
    @Autowired
    AttributeValueRepository attributeValueRepository;
    
    @GetMapping("/all")
    public List<ProductDto> allAccess() {

        return productRepository.findAll().stream()
                .map(ProductDto::new)
                .toList();
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

        return categoryRepository.findAll();
    }
    
    @PostMapping("/savecategory")
    public void postcategory(@Valid @RequestBody Category request) {
    	Postmanservice.postcata(request);
    }
    
    @PostMapping("/savesupplier")
    public void postsupplier(@Valid @RequestBody Supplier request) {
    	Postmanservice.postsup(request);
    }
    
    @PostMapping("/saveimage")
    public void postimage(@Valid @RequestBody Imagerequest request) {
    	Product pd = productRepository.findById(request.getId())
                .orElseThrow(() -> new EntityNotFoundException("not found"));
    	ProductImage pimage=new ProductImage(request.getImageURL(),pd);
    	productImagerepository.save(pimage);
    	
    	
    }
    
    @PostMapping("/saveattribute")
    public void postatti(@Valid @RequestBody ProductAttribute request) {
    	ProductAttribute pat=new ProductAttribute(request.getAttributeName());
    	productAttributeRepository.save(pat);
    	
    	
    }
    
    @PostMapping("/saveproductattribute")
    public void postproductAttribute(@RequestBody AttiRequest request) {
    	System.out.println(request.getValue()+"**"+request.getProductId()+"**"+request.getAttributeId());

        Product pd = productRepository.findById(request.getProductId())
                .orElseThrow(() -> new EntityNotFoundException("product not found"));

    	ProductAttribute pa = productAttributeRepository.findById(request.getAttributeId())
                .orElseThrow(() -> new EntityNotFoundException("product attribute not found"));

    	AttributeValue av =new AttributeValue(request.getValue(), pd, pa);
    	attributeValueRepository.save(av);
    	
    	
    }
    
    @PostMapping("/saveproduct")
    public void postproduct(@RequestBody ProductDto request) {
    	productService.create(request);
    }

}
