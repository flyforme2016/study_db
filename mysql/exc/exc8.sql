use nct;

CREATE TABLE IF NOT EXISTS `nct`.`infrCodeGroup` (
  `ifcgSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifcgSeqAnother` VARCHAR(50) NULL,
  `ifcgName` VARCHAR(100) NOT NULL,
  `ifcgNameEng` VARCHAR(100) NULL,
  `ifcgUseNy` TINYINT NULL,
  `ifcgOrder` TINYINT NULL,
  `ifcgReferenceV1` VARCHAR(50) NULL,
  `ifcgReferenceV2` VARCHAR(50) NULL,
  `ifcgReferenceV3` VARCHAR(50) NULL,
  `ifcgReferenceI1` INT NULL,
  `ifcgReferenceI2` INT NULL,
  `ifcgReferenceI3` INT NULL,
  `ifcgDesc` VARCHAR(255) NULL,
  `ifcgDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regSevDateTime` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modSevDateTime` DATETIME NULL,
  PRIMARY KEY (`ifcgSeq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `nct`.`infrCode` (
  `ifcdSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifcgSeq` BIGINT UNSIGNED NOT NULL,
  `ifcdSeqAnother` VARCHAR(50) NULL,
  `ifcdName` VARCHAR(50) NOT NULL,
  `ifcdNameEng` VARCHAR(50) NULL,
  `ifcdNameLan1` VARCHAR(50) NULL,
  `ifcdNameLan2` VARCHAR(50) NULL,
  `ifcdNameLan3` VARCHAR(50) NULL,
  `ifcdNameLan4` VARCHAR(50) NULL,
  `ifcdNameLan5` VARCHAR(50) NULL,
  `ifcdUseNy` TINYINT NULL,
  `ifcdOrder` TINYINT NULL,
  `ifcdReferenceV1` VARCHAR(50) NULL,
  `ifcdReferenceV2` VARCHAR(50) NULL,
  `ifcdReferenceV3` VARCHAR(50) NULL,
  `ifcdReferenceI1` VARCHAR(50) NULL,
  `ifcdReferenceI2` VARCHAR(50) NULL,
  `ifcdReferenceI3` VARCHAR(50) NULL,
  `ifcdDesc` VARCHAR(255) NULL,
  `ifcdDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regSevDateTime` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modSevDateTime` DATETIME NULL,
  PRIMARY KEY (`ifcdSeq`, `ifcgSeq`),
  INDEX `fk_infra_code_infra_code_group_idx` (`ifcgSeq` ASC) VISIBLE,
  CONSTRAINT `fk_infra_code_infra_code_group`
    FOREIGN KEY (`ifcgSeq`)
    REFERENCES `nct`.`infrCodeGroup` (`ifcgSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `nct`.`infrNationality` (
  `ifnaSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ifnaName` VARCHAR(50) NULL,
  `ifnaNameKor` VARCHAR(50) NULL,
  `ifnaNameEng` VARCHAR(50) NULL,
  `ifnaCode2Char` CHAR(2) NULL,
  `ifnaCode3Char` CHAR(3) NULL,
  `ifnaUseNy` TINYINT NULL,
  `ifnaOrder` TINYINT NULL,
  `ifnaDesc` VARCHAR(255) NULL,
  `ifnaDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regSevDateTime` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modSevDateTime` DATETIME NULL,
  PRIMARY KEY (`ifnaSeq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

INSERT INTO `nct`.`infrcodegroup`
(
`ifcgName`,
`ifcgUseNy`,
`ifcgOrder`,
`ifcgDelNy`,
`regDateTime`,
`regSevDateTime`,
`modDateTime`,
`modSevDateTime`)
VALUES
(
'회원보안질문.구분'
,1
,14
,0
,now()
,now()
,now()
,now()
);

select * from infrCodeGroup;

INSERT INTO `nct`.`infrcode`
(
`ifcgSeq`,
`ifcdName`,
`ifcdUseNy`,
`ifcdOrder`,
`ifcdDelNy`,
`regDateTime`,
`regSevDateTime`,
`modDateTime`,
`modSevDateTime`)
VALUES
(
14,
"본인 최애 노래는?",
1,
7,
0,
now(),
now(),
now(),
now()
);

INSERT INTO `nct`.`infrnationality`
(
`ifnaName`,
`ifnaCode2Char`,
`ifnaCode3char`,
`ifnaUseNy`,
`ifnaOrder`,
`ifnaDelNy`,
`regDateTime`,
`regSevDateTime`,
`ModDateTime`,
`ModSevDateTime`)
VALUES
(
"미국"
,"US"
,"USA"
,1
,2
,0
,now()
,now()
,now()
,now()
);

select a.ifcgSeq, a.ifcgName,
b.ifcdSeq, b.ifcdName, b.ifcdOrder
from infrCodeGroup a
left join infrCode b on b.ifcgSeq = a.ifcgSeq
order by a.ifcgSeq, b.ifcdOrder;

update infrCodeGroup set
	ifcg_name = '회원주소온라인.sns'
where
	ifcg_seq = 11;
    

alter table infrCodeGroup change modify_datetime modDateTime datetime;
alter table infrCodeGroup change modify_server_datetime modSevDateTime datetime;

alter table infrCodeGroup change modify_ip modIp varchar(100);
alter table infrCodeGroup change modify_seq modSeq bigint;
alter table infrCodeGroup change modify_device modDevice tinyint;

alter table infrCodeGroup modify ifcgSeqAnother varchar(50);
alter table infrCode change ifcg_seq ifcgSeq int;

select * from infrCodeGroup;
