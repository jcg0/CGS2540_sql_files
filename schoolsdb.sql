START TRANSACTION;

CREATE DATABASE IF NOT EXISTS `schoolsdb` DEFAULT CHARACTER
SET
  utf8 COLLATE utf8_general_ci;

USE `schoolsdb`;

CREATE TABLE
  if not exists `coursestbl` (
    `courseid` INT (11) NOT NULL,
    `department` CHAR(4) NOT NULL,
    `coursenumber` CHAR(4) NOT NULL,
    `credits` INT (11) NOT NULL,
    `name` VARCHAR(45) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
  `coursestbl` (
    `courseid`,
    `department`,
    `coursenumber`,
    `credits`,
    `name`
  )
VALUES
  (1, 'CGS', '2004', 3, 'Advanced Office'),
  (2, 'COP', '2000', 3, 'Programming'),
  (3, 'CGS', '2540', 3, 'Database Managment'),
  (4, 'CGS', '1820', 3, 'Web Authoring'),
  (5, 'CIS', '1254', 3, 'Professional Development');

CREATE TABLE
  if not exists `sectionstbl` (
    `sectionid` INT (11) NOT NULL,
    `studentsectionfk` INT (11) NOT NULL,
    `coursesectionfk` INT (11) NOT NULL,
    `semester` CHAR(6) NOT NULL,
    `grade` Decimal(2, 1)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
  `sectionstbl` (
    `sectionid`,
    `studentsectionfk`,
    `coursesectionfk`,
    `semester`,
    `grade`
  )
VALUES
  (1, 4, 3, '202303', 3.5),
  (2, 2, 5, '202303', 2.5),
  (3, 1, 2, '202303', 4.0),
  (4, 3, 3, '202303', 0.0),
  (5, 2, 5, '202303', 2.5),
  (6, 5, 1, '202303', 3.0);

CREATE TABLE
  if not exists `studentstbl` (
    `studentid` INT (11) NOT NULL,
    `firstname` VARCHAR(45) NOT NULL,
    `lastname` VARCHAR(45) NOT NULL,
    `schoolid` CHAR(8) NOT NULL,
    `startdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

INSERT INTO
  `studentstbl` (
    `studentid`,
    `firstname`,
    `lastname`,
    `schoolid`,
    `startdate`
  )
VALUES
  (
    1,
    'Alex',
    'Agnew',
    '05162457',
    '2023-08-15 00:00:00'
  ),
  (
    2,
    'Brie',
    'Brown',
    '04995684',
    '2023-07-25 00:00:00'
  ),
  (
    3,
    'Clara',
    'Carter',
    '06124512',
    '2023-07-31 00:00:00'
  ),
  (
    4,
    'Dani',
    'Draper',
    '06112451',
    '2023-08-02 00:00:00'
  ),
  (
    5,
    'Ella',
    'Eastman',
    '06231524',
    '2023-08-02 00:00:00'
  );

ALTER TABLE `coursestbl` ADD PRIMARY KEY (`coursesid`);

ALTER TABLE `sectionstbl` ADD PRIMARY KEY (`sectionid`),
ADD KEY `studentsectionfk` (`studentsectionfk`),
ADD KEY `coursesectionfk` (`coursesectionfk`);

ALTER TABLE `studentstbl` ADD PRIMARY KEY (`studentid`);

ALTER TABLE `coursestbl` MODIFY `courseid` int (11) NOT NULL AUTO_INCRAMENT,
AUTO_INCRAMENT = 1;

ALTER TABLE `sectionstbl` MODIFY `sectionid` int (11) NOT NULL AUTO_INCRAMENT,
AUTO_INCRAMENT = 1;

ALTER TABLE `studentstbl` MODIFY `studentid` int (11) NOT NULL AUTO_INCRAMENT,
AUTO_INCRAMENT = 1;

ALTER TABLE `sectionstbl` ADD CONSTRAINT `sectionstbl_ibfk_1` FOREIGN KEY (`studentsectionfk`) REFERENCES `studentstbl` (`studentid`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `sectionstbl_ibfk_2` FOREIGN KEY (`coursesectionfk`) REFERENCES `coursestbl` (`courseid`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;