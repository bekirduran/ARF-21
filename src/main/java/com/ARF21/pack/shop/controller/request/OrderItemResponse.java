package com.ARF21.pack.shop.controller.request;

import com.ARF21.pack.shop.entity.OrderItems;
import lombok.ToString;

import javax.persistence.EntityNotFoundException;

@ToString
public class OrderItemResponse {

    private Long productId;
    private String title;
    private Long quantity;
    private double price;
    private String attribute;
    private String imageUrl;

    public OrderItemResponse() {
    }

    public OrderItemResponse(OrderItems orderItem) {
        this.productId = orderItem.getProduct().getId();
        this.title = orderItem.getProduct().getProductName();
        this.quantity = orderItem.getQuantity();
        this.price = orderItem.getProduct().productPrice();
        if(!( orderItem.getAttributeValue()==null))
            this.attribute = orderItem.getAttributeValue().getValue();
        if(orderItem.getProduct().getImages().stream().findFirst().isPresent())
            this.imageUrl = orderItem.getProduct().getImages().stream().findFirst().get().getImageURL();
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
