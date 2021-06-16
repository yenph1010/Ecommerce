package com.example.demo.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.ProductEntity;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, Integer> {
	public ProductEntity findById(int id);

	public List<ProductEntity> findByCategoryEntityId(int id);

	public List<ProductEntity> findByNameContaining (String name);

	Page<ProductEntity> findById(int id, Pageable pageable);
	
	public ProductEntity save (ProductEntity productEntity);
}
