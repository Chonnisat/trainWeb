import { Injectable } from '@angular/core';
import { Http, Response, RequestOptions, Headers } from '@angular/http';
import { Observable } from 'rxjs/Rx';
import 'rxjs/add/operator/map';
import 'rxjs/add/operator/catch';
import { environment } from '../../../environments/environment';

@Injectable()
export class PicService {

  options: RequestOptions;

  constructor(private http: Http) {
    const headers = new Headers({
      'Content-Type': 'application/json',
      'Authorization': 'JWT ' + localStorage.getItem('auth_token')
    });
    this.options = new RequestOptions({ headers: headers });
  }

  onLoadData() {
    return this.http.get(`${environment.remoteAPI}/api/v1/pic`, this.options)
      .map((res: Response) => {
        return res.json();
      }) // ...and calling .json() on the response to return data
      .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }

  loadDataById(id): Observable<any> {
    return this.http.get(`${environment.remoteAPI}/api/v1/pic/findByID/${id}`, this.options)
      .map((res: Response) => {
        return res.json();
      })
      .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }

  addItem(body): Observable<any> {
    return this.http.post(`${environment.remoteAPI}/api/v1/pic`, body, this.options)
      .map((res: Response) => {
        return res.json();
      }) // ...and calling .json() on the response to return data
      .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }

  deleteItem(pkCode): Observable<any> {
    return this.http.delete(`${environment.remoteAPI}/api/v1/pic/${pkCode}`, this.options)
      .map((res: Response) => {
        return res.json();
      }) // ...and calling .json() on the response to return data
      .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }

  updateItem(body): Observable<any> {
    return this.http.put(`${environment.remoteAPI}/api/v1/pic`, body, this.options)
      .map((res: Response) => {
        return res.json();
      }) // ...and calling .json() on the response to return data
      .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }

  countTotalPic() {
    return this.http.get(`${environment.remoteAPI}/api/v1/pic/countTotalPic`, this.options)
      .map((res: Response) => {
        return res.json();
      }) // ...and calling .json() on the response to return data
      .catch((error: any) => Observable.throw(error.json().error || 'Server error'));
  }

}
