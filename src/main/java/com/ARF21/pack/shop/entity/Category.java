package com.ARF21.pack.shop.entity;

import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.HashSet;
import java.util.Set;

@Entity
@NoArgsConstructor
public class Category extends BaseEntity{

    @NotBlank
    @Size(max=20)
    private String categoryName;

    @NotBlank
    @Size(max=150)
    private String categoryDesc;

    @JsonManagedReference
    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Product> categoryProducts = new HashSet<>();

    public Category() {
    	
    }
    
    public Category(String categoryName, String categoryDesc, Set<Product> categoryProducts) {
        this.categoryName = categoryName;
        this.categoryDesc = categoryDesc;
        this.categoryProducts = categoryProducts;
    }

    public Category(String categoryName, String categoryDesc) {
        this.categoryName = categoryName;
        this.categoryDesc = categoryDesc;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryDesc() {
        return categoryDesc;
    }

    public void setCategoryDesc(String categoryDesc) {
        this.categoryDesc = categoryDesc;
    }

    public Set<Product> getCategoryProducts() {
        return categoryProducts;
    }

    public void setCategoryProducts(Set<Product> categoryProducts) {
        this.categoryProducts = categoryProducts;
    }
}