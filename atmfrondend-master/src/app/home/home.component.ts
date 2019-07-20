import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';

import { AccountService } from '../account.service';
import { RestService } from '../rest.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  submitted = false;
  showForm = false;
  logged = false;
  loginForm: FormGroup;
  success = false;
  iSubscribe: Subscription;

  constructor(
    private formBuilder: FormBuilder,
    private accountService: AccountService,
    private router: Router,
    private restService: RestService
  ) {
    restService.apiGet('all', resp => console.log(resp.message));
  }

  ngOnInit() {

    this.iSubscribe = this.accountService.currentLogged
      .subscribe(value => this.logged = value);

    this.accountService.storage('session-get', 'id')
      ? this.router.navigate(['balance'])
      : this.router.navigate(['']);

    this.loginForm = this.formBuilder.group({
      accountNumber: ['', Validators.required],
      accountPin: ['', Validators.required]
    });
  }

  openLogin = () => this.showForm = true;

  onSubmit() {
    this.submitted = true;
    const { accountService, router, restService, loginForm } = this;

    if (loginForm.invalid) { return; }

    restService.apiPost('login', loginForm.value, (resp) => {
      const { data, message } = resp;
      this.success = data.length > 0 ? true : false;
      if (this.success) {
        accountService.storage('session-set', 'name', data[0].userName);
        accountService.storage('session-set', 'id', this.success);
        accountService.storage('session-set', 'accountNumber', data[0].accountNumber);
        accountService.changeLogged(this.success);
        router.navigate(['balance']);
        this.iSubscribe.unsubscribe();
      } else {
        alert(message);
      }
    });

  }

}
