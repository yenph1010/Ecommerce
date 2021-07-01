package com.example.demo.service;

import com.example.demo.entity.TransactionEntity;

import java.util.List;

public interface TransactionService {
	public TransactionEntity newTransaction(TransactionEntity transactionEntity);

	public List<TransactionEntity> transactionEntities();

	public TransactionEntity findbyTransaction(int id);

}
