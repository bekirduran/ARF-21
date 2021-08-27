package com.ARF21.pack.shop.controller.request;

import lombok.ToString;

@ToString
public class OrderItemDto {

    private Long productId;
    private Long quantity;

    public OrderItemDto(Long productId, Long quantity) {
        this.productId = productId;
        this.quantity = quantity;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }
}
