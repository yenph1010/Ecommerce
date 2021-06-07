package com.example.demo.service;

import com.example.demo.entity.AccountEntity;

import java.util.List;

public interface AccountService {
	public List<AccountEntity> getAccounts();

	public AccountEntity getAccountByUsername(String username);
	
	public AccountEntity getAccountById(int id);

	public void saveAccount(AccountEntity accountEntity);

	public void deleteAccount(AccountEntity accountEntity);

	public void newAccount(AccountEntity accountEntity);

	public List<AccountEntity> getUsersAlldest();
}
