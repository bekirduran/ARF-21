package com.ARF21.pack.shop.repository;

import com.ARF21.pack.shop.entity.OrderItems;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemsRepository extends JpaRepository<OrderItems,Long> {

}
