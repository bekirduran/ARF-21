package com.ARF21.pack.shop.entity;

import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@NoArgsConstructor

public class ProductSize extends BaseEntity{

    @ManyToOne(fetch = FetchType.LAZY, cascade= CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne(fetch = FetchType.LAZY,cascade=CascadeType.ALL)
    @JoinColumn(name = "size_id")
    private Size size;

    private Long amount;

    public ProductSize() {
    	
    }
    
    public ProductSize(Product product, Size size, Long amount) {
        this.product = product;
        this.size = size;
        this.amount = amount;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Long getAmount() {
        return amount;
    }

    public void setAmount(Long amount) {
        this.amount = amount;
    }
}
