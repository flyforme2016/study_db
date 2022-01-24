use world;

show tables;

-- 테이블 생성
create table member (
	seq int,
    name varchar(100),
    ud varchar(100),
    regdate datetime
);

create table cafe(
	seq int,
	cafename varchar(100),
    ttable int,
    chair int,
    address varchar(100),
    location varchar(100),
    ceo varchar(100)
);

CREATE TABLE IF NOT EXISTS `cafe` (
  `seq` INT NOT NULL,
  `cafename` VARCHAR(45) NULL,
  `ttable` INT NULL,
  `chair` INT NULL,
  `address` VARCHAR(45) NULL,
  `location` INT NULL,
  `ceo` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci

-- 테이블 삭제
drop table cafe;

-- 데이터 삽입
insert into cafe (
	seq
    ,cafename
    ,ttable
    ,chair
    ,address
    ,location
    ,ceo
) values (
	1
    ,'별다방'
    ,1
    ,2
    ,'서울시 어디쯤'
    ,1
    ,'장동건'
);

-- 테이블 데이터 조회	
select *from cafe;