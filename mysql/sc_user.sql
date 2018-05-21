CREATE TABLE sc_user (
  user_code varchar(15) NOT NULL,
  user_title varchar(10) DEFAULT NULL,
  user_first_name varchar(150) DEFAULT NULL,
  user_last_name varchar(150) DEFAULT NULL,
  user_mobile varchar(15) DEFAULT NULL COMMENT 'Mobile Phone No.',
  user_tel varchar(15) DEFAULT NULL COMMENT 'Telephone No.',
  user_email varchar(30) DEFAULT NULL COMMENT 'Email',
  user_pwd varchar(15) DEFAULT NULL,
  user_active varchar(1) DEFAULT NULL,
  user_cre varchar(15) DEFAULT NULL,
  user_cre_dat datetime DEFAULT NULL,
  user_upd varchar(15) DEFAULT NULL,
  user_upd_dat datetime DEFAULT NULL,
  user_age int(11) DEFAULT NULL,
  user_dob date DEFAULT NULL,
  PRIMARY KEY (user_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
