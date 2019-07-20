import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { HomeComponent } from './home/home.component';
import { BalanceComponent } from './balance/balance.component';
import { WithdrawComponent } from './withdraw/withdraw.component';
import { DepositeComponent } from './deposite/deposite.component';
import { UserGuard } from './user.guard';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'balance', canActivate: [UserGuard], component: BalanceComponent },
  { path: 'withdraw', canActivate: [UserGuard], component: WithdrawComponent },
  { path: 'deposit', canActivate: [UserGuard], component: DepositeComponent },
  { path: '**', component: HomeComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
