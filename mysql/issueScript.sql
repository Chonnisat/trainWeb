-- search-issue
select 
    issue_id as "issueId"
    , issue_project as "issueProject"
    , item.item_desc as "issueProjectDesc"
    , item.item_value as "issueProjectImg"
    , date_format(issue_date, '%d/%m/%Y') as "issueDate"
    , issue_by as "issueBy"
    , issue_type as "issueType"
    , (select item_desc from sc_entry_item where param_code = 'ISSUE' and entry_code = 'TYPE' and item_code = issue_type) as "issueTypeDesc"
    , issue_module as "issueModule"
    , issue_desc as "issueDesc"
    , issue_priority as "issuePriority"
    , (select item_desc from sc_entry_item where param_code = 'ISSUE' and entry_code = 'PRIORITY' and item_code = issue_priority) as "issuePriorityDesc"
    , issue_status as "issueStatus"
    , (select item_desc from sc_entry_item where param_code = 'ISSUE' and entry_code = 'STATUS' and item_code = issue_status) as "issueStatusDesc"
    , issue_solution as "issueSolution"
    , issue_pic as "issuePic"
    , (select item_desc from sc_entry_item where param_code = 'ISSUE' and entry_code = 'PIC' and item_value = issue_pic) as "issuePicDesc"
    , date_format(issue_target, '%d/%m/%Y') as "issueTarget"
    , date_format(issue_closed, '%d/%m/%Y') as "issueClosed"
from sc_issue , sc_entry_item item
where item.param_code = 'ISSUE'
    and item.entry_code = 'PROJECT'
    and item.item_code = issue_project
    and issue_project like '%${dat.issueProject}%'
    and issue_status like '%${dat.issueStatus}%'
    and issue_pic like '%${dat.issuePic}%'
    and issue_desc like '%${dat.issueDesc}%'
    and  
        case '${dat.issueClosed}' 
            when '' then true 
            when DATE_FORMAT(ifnull(issue_closed, sysdate()), '%d/%m/%Y') then true
            else false 
        end
    and issue_id like '%${dat.issueId}%'
    and issue_priority like '%${dat.issuePriority}%'
order by  issue_cre_dat desc
limit ${dat.rowPerPage}
offset ${dat.offset}


select count(*) as "totalCount"
from sc_issue 
where issue_project like '%${dat.issueProject}%'
    and issue_status like '%${dat.issueStatus}%'
    and issue_pic like '%${dat.issuePic}%'
    and issue_desc like '%${dat.issueDesc}%'
    and  
    case '${dat.issueClosed}' 
    when '' then true 
    when DATE_FORMAT(ifnull(issue_closed, sysdate()), '%d/%m/%Y') then true
    else false end
    and issue_id like '%${dat.issueId}%'
    and issue_priority like '%${dat.issuePriority}%'
    

-- findById-issue
select 
    issue_id as "issueId"
    , issue_project as "issueProject"
    , date_format(issue_date, '%d/%m/%Y') as "issueDate"
    , issue_by as "issueBy"
    , issue_type as "issueType"
    , issue_module as "issueModule"
    , issue_desc as "issueDesc"
    , issue_priority as "issuePriority"
    , issue_status as "issueStatus"
    , issue_solution as "issueSolution"
    , issue_pic as "issuePic"
    , ifnull(date_format(issue_target, '%d/%m/%Y'),'') as "issueTarget"
    , ifnull(date_format(issue_closed, '%d/%m/%Y'),'') as "issueClosed"
from sc_issue 
where issue_id = '${req.params.id}';


-- getDataDDL-issue
-- project
select
    item_code as "pkCode"
    , item_code as "itemCode"
    , item_desc as "itemDesc"
    , item_value as "itemValue"
from sc_entry_item
where param_code = 'ISSUE'
    and entry_code = 'PROJECT'
order by item_desc;

-- type
select
    item_code as "pkCode"
    , item_code as "itemCode"
    , item_desc as "itemDesc"
    , item_value as "itemValue"
from sc_entry_item
where param_code = 'ISSUE'
    and entry_code = 'TYPE'
order by item_desc;

-- priority
select
    item_code as "pkCode"
    , item_code as "itemCode"
    , item_desc as "itemDesc"
    , item_value as "itemValue"
from sc_entry_item
where param_code = 'ISSUE'
    and entry_code = 'PRIORITY'
order by item_code;

-- status
select
    item_code as "pkCode"
    , item_code as "itemCode"
    , item_desc as "itemDesc"
    , item_value as "itemValue"
from sc_entry_item
where param_code = 'ISSUE'
    and entry_code = 'STATUS'
order by item_desc;

-- pic
select
    item_code as "pkCode"
    , item_code as "itemCode"
    , item_desc as "itemDesc"
    , item_value as "itemValue"
from sc_entry_item
where param_code = 'ISSUE'
    and entry_code = 'PIC'
order by item_desc;


-- insert-issue
insert into sc_issue(
    issue_project
    , issue_date
    , issue_by
    , issue_type
    , issue_module
    , issue_desc
    , issue_priority
    , issue_status
    , issue_solution
    , issue_pic
    , issue_target
    , issue_closed
    , issue_cre
    , issue_cre_dat
    , issue_upd
    , issue_upd_dat
) values (
    '${dat.issueProject}'
    , STR_TO_DATE('${dat.issueDate}', '%d/%m/%Y')
    , '${dat.issueBy}'
    , '${dat.issueType}'
    , '${dat.issueModule}'
    , '${dat.issueDesc}'
    , '${dat.issuePriority}'
    , '${dat.issueStatus}'
    , '${dat.issueSolution}'
    , '${dat.issuePic}'
    , case '${dat.issueTarget}' when '' then null else STR_TO_DATE('${dat.issueTarget}', '%d/%m/%Y') end
    , case '${dat.issueClosed}' when '' then null else STR_TO_DATE('${dat.issueClosed}', '%d/%m/%Y') end
    , '${userInfo.userCode}'
    , sysdate()
    , '${userInfo.userCode}'
    , sysdate()
);


-- update-issue
update sc_issue set 
    issue_project = '${dat.issueProject}'
    , issue_date = STR_TO_DATE('${dat.issueDate}', '%d/%m/%Y')
    , issue_by = '${dat.issueBy}'
    , issue_type = '${dat.issueType}'
    , issue_module = '${dat.issueModule}'
    , issue_desc = '${dat.issueDesc}'
    , issue_priority = '${dat.issuePriority}'
    , issue_status = '${dat.issueStatus}'
    , issue_solution = '${dat.issueSolution}'
    , issue_pic = '${dat.issuePic}'
    , issue_target = case '${dat.issueTarget}' when '' then null else STR_TO_DATE('${dat.issueTarget}', '%d/%m/%Y') end
    , issue_closed = case '${dat.issueClosed}' when '' then null else STR_TO_DATE('${dat.issueClosed}', '%d/%m/%Y') end
    , issue_upd = '${userInfo.userCode}'
    , issue_upd_dat = sysdate()
where issue_id = '${dat.issueId}';


-- delete-issue
delete from sc_issue where issue_id = '${req.params.id}'

-- sendEmail
select
    i.issue_id
    , date_format(i.issue_date, '%d/%m/%Y')
    , i.issue_desc
    , it.item_desc as "pic"
    , it.item_type as "picEmail"
from sc_issue i, sc_entry_item it
where it.param_code = 'ISSUE'
    and it.entry_code = 'PIC'
    and it.item_value = i.issue_pic
    and i.issue_id = ${req.params.issueId}