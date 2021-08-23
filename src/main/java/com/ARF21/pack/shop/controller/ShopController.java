package com.ARF21.pack.shop.controller;

import com.ARF21.pack.shop.entity.Category;
import com.ARF21.pack.shop.entity.Product;
import com.ARF21.pack.shop.entity.ProductDto;
import com.ARF21.pack.shop.repository.CategoryRepository;
import com.ARF21.pack.shop.repository.ProductRepository;
import com.ARF21.pack.shop.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/shop")
public class ShopController {

    @Autowired
    ProductRepository productRepository ;
    
    @Autowired
    ProductService productService;
    
    @Autowired
    CategoryRepository categoryRepository;

    @GetMapping("/all")
    public List<ProductDto> allAccess() {

        return productRepository.findAll().stream()
                .map(ProductDto::new)
                .toList();
    }
    
    @GetMapping("/item/{id}")
    public Product findProductById(@PathVariable Long id){
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

}
