insert into sc_param(param_code, param_desc, param_cre, param_cre_dat, param_upd, param_upd_dat) VALUES
('ISSUE', 'Issue', 'admin', sysdate(), NULL, NULL);

insert into sc_entry(entry_code, param_code, entry_type, entry_value, entry_desc, entry_cre, entry_cre_dat, entry_upd, entry_upd_dat) VALUES
('PIC', 'ISSUE', NULL, NULL, 'Person In Charge', 'admin', sysdate(), NULL, NULL), 
('PRIORITY', 'ISSUE', NULL, 'PRIORITY', 'PRIORITY', 'admin', sysdate(), NULL, NULL), 
('PROJECT', 'ISSUE', NULL, NULL, 'Project Name', 'admin', sysdate(), NULL, NULL), 
('STATUS', 'ISSUE', NULL, NULL, 'Status', 'admin', sysdate(), NULL, NULL), 
('TYPE', 'ISSUE', NULL, NULL, 'Issue Type', 'admin', sysdate(), NULL, NULL);

insert into sc_entry_item(item_code, entry_code, param_code, item_value, item_desc, item_type, item_cre, item_cre_dat, item_upd, item_upd_dat) VALUES
('5', 'TYPE', 'ISSUE', '5', 'Others', NULL, 'admin', sysdate(), NULL, NULL), 
('4', 'TYPE', 'ISSUE', '4', 'HW/SW', NULL, 'admin', sysdate(), NULL, NULL), 
('3', 'TYPE', 'ISSUE', '3', 'Mis-operation', NULL, 'admin', sysdate(), NULL, NULL), 
('2', 'TYPE', 'ISSUE', '2', 'Change Request', NULL, 'admin', sysdate(), NULL, NULL), 
('1', 'TYPE', 'ISSUE', '1', 'Error', NULL, 'admin', sysdate(), NULL, NULL), 
('P', 'STATUS', 'ISSUE', 'P', 'Pending', NULL, 'admin', sysdate(), NULL, NULL), 
('O', 'STATUS', 'ISSUE', 'O', 'Open', NULL, 'admin', sysdate(), NULL, NULL), 
('C', 'STATUS', 'ISSUE', 'C', 'Closed', NULL, 'admin', sysdate(), NULL, NULL), 
('U', 'PRIORITY', 'ISSUE', 'U', 'Urgent', NULL, 'admin', sysdate(), NULL, NULL), 
('M', 'PRIORITY', 'ISSUE', 'M', 'Medium', NULL, 'admin', sysdate(), NULL, NULL), 
('L', 'PRIORITY', 'ISSUE', 'L', 'Low', NULL, 'admin', sysdate(), NULL, NULL), 
('H', 'PRIORITY', 'ISSUE', 'H', 'High', NULL, 'admin', sysdate(), NULL, NULL);