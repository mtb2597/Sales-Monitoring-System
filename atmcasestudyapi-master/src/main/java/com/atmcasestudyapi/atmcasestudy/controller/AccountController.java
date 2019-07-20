package com.atmcasestudyapi.atmcasestudy.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.atmcasestudyapi.atmcasestudy.model.Account;
import com.atmcasestudyapi.atmcasestudy.model.ResponseModel;
import com.atmcasestudyapi.atmcasestudy.model.UpdateBalance;
import com.atmcasestudyapi.atmcasestudy.service.AccountService;

@CrossOrigin
@RestController
@RequestMapping("/account")
public class AccountController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private ResponseModel res;

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public ResponseModel getAllAccount() {
//		return res.response(200, accountService.getAll(), "All User Found.");
		return res.response(200, "Connected", "Connected.");
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseModel getAccount(@RequestBody Account account) {
		List<Account> accountList = accountService.getAccount(account.getAccountNumber(), account.getAccountPin());
		System.out.println(accountList.size());
		if (accountList.size() == 0)
			return res.response(401, 0, "Inavlid credentials");
		return res.response(200, accountList, "User Found");
	}

	@RequestMapping(value = "/balance", method = RequestMethod.POST)
	public ResponseModel getBalance(@RequestBody Account account) {
		Optional<Account> balance = accountService.getBalance(account.getAccountNumber());
		if (balance.isPresent())
			return res.response(200, balance, "Balance Found");
		return res.response(404, 0, "No Balance");
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ResponseModel updateAccount(@RequestBody UpdateBalance ub) {
		boolean updated = accountService.updateAccount(ub);
		return res.response(updated ? 202 : 204, updated, updated ? "Updated" : "Not Updated");
	}

}
