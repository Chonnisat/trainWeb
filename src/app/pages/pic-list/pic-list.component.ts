import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from '../../../environments/environment';
import { PicService } from '../../shared/pic/pic.service';

@Component({
  selector: 'app-pic-list',
  templateUrl: './pic-list.component.html',
  styleUrls: ['./pic-list.component.css'],
  providers: [PicService]
})
export class PicListComponent implements OnInit {

  constructor(
    private router: Router,
    private picService: PicService
  ) { }

  picList = [];

  ngOnInit() {
    this.onLoadData();
  }

  onAddbtnClick() {
    this.router.navigate(['admin', 'pic']);
  }

  onEditbtnClick(pkCode) {
    this.router.navigate(['admin', 'pic', pkCode]);
  }

  onDelbtnClick(pkCode) {
    this.picService.deleteItem(pkCode).subscribe(
      datas => {
        Materialize.toast('Delete data Complete', 3000);
        this.onLoadData();
      },
      err => {
        console.log(err);
      });
  }

  onLoadData() {
    this.picService.onLoadData().subscribe(
      data => {
        this.picList = data;
      }, error => {
        console.log(error);
      }
    );
  }

}
