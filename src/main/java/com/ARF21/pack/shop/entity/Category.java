package com.ARF21.pack.shop.entity;



import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.util.HashSet;
import java.util.Set;

@Entity

public class Category extends BaseEntity{

    @NotBlank
    @Size(max=20)
    private String categoryName;

    @NotBlank
    @Size(max=150)
    private String categoryDesc;
    
    private String image;

    @JsonManagedReference
    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Product> categoryProducts = new HashSet<>();

    public Category() {
    	
    }


    public Category(String categoryName, String categoryDesc,String image) {
        this.categoryName = categoryName;
        this.categoryDesc = categoryDesc;
        this.image=image;
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


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}
    
    
}
