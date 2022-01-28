use world;

CREATE TABLE IF NOT EXISTS `world`.`code_group` (
  `seq` VARCHAR(50) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`seq`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `world`.`code` (
  `code` VARCHAR(50) NOT NULL,
  `name` VARCHAR(45) NULL,
  `code_group_seq` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`code_group_seq`, `code`),
  CONSTRAINT `fk_code_code_group1`
    FOREIGN KEY (`code_group_seq`)
    REFERENCES `world`.`code_group` (`seq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into code_group (
seq
,name
) values (
'M01'
,'이동통신사'
);

select *from code_group;

insert into code (
code
,name
,code_group_seq
) values (
'3'
,'LGU+'
,'M01'
);

select *from code;

select cg.seq, cg.name, c.code, c.name
from code_group cg left join code c on cg.seq = c.code_group_seq;