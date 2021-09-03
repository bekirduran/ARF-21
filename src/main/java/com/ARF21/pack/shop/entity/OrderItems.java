package com.ARF21.pack.shop.entity;



import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class OrderItems extends BaseEntity {

	@JsonBackReference
    @ManyToOne(fetch = FetchType.EAGER, cascade= CascadeType.ALL)
    @JoinColumn(name = "orders_id")
    private Orders order;

    @ManyToOne(fetch = FetchType.EAGER, cascade= CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Product product;

    @NotNull @Min(value=0)
    private Long quantity;

    @NotNull @Min(value=0)
    private Double price;

    @ManyToOne(fetch = FetchType.EAGER, optional = false,cascade= CascadeType.ALL)
    @JoinColumn(name = "attribute_value_id")
    private AttributeValue attributeValue;




    public OrderItems() {
    	
    }

    public OrderItems(Orders order, Product product, Long quantity, Double price, AttributeValue attributeValue) {
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.attributeValue = attributeValue;
    }

    public OrderItems(Orders order, Product product, Long quantity, Double price) {
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
