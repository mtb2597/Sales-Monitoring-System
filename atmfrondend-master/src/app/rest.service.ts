import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, Subscription } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RestService {

  constructor(private http: HttpClient) { }

  readonly baseUrl: string = 'http://localhost:8080/account/';
  iSubscribe: Subscription;

  get(apiName): Observable<any> {
    return this.http.get(this.baseUrl + apiName, {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        // 'token':''
      })
    });
  }

  post(apiName, dataInfo): Observable<any> {
    return this.http.post(this.baseUrl + apiName, dataInfo, {
      headers: new HttpHeaders({
        'Content-Type': 'application/json',
        // 'token':''
      })
    });
  }

  apiGet(apiName: string, callBack: (arg: any) => void) {
    this.iSubscribe = this.get(apiName).subscribe(
      resp => callBack(resp),
      error => {
        alert('Server Not Responding, Try Again');
        // console.log(error);
      });
  }

  apiPost(apiName: string, data: any, callBack: (arg: any) => void) {
    this.iSubscribe = this.post(apiName, data).subscribe(
      resp => callBack(resp),
      error => {
        alert('Server Not Responding, Try Again');
        // console.log(error);
      });
  }

}
