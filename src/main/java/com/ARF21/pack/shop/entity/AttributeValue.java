package com.ARF21.pack.shop.entity;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class AttributeValue extends BaseEntity{

    private String value;
    private Long stock;
    
    @JsonBackReference
    @ManyToOne(fetch = FetchType.EAGER, optional = false,cascade= CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Product product;
    
    @JsonBackReference
    @ManyToOne(fetch = FetchType.EAGER, optional = false,cascade=CascadeType.ALL)
    @JoinColumn(name = "product_attribute_id")
    private ProductAttribute productAttribute;


    public AttributeValue() {
    }

    public AttributeValue(String value, Long stock, Product product, ProductAttribute productAttribute) {
        this.value = value;
        this.stock = stock;
        this.product = product;
        this.productAttribute = productAttribute;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Long getStock() {
        return stock;
    }

    public void setStock(Long stock) {
        this.stock = stock;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public ProductAttribute getProductAttribute() {
        return productAttribute;
    }

    public void setProductAttribute(ProductAttribute productAttribute) {
        this.productAttribute = productAttribute;
    }

	public AttributeValue(String value, Product product, ProductAttribute productAttribute) {
		this.value = value;
		this.product = product;
		this.productAttribute = productAttribute;
	}
    
    
}
