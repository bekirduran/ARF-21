package com.ARF21.pack.shop.controller.request;



import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.List;

@RequiredArgsConstructor
@ToString
public class OrderDto {

    private Long userid;
    private LocalDate orderDate;
    private String orderTotal;
    private List<OrderItemDto> orderItems;


    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderTotal() {
        return orderTotal;
    }

    public List<OrderItemDto> getOrderItems() {
        return orderItems;
    }

    public void setOrderTotal(String orderTotal) {
        this.orderTotal = orderTotal;
    }












}