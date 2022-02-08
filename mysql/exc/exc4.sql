use world;

CREATE TABLE IF NOT EXISTS `book5` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `world`.`review5` (
  `no` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(45) NOT NULL,
  `book5_no` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`no`, `book5_no`),
  INDEX `fk_review5_book51_idx` (`book5_no` ASC) VISIBLE,
  CONSTRAINT `fk_review5_book51`
    FOREIGN KEY (`book5_no`)
    REFERENCES `world`.`book5` (`no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- 1 이것이자바다
-- 2 프로그래밍가이드북
-- 3 안드로이드
-- 4 4차산업혁명의미래

desc book5;

insert into book5(
name
) values (
'Sqlplus'
);

select *from book5;

insert into review5(
comment
,book5_no
) values (
'개꿀다라쉬3'
,4
);

select *from review5;

select a.name
,(select count(*) from review5 where book5_no = a.no) as count
from book5 as a; 

select a.name
, b.comment
from book5 as a
-- left join review5 as b on b.book5_no = a.no -> null값인 Sqlplus도 join됨
inner join review5 as b on b.book5_no = a.no -- null값인 Sqlplus는 출력되지 않음
;

select a.comment
, b.name
from review5 as a
left join book5 as b on b.no = a.book5_no;