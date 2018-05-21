-- read-pic
select
  concat(param_code,'-',entry_code,'-',item_code) as "pkCode"
  , item_code as "picId"
  , item_value as "picCode"
  , item_desc as "picName"
from sc_entry_item
where param_code = 'ISSUE'
  and entry_code = 'PIC';
  

-- readById-pic
select 
    concat(param_code,'-',entry_code,'-',item_code) as "pkCode"
    , item_code as "picId"
    , item_value as "picCode"
    , item_desc as "picName"
from sc_entry_item
where concat(param_code,'-',entry_code,'-',item_code) = '${req.params.pkCode}'


-- insert pic
insert into sc_entry_item (
    item_code
    ,entry_code
    ,param_code
    ,item_value
    ,item_desc
    ,item_cre
    ,item_cre_dat
    ,item_upd
    ,item_upd_dat
) VALUES (
    '${dat.picId}'
    ,'PIC'
    ,'ISSUE'
    ,'${dat.picCode}'
    ,'${dat.picName}'
    ,'${userInfo.userCode}'
    ,sysdate()
    ,'${userInfo.userCode}'
    ,sysdate()
);

-- update pic
update sc_entry_item SET
  item_code = '${dat.picId}'
  ,item_value = '${dat.picCode}'
  ,item_desc = '${dat.picName}'
  ,item_upd = '${userInfo.userCode}'
  ,item_upd_dat = sysdate()
where concat(param_code,'-',entry_code,'-',item_code) = '${dat.pkCode}';


-- delete-pic
delete from sc_entry_item
where concat(param_code,'-',entry_code,'-',item_code) = '${req.params.pkCode}';