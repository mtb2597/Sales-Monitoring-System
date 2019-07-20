import { Component, OnInit } from '@angular/core';
import { AccountService } from '../account.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-deposite',
  templateUrl: './deposite.component.html',
  styleUrls: ['./deposite.component.css']
})
export class DepositeComponent implements OnInit {

  logged = false;
  amountForm: FormGroup;
  form = true;
  amountBalance = 0;
  recieved = false;
  iSubscribe: Subscription;
  submitted = false;

  constructor(
    private formBuilder: FormBuilder,
    private accountService: AccountService,
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

  deposit() {
    this.submitted = true;
    if (this.amountForm.invalid) { return; };
    this.amountBalance = this.amountForm.value.amount;
    this.form = false;
    this.accountService.upDateBalance(this.amountBalance, 'deposit',
      (resp) => this.recieved = resp.data);
  }

}
