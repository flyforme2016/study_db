use world;

CREATE TABLE IF NOT EXISTS `world`.`user_sns` (
  `seq` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_info_seq` INT UNSIGNED NOT NULL,
  `user_info_id` VARCHAR(45) NOT NULL,
  `default_ny` INT NOT NULL,
  `sns_type_cd` VARCHAR(45) NULL,
  `sns_url` VARCHAR(100) NULL,
  `reg_ip` VARCHAR(45) NULL,
  `reg_seq` VARCHAR(45) NULL,
  `reg_device` VARCHAR(45) NULL,
  `reg_cilent_datetime` VARCHAR(45) NULL,
  `reg_server_datetime` VARCHAR(45) NULL,
  `mod_ip` VARCHAR(45) NULL,
  `mod_seq` VARCHAR(45) NULL,
  `mod_device` VARCHAR(45) NULL,
  `mod_client_datetime` VARCHAR(45) NULL,
  `mod_server_datetime` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`, `user_info_seq`, `user_info_id`),
  CONSTRAINT `fk_phone_number_user_info1000`
    FOREIGN KEY (`user_info_seq` , `user_info_id`)
    REFERENCES `world`.`user_info` (`seq` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

drop table code_group;

insert into user_sns (
user_info_seq
,user_info_id
,default_ny
,sns_type_cd
,sns_url
) values (
7
,'eorjsrlwjd'
,1
,'ST02'
,'https://www.instagram.com/k.jung_/?hl=ko'
);

insert into user_email(
user_info_seq
,user_info_id
,default_ny
,email
) values(
7
,'eorjsrlwjd'
,1
,'eorjsrlwjd@naver.com'
);

insert into code_group(
code_type
,type_name
) values (
'10'
,'SNS'
);

insert into user_mobile(
user_info_seq
,user_info_id
,default_ny
,mobile_carrier_cd
,number
) values(
6
,'rainbow'
,1
,'MC03'
,'01066666666'
);

select *from user_mobile;
select *from code_group;
select *from code;
select *from user_email;
select *from user_sns;

insert into code(
code_group_code_type
,code
,code_value
) values(
'10'
,'ST03'
,'line'
);

insert into user_address(
seq
,user_info_user_seq
,user_info_id
,real_address
,detail_real_address
,real_address_zip_code
,delivery_address
,detail_delivery_address
,delivery_address_zip_code
) values(
6
,6
,'rainbow'
,'서울특별시 강동구 고덕로 183'
,'303-303'
,05235
,'서울특별시 강동구 고덕로 183'
,'303-303'
,05235
);

select *from user_address;
select *from user_info;

update user_email set
	seq = seq-1
where
	seq >= 3;

alter table user_mobile change carrier_cd mobile_carrier_cd varchar(10);

delete from user_address
where seq=6;


insert into user_info (
seq
,id
,password
,password_mod_date
,name
,gender_cd
,birth
,nationality_cd
,user_type_cd
,user_state_cd
,question_cd
,answer
,profile_picture
,color
,recommender
,personal_information_validity_period_cd
,email_reception_cd
,sns_reception_cd -- 17
) values (
6
,'eorjsrlwjd'
,'eorjsakstp'
,"2016-01-28"
,'Tom'
,'1'
,"1966-06-08"
,'1'
,'1'
,'1'
,'7'
,'그리움만 쌓이네'
,load_file('C:\Users\cjdfiuser_info\me.jpg')
,'하얀색'
,'정재훈'
,'1'
,'1'
,'1'
);
