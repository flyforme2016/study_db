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
COLLATE = utf8mb4_unicode_ci;

-- 테이블 삭제
drop table cafe;
drop table test2;

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
	10
    ,'달고나커피'
    ,10
    ,10
    ,'만수점'
    ,10
    ,'장경준'
);

-- 테이블 데이터 조회	
select *from cafe;
select *from test;

select *from cafe where seq = 3;
select *from cafe where cafename = '스타벅스';

select *from cafe where cafename like  '%타벅%';
select *from cafe where cafename like  '타벅%';
select *from cafe where cafename like  '%타벅';

-- 테이블 수정

-- 컬럼 추가
alter table test add tel varchar(50);
desc test;
select *from test;

-- 컬럼 삭제
alter table test drop tel;
desc test;
select *from test;

-- 컬럼 이름 변경
alter table test change tel tele int;
alter table test change tele tel int;
select *from test;

-- 컬럼 타입 변경
alter table test modify tel int;
desc test;
select *from test;

-- 데이터 수정
update test set
	name ='Andrew'
where
	seq = 1;
    
-- 데이터 삭제
delete from test
where seq=1;

-- 전체 데이터 삭제
truncate test;

show tables;

select *from test;
desc test;

-- DDL(Data Definition Language) : DB, Table 관리자 -> 주로 선임들의 업무(alter) 
-- DML(Data Manipulation Language) : data -> 주로 후임들의 업무
-- DCL(Data Control Language) : 접근 권한, 커밋/롤백ㅍ