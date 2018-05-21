import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { ProjectService } from '../../shared/project/project.service';
import { UploadService } from '../../shared/upload/upload.service';
import { Project } from '../../shared/project/project';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-project',
  templateUrl: './project.component.html',
  styleUrls: ['./project.component.css'],
  providers: [UploadService, ProjectService]
})
export class ProjectComponent implements OnInit {

  constructor(
    private router: Router,
    private activatedRoute: ActivatedRoute,
    private projectService: ProjectService,
    private uploadService: UploadService
  ) { }

  project: Project;
  msg = '';
  filesToUpload: any[];

  ngOnInit() {
    this.project = new Project();
    this.activatedRoute.params.subscribe(params => {
      if (params['pkCode']) {
        const pkCode = params['pkCode'];
        this.getDataById(pkCode);
        this.project.pkCode = pkCode;
      }else {
        this.project.status = 'Y';
      }
    });
  }

  onBack() {
    this.router.navigate(['admin', 'project-list']);
  }

  onSave() {
    if (this.project.pkCode) {
      this.projectService.updateItem(this.project).subscribe(
        data => {
          Materialize.toast('Update Complete', 3000);
          this.router.navigate(['admin', 'project-list']);
        },
        err => {
          console.log(err);
        });
    }else {
      this.projectService.addItem(this.project).subscribe(
        user => {
          Materialize.toast('Add Item Complete', 3000);
          this.router.navigate(['admin', 'project-list']);
        },
        err => {
          console.log(err);
        });
    }
  }

  getDataById(pkCode) {
    this.projectService.loadDataById(pkCode).subscribe(
      project => {
        this.project = project[0];
        setTimeout(() => {
          Materialize.updateTextFields();
        }, 0);
      },
      err => {
        console.log(err);
      });
  }

  alertMsg() {
    Materialize.toast(this.msg, 3000, 'deep-orange darken-1');
  }

  fileChangeEvent(fileInput) {
    this.filesToUpload = <Array<File>> fileInput.target.files;
    if (this.filesToUpload.length > 0) {
      console.log(this.filesToUpload[0]);
      this.project.projImage = this.filesToUpload[0].name;
    }else {
      this.project.projImage = '';
    }
  }

  upload() {
    if (this.filesToUpload.length > 0) {
      const link = `${environment.remoteAPI}/api/v1/upload/picture/project/${this.project.projCode}`;
      this.uploadService.makeFileRequest(link,
        this.filesToUpload
      ).subscribe((res) => {
          this.onSave();
      });
    }
  }

  onSaveClick() {
    console.log(this.project);
    if (this.project.projImage !== ''  && this.project.projImageOri !== this.project.projImage) {
      this.upload();
    }else {
      this.onSave();
    }

  }

}
