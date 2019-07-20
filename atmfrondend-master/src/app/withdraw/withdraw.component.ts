import { Component, OnInit } from '@angular/core';
import { AccountService } from '../account.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-withdraw',
  templateUrl: './withdraw.component.html',
  styleUrls: ['./withdraw.component.css']
})
export class WithdrawComponent implements OnInit {

  logged = false;
  withdrawDone = false;
  dispensed = false;
  amountForm: FormGroup;
  amountBalance: any;
  recieved: boolean;
  iSubscribe: Subscription;
  submitted = false;

  constructor(
    private formBuilder: FormBuilder,
    private accountService: AccountService
  ) { }

  ngOnInit() {

    this.iSubscribe = this.accountService.currentLogged.subscribe(value => {
      this.logged = value;
    });

    this.accountService.changeLogged(true);
    this.iSubscribe.unsubscribe();
    this.amountForm = this.formBuilder.group({
      amount: ['', Validators.required],
    });

  }

  withdraw() {
    this.submitted = true;
    if (this.amountForm.invalid) { return; }
    this.amountBalance = this.amountForm.value.amount;
    this.accountService.upDateBalance(this.amountBalance, 'withdraw',
      (resp) => {
        const { data } = resp;
        this.withdrawDone = data;
        this.dispensed = data;
      });
  }
}
