package com.ARF21.pack.shop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ARF21.pack.shop.entity.AttributeValue;

import java.util.Optional;

public interface AttributeValueRepository extends JpaRepository<AttributeValue, Long> {

    Optional<AttributeValue> findByValueAndProductId(String name, Long productId);

}
