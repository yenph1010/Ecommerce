package com.example.demo.service.impl;


import com.example.demo.entity.OrderEntity;
import com.example.demo.repository.OrderRepository;
import com.example.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderRepository orderRepository;


    @Override
    public void newOrder(OrderEntity orderEntity) {
        orderRepository.save(orderEntity);
    }


    @Override
    public OrderEntity findbyViewdetails(int id) {
        OrderEntity orderEntity = orderRepository.findById(id);
        return orderEntity;
    }


    @Override
    public List<OrderEntity> getIDTransaction(int id) {
        return (List<OrderEntity>) orderRepository.findByTransactionEntityId(id);
    }
    @Override
    public List<OrderEntity> getOrderEntities(){
        return (List<OrderEntity>)orderRepository.findAll();
    }
}

