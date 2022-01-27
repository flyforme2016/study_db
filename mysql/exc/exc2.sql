use world;

CREATE TABLE IF NOT EXISTS `book3` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `publisher_cd` INT NOT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `publisher` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

insert into book3 (
name
,publisher_cd
) values(
'4차산업혁명의미래'
,4
);

insert into publisher (
name
) value (
'Tom'
);

select * from book3;
select * from publisher;

drop table book3;
drop table publisher;

select 
	a.no
    ,a.name
    ,a.publisher_cd
    ,b .no
    ,b .name
from book3 as a 
-- join에서 on 대신 where을 쓸 수 있음.
-- inner join : on 조건에 맞게 두 데이블을  join
-- left join : left 테이블은 default에 on 조건에 맞는 right 테이블 join
-- left join publisher as b on b.no = a.publisher_cd;
inner join publisher as b on b.no = a.publisher_cd;

select
	a.no
    ,a.name
    ,a.publisher_cd
    ,(select name from publisher where no = a.publisher_cd)
from book3 as a;

