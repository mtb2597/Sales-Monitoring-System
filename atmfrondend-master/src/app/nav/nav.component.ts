import { Component, OnInit, AfterContentChecked, OnDestroy } from '@angular/core';
import { AccountService } from '../account.service';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-nav',
  templateUrl: './nav.component.html',
  styleUrls: ['./nav.component.css']
})

export class NavComponent implements OnInit, AfterContentChecked, OnDestroy {

  logged = false;
  userName = '-';
  iSubscribe: Subscription;

  constructor(
    private accountService: AccountService,
    private router: Router
  ) { }

  ngOnInit() {
    this.iSubscribe = this.accountService.currentLogged.subscribe(value => {
      this.logged = value;
    });
  }

  ngAfterContentChecked(): void {
    this.userName = this.accountService.storage('session-get', 'name');
  }

  logout() {
    this.logged = false;
    sessionStorage.clear();
    this.accountService.changeLogged(this.logged);
    this.router.navigate(['']);
  }

  ngOnDestroy(): void {
    this.iSubscribe.unsubscribe();
  }

}
