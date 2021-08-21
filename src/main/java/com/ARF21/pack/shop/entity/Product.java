package com.ARF21.pack.shop.entity;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonBackReference;

import java.util.HashSet;
import java.util.Set;


@Entity
@Getter
@Accessors(fluent = true)
@NoArgsConstructor
@ToString
public class Product extends BaseEntity {

    @NotBlank
    private String productName;

    
    private String productDesc;

    
    private Double productPrice;

    private String productImageURL;

    private Long productStock;

    @JsonBackReference
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;

    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "supplier_id")
    private Supplier supplier;

    
    @OneToMany(mappedBy = "size", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<ProductSize> sizes = new HashSet<>();
    
    


    public Product() {
    	
    }

    public Product(String productName, String productDesc, Double productPrice, String productImageURL, Long productStock, Category category, Supplier supplier, Set<ProductSize> sizes) {
        this.productName = productName;
        this.productDesc = productDesc;
        this.productPrice = productPrice;
        this.productImageURL = productImageURL;
        this.productStock = productStock;
        this.category = category;
        this.supplier = supplier;
        this.sizes = sizes;
    }

    
    
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImageURL() {
        return productImageURL;
    }

    public void setProductImageURL(String productImageURL) {
        this.productImageURL = productImageURL;
    }

    public Long getProductStock() {
        return productStock;
    }

    public void setProductStock(Long productStock) {
        this.productStock = productStock;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    /*public Set<ProductSize> getSizes() {
        return sizes;
    }*/

    /*public void setSizes(Set<ProductSize> sizes) {
        this.sizes = sizes;
    }*/
}
