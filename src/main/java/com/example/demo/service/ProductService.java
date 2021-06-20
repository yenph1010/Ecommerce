package com.example.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.example.demo.entity.ProductEntity;

@Service
public interface ProductService {
	public Page<ProductEntity> getProductEntities(int pageNum);
	
	public List<ProductEntity> getProductEntities();

	public ProductEntity findById(int id);

	public List<ProductEntity> getIdCategory(int id);

	public void newProduct(ProductEntity productEntity);

	public void deleteProduct(ProductEntity productEntity);

	public ProductEntity editProduct(int id);
}
