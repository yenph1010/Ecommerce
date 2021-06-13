package com.example.demo.service;

import com.example.demo.entity.OrderEntity;

import java.util.List;

public interface OrderService {
    public void newOrder(OrderEntity orderEntity);
    public List<OrderEntity> getOrderEntities();
    public List<OrderEntity> getIDTransaction(int id);
    public OrderEntity findbyViewdetails(int id);
}
