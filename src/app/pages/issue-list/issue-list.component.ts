import { Component, OnInit} from '@angular/core';
import { Router } from '@angular/router';
import { IssueService } from '../../shared/issue/issue.service';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-issue-list',
  templateUrl: './issue-list.component.html',
  styleUrls: ['./issue-list.component.css'],
  providers: [IssueService]
})
export class IssueListComponent implements OnInit {

  constructor(
    private router: Router,
    private issueService: IssueService
  ) { }

  issueData = [];
  currentPage= 0;
  rowPerPage= 10;
  offset= 0;
  totalPage= 0;
  totalCount= 0;
  imgUrl = `${environment.remoteAPI}/api/v1/upload/viewImg/project/`;
  criteria = {
    issueProject : '',
    issueStatus : 'O',
    issuePic : '',
    issueDesc : '',
    issueClosed : '',
    issueId : '',
    issueModule : '',
    issuePriority : '',
    currentPage: this.currentPage,
    rowPerPage: this.rowPerPage,
    offset : this.offset,
    issueDateStart : '',
    issueDateEnd : ''
  };

  projectList = [];
  priorityList = [];
  statusList = [];
  picList = [];

  ngOnInit() {
    this.getDataDDL();
    this.getCriteria();
  }

  onAddbtnClick() {
    this.router.navigate(['admin', 'issue']);
  }

  onEditbtnClick(id) {
    this.router.navigate(['admin', 'issue', id]);
  }

  onDelbtnClick(id) {
    this.issueService.deleteItem(id).subscribe(
      datas => {
        Materialize.toast('Delete data Complete', 3000);
        this.onSearch();
      },
      err => {
        console.log(err);
      });
  }

  onSearch() {
    $('.collapsible').collapsible('close', 0);
    this.issueData = [];
    this.currentPage = 0;
    this.offset = 0;
    this.totalPage = 0;
    this.keepCriteria();
  }

  onLoadData() {
    const searchBody = {
      issueProject : this.criteria.issueProject,
      issueStatus : this.criteria.issueStatus,
      issuePic : this.criteria.issuePic,
      issueDesc : this.criteria.issueDesc,
      issueClosed : this.criteria.issueClosed,
      issueId : this.criteria.issueId,
      issueModule : this.criteria.issueModule,
      issuePriority : this.criteria.issuePriority,
      currentPage: this.currentPage,
      rowPerPage: this.rowPerPage,
      offset: this.offset,
      issueDateStart: (this.criteria.issueDateStart) ? this.criteria.issueDateStart : '01/01/2000',
      issueDateEnd: (this.criteria.issueDateEnd) ? this.criteria.issueDateEnd : '31/12/3000'
    };

    this.issueService.onSearchData(searchBody).subscribe(
      data => {
        this.issueData = this.issueData.concat(data.rows);

        const paging_data = data['paging'];
        this.offset = paging_data.offset;
        this.currentPage = paging_data.current_page;
        this.totalPage = paging_data.total_page;
        this.totalCount = paging_data.total_count;
      }, error => {
        console.log(error);
      }
    );
  }

  // renderPaging() {
    // this.totalPage = Math.ceil(this.total/this.rowPerPage);
    // this.paging = [];
    // let currentPage = this.numPage+1;
    // let start = (currentPage - 2) <= 0 ? 1 : currentPage - 2;
    // let limit = (start + 5) >= this.totalPage ? (this.totalPage+1) : (start + 5);
    // for(let i=start; i<limit; i++){
    //   this.paging.push(i);
    // }
  // }

  // gotoPage(pID){
  //   this.currentPage = pID;
  //   this.onSearch();
  // }

  onAttachbtnClick(id) {
    this.router.navigate(['admin', 'issue-attach', id]);
  }

  getDataDDL() {
    this.issueService.loadDataDDL().subscribe(
      datas => {
        this.projectList = datas['projectList'];
        this.priorityList = datas['priorityList'];
        this.statusList = datas['statusList'];
        this.picList = datas['picList'];
      },
      err => {
        console.log(err);
        alert(err);
      });
  }

  getCriteria() {
    this.criteria.issueProject = (sessionStorage.getItem('issueProject')) ? sessionStorage.getItem('issueProject') : '';
    this.criteria.issueStatus = (sessionStorage.getItem('issueStatus')) ? sessionStorage.getItem('issueStatus') : 'O';
    this.criteria.issuePic = (sessionStorage.getItem('issuePic')) ? sessionStorage.getItem('issuePic') : '';
    this.criteria.issueDesc = (sessionStorage.getItem('issueDesc')) ? sessionStorage.getItem('issueDesc') : '';
    this.criteria.issueClosed = (sessionStorage.getItem('issueClosed')) ? sessionStorage.getItem('issueClosed') : '';
    this.criteria.issueId = (sessionStorage.getItem('issueId')) ? sessionStorage.getItem('issueId') : '';
    this.criteria.issueModule = (sessionStorage.getItem('issueModule')) ? sessionStorage.getItem('issueModule') : '';
    this.criteria.issuePriority = (sessionStorage.getItem('issuePriority')) ? sessionStorage.getItem('issuePriority') : '';
    this.criteria.issueDateStart = (sessionStorage.getItem('issueDateStart')) ? sessionStorage.getItem('issueDateStart') : '';
    this.criteria.issueDateEnd = (sessionStorage.getItem('issueDateEnd')) ? sessionStorage.getItem('issueDateEnd') : '';

    this.onSearch();
  }

  keepCriteria() {
    sessionStorage.setItem('issueProject', this.criteria.issueProject);
    sessionStorage.setItem('issueStatus', this.criteria.issueStatus);
    sessionStorage.setItem('issuePic', this.criteria.issuePic);
    sessionStorage.setItem('issueDesc', this.criteria.issueDesc);
    sessionStorage.setItem('issueClosed', this.criteria.issueClosed);
    sessionStorage.setItem('issueId', this.criteria.issueId);
    sessionStorage.setItem('issueModule', this.criteria.issueModule);
    sessionStorage.setItem('issuePriority', this.criteria.issuePriority);
    sessionStorage.setItem('issueDateStart', this.criteria.issueDateStart);
    sessionStorage.setItem('issueDateEnd', this.criteria.issueDateEnd);

    this.onLoadData();
  }
}
