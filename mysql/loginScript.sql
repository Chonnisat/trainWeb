-- login
select 
    user_code as "userCode"
    , user_first_name as "userName"
    , user_last_name as "userLastName"
    , user_email as "userEmail"
from sc_user 
where (user_code = '${dat.userCode}' or user_email = '${dat.userCode}') 
    and user_pwd = '${dat.userPwd}' 
    and user_active = 'Y';