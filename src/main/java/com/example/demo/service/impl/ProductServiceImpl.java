package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.demo.entity.ProductEntity;
import com.example.demo.repository.ProductRepository;
import com.example.demo.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	ProductRepository productRepository;

	@Override
	public Page<ProductEntity> getProductEntities(int pageNum) {
		int pageSize = 9;
		Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
		return (Page<ProductEntity>) productRepository.findAll(pageable);
	}

	@Override
	public List<ProductEntity> getProductEntities() {
		return (List<ProductEntity>) productRepository.findAll();
	}

	@Override
	public ProductEntity findById(int id) {
		ProductEntity productEntity = productRepository.findById(id);
		return productEntity;
	}

	public void deleteProduct(ProductEntity productEntity) {
		productRepository.delete(productEntity);
	}

	@Override
	public List<ProductEntity> getIdCategory(int id) {
		return (List<ProductEntity>) productRepository.findByCategoryEntityId(id);
	}

	@Override
	public ProductEntity editProduct(int id) {
		return productRepository.findById(id);
	}

	@Override
	public void newProduct(ProductEntity productEntity) {
		productRepository.save(productEntity);
	}
}
