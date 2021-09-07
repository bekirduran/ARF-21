package com.ARF21.pack.shop.entity;




import javax.persistence.*;
import javax.validation.constraints.NotNull;

import com.ARF21.pack.entity.Users;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity


public class Orders extends BaseEntity{

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private Users user;

    @NotNull
    private LocalDateTime orderDate;

    private String orderTotal;
    
    @JsonManagedReference
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<OrderItems> orderItems= new HashSet<>();

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
	public Set<OrderItems> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItems> orderItems) {
		this.orderItems = orderItems;
	}
    
    
}
