package com.example.demo.service;

import com.example.demo.entity.OrderDetailEntity;

import java.util.List;

public interface OrderService {
    public void newOrder(OrderDetailEntity orderEntity);
    public List<OrderDetailEntity> getOrderEntities();
    public List<OrderDetailEntity> getIDTransaction(int id);
    public OrderDetailEntity findbyViewdetails(int id);
}
