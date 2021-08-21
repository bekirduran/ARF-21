package com.ARF21.pack.shop.repository;

import com.ARF21.pack.shop.entity.Orders;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrdersRepository extends JpaRepository<Orders,Long> {

}
