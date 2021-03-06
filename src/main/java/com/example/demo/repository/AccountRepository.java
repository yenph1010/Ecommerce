package com.example.demo.repository;

import com.example.demo.entity.AccountEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountRepository extends JpaRepository<AccountEntity,Integer> {
    public List<AccountEntity> findAllByOrderByIdDesc();
    public AccountEntity getById(int id);
}

