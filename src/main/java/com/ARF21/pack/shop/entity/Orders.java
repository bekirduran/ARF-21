package com.ARF21.pack.shop.entity;


import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.ARF21.pack.entity.Users;

import java.time.LocalDateTime;

@Entity

@NoArgsConstructor
public class Orders extends BaseEntity{

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private Users user;

    @NotNull
    private LocalDateTime orderDate;

    private String orderTotal;

    public Orders() {
    	
    }    
    public Orders(Users user, LocalDateTime orderDate, String orderTotal) {
        this.user = user;
        this.orderDate = orderDate;
        this.orderTotal = orderTotal;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(String orderTotal) {
        this.orderTotal = orderTotal;
    }
}
