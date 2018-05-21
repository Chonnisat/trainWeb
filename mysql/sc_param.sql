CREATE TABLE sc_param (
  param_code varchar(15) NOT NULL,
  param_desc varchar(150) DEFAULT NULL,
  param_cre varchar(15) DEFAULT NULL,
  param_cre_dat datetime DEFAULT NULL,
  param_upd varchar(15) DEFAULT NULL,
  param_upd_dat datetime DEFAULT NULL,
  PRIMARY KEY (param_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
