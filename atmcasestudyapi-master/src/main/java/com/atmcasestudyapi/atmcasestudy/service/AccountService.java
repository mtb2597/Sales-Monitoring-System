package com.atmcasestudyapi.atmcasestudy.service;

import java.util.List;
import java.util.Optional;

import com.atmcasestudyapi.atmcasestudy.model.Account;
import com.atmcasestudyapi.atmcasestudy.model.UpdateBalance;

public interface AccountService {

	List<Account> getAll();

	List<Account> getAccount(int accountNumber, int accountPin);

	Optional<Account> getBalance(int accountNumber);

	boolean updateAccount(UpdateBalance ub);

}
