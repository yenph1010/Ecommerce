package com.example.demo.service.impl;


import com.example.demo.entity.OrderDetailEntity;
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
    public void newOrder(OrderDetailEntity orderEntity) {
        orderRepository.save(orderEntity);
    }


    @Override
    public OrderDetailEntity findbyViewdetails(int id) {
        OrderDetailEntity orderEntity = orderRepository.findById(id);
        return orderEntity;
    }


    @Override
    public List<OrderDetailEntity> getIDTransaction(int id) {
        return (List<OrderDetailEntity>) orderRepository.findByTransactionEntityId(id);
    }
    @Override
    public List<OrderDetailEntity> getOrderEntities(){
        return (List<OrderDetailEntity>)orderRepository.findAll();
    }
}

