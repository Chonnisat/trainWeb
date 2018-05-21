CREATE TABLE sc_entry (
  entry_code varchar(15) NOT NULL,
  param_code varchar(15) NOT NULL,
  entry_type varchar(1) DEFAULT NULL,
  entry_value varchar(150) DEFAULT NULL,
  entry_desc varchar(150) DEFAULT NULL,
  entry_cre varchar(15) DEFAULT NULL,
  entry_cre_dat datetime DEFAULT NULL,
  entry_upd varchar(15) DEFAULT NULL,
  entry_upd_dat datetime DEFAULT NULL,
  PRIMARY KEY (entry_code,param_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
