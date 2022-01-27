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
'4차산업혁명의미래'
);

select *from book5;

insert into review5(
comment
,book5_no
) values (
'개꿀다라쉬'
,5
);

select *from review5;