import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { PicService } from '../../shared/pic/pic.service';
import { UploadService } from '../../shared/upload/upload.service';
import { Pic } from '../../shared/pic/pic';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-pic',
  templateUrl: './pic.component.html',
  styleUrls: ['./pic.component.css'],
  providers: [UploadService, PicService]
})
export class PicComponent implements OnInit {

  constructor(
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private picService: PicService,
    private uploadService: UploadService
  ) { }

  pic: Pic;

  ngOnInit() {
    this.pic = new Pic();
    this.activatedRoute.params.subscribe(params => {
      if (params['pkCode']) {
        const pkCode = params['pkCode'];
        this.getDataById(pkCode);
        this.pic.pkCode = pkCode;
      }
    });
  }

  onBack() {
    this.router.navigate(['admin', 'pic-list']);
  }

  onSave() {
    if (this.pic.pkCode) {
      this.picService.updateItem(this.pic).subscribe(
        data => {
          Materialize.toast('Update Complete', 3000);
          this.router.navigate(['admin', 'pic-list']);
        },
        err => {
          console.log(err);
        });
    }else {
      this.picService.addItem(this.pic).subscribe(
        pic => {
          Materialize.toast('Add Item Complete', 3000);
          this.router.navigate(['admin', 'pic-list']);
        },
        err => {
          console.log(err);
        });
    }
  }

  getDataById(pkCode) {
    this.picService.loadDataById(pkCode).subscribe(
      pic => {
        this.pic = pic[0];
        setTimeout(() => {
          Materialize.updateTextFields();
        }, 0);
      },
      err => {
        console.log(err);
      });
  }

}
