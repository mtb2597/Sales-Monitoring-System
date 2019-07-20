import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { AccountService } from './account.service';

@Injectable({
  providedIn: 'root'
})
export class UserGuard implements CanActivate {

  logged = false;

  constructor(
    private accountService: AccountService,
    private router: Router
  ) { }

  canActivate(): boolean {

    this.logged = this.accountService.storage('session-get', 'id')
      ? true : false;

    if (this.logged) { return this.logged; }

    this.router.navigate(['']);
    this.accountService.changeLogged(false);
    return this.logged;
  }

}
