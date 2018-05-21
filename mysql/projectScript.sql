-- read-project
select
    concat(param_code,'-',entry_code,'-',item_code) as "pkCode"
    , item_code as "projCode"
    , item_desc as "projName"
    , item_value as "projImage"
    , item_type as "status"
from sc_entry_item
where param_code = 'ISSUE'
    and entry_code = 'PROJECT';
    
-- readById-project    
select 
    concat(param_code,'-',entry_code,'-',item_code) as "pkCode"
    , item_code as "projCode"
    , item_desc as "projName"
    , item_value as "projImage"
    , item_type as "status"
    , item_value as "projImageOri"
from sc_entry_item
where concat(param_code,'-',entry_code,'-',item_code) = '${req.params.pkCode}';


-- insert project
insert into sc_entry_item (
    item_code
    ,entry_code
    ,param_code
    ,item_value
    ,item_desc
    ,item_type
    ,item_cre
    ,item_cre_dat
    ,item_upd
    ,item_upd_dat
) VALUES (
    '${dat.projCode}'
    ,'PROJECT'
    ,'ISSUE'
    ,'${dat.projImage}'
    ,'${dat.projName}'
    ,'${dat.status}'
    ,'${userInfo.userCode}'
    ,sysdate()
    ,'${userInfo.userCode}'
    ,sysdate()
);

-- update-project
update sc_entry_item SET
    item_code = '${dat.projCode}'
    ,item_value = '${dat.projImage}'
    ,item_desc = '${dat.projName}'
    ,item_type = '${dat.status}'
    ,item_upd = '${userInfo.userCode}'
    ,item_upd_dat = sysdate()
where concat(param_code,'-',entry_code,'-',item_code) = '${dat.pkCode}';

-- delete-project
delete from sc_entry_item
where concat(param_code,'-',entry_code,'-',item_code) = '${req.params.pkCode}';