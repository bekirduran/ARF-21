package com.ARF21.pack.shop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ARF21.pack.shop.entity.Application;

public interface ApplicationRepository extends JpaRepository<Application, Long> {

	List<Application> findByUsersId(Long id);
}
