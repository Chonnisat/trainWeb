import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from '../../../environments/environment';
import { ProjectService } from '../../shared/project/project.service';

@Component({
  selector: 'app-project-list',
  templateUrl: './project-list.component.html',
  styleUrls: ['./project-list.component.css'],
  providers: [ProjectService]
})
export class ProjectListComponent implements OnInit {

  constructor(
    private router: Router,
    private projectService: ProjectService
  ) { }

  imgUrl = `${environment.remoteAPI}/api/v1/upload/viewImg/project/`;
  projectList = [];


  ngOnInit() {
    this.onLoadData();
  }

  onAddbtnClick() {
    this.router.navigate(['admin', 'project']);
  }

  onEditbtnClick(pkCode) {
    this.router.navigate(['admin', 'project', pkCode]);
  }

  onDelbtnClick(pkCode) {
    this.projectService.deleteItem(pkCode).subscribe(
      datas => {
        Materialize.toast('Delete data Complete', 3000);
        this.onLoadData();
      },
      err => {
        console.log(err);
      });
  }

  onLoadData() {
    this.projectService.onLoadData().subscribe(
      data => {
        this.projectList = data;
      }, error => {
        console.log(error);
      }
    );
  }

}
