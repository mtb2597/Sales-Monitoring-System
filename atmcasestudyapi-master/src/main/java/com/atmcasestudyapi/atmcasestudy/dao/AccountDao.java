package com.atmcasestudyapi.atmcasestudy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.atmcasestudyapi.atmcasestudy.model.Account;

public interface AccountDao extends JpaRepository<Account, Integer> {

	@Query("FROM Account WHERE accountNumber = :accountNumber AND accountPin = :accountPin")
	List<Account> getAccount(@Param(value = "accountNumber") int accountNumber,
			@Param(value = "accountPin") int accountPin);

	@Modifying
	@Query("UPDATE Account SET availableBalance = :availableBalance WHERE accountNumber = :accountNumber")
	void updateAccount(@Param(value = "availableBalance") double availableBalance,
			@Param(value = "accountNumber") int accountNumber);

}
