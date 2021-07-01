package com.example.demo.repository;

import com.example.demo.entity.OrderDetailEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<OrderDetailEntity, Integer> {
    public List<OrderDetailEntity> findByTransactionEntityId(int id);

    public OrderDetailEntity findById(int id);

}