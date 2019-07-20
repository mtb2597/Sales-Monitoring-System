package com.atmcasestudyapi.atmcasestudy.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.atmcasestudyapi.atmcasestudy.dao.AccountDao;
import com.atmcasestudyapi.atmcasestudy.model.Account;
import com.atmcasestudyapi.atmcasestudy.model.UpdateBalance;

@Service
public class AccountServiceImp implements AccountService {

	@Autowired
	private AccountDao accountDao;

	@Transactional
	@Override
	public List<Account> getAll() {
		return accountDao.findAll();
	}

	@Transactional
	@Override
	public List<Account> getAccount(int accountNumber, int accountPin) {
		return accountDao.getAccount(accountNumber, accountPin);
	}

	@Transactional
	@Override
	public Optional<Account> getBalance(int accountNumber) {
		return accountDao.findById(accountNumber);
	}

	@Transactional
	@Override
	public boolean updateAccount(UpdateBalance ub) {

		Optional<Account> balance = accountDao.findById(ub.getAccountNumber());

		if (balance.isPresent()) {
			double update = balance.get().getAvailableBalance();

			if (ub.getOpration().equals("deposit"))
				update += ub.getBalance();

			if (ub.getOpration().equals("withdraw"))
				update -= ub.getBalance();

			accountDao.updateAccount(update, ub.getAccountNumber());
			return true;
		}
		return false;
	}

}
