import { Component, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';

import { AccountService } from '../account.service';
import { Account } from '../account';
import { RestService } from '../rest.service';

@Component({
  selector: 'app-balance',
  templateUrl: './balance.component.html',
  styleUrls: ['./balance.component.css']
})

export class BalanceComponent implements OnInit {

  logged = false;
  balance: Account = null;
  checkBalance = 'Check Balance';
  availableBalance: number;
  totalBalance: number;
  iSubscribe: Subscription;

  constructor(
    private accountService: AccountService,
    private restService: RestService
  ) { }

  ngOnInit() {
    this.iSubscribe = this.accountService.currentLogged.subscribe(value => {
      this.logged = value;
    });
    this.accountService.changeLogged(true);
    this.iSubscribe.unsubscribe();
  }

  showBalance = () => {
    const accountNumber = this.accountService.storage('session-get', 'accountNumber');
    this.restService.apiPost('balance', { accountNumber }, (resp) => {
      const { data } = resp;
      this.balance = data;
      const { availableBalance, totalBalance } = this.balance;
      this.availableBalance = availableBalance;
      this.totalBalance = totalBalance;
      this.checkBalance = 'Refresh Balance';
    });
  }

}
