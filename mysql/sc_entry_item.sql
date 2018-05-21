CREATE TABLE sc_entry_item (
  item_code varchar(15) NOT NULL,
  entry_code varchar(15) NOT NULL,
  param_code varchar(15) NOT NULL,
  item_value varchar(150) DEFAULT NULL,
  item_desc varchar(150) DEFAULT NULL,
  item_type varchar(100) DEFAULT NULL,
  item_cre varchar(15) DEFAULT NULL,
  item_cre_dat datetime DEFAULT NULL,
  item_upd varchar(15) DEFAULT NULL,
  item_upd_dat datetime DEFAULT NULL,
  PRIMARY KEY (item_code,entry_code,param_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
