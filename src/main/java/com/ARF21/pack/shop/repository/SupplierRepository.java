package com.ARF21.pack.shop.repository;

import com.ARF21.pack.shop.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SupplierRepository extends JpaRepository<Product,Long> {

}