CREATE DATABASE testdb;

USE testdb;

CREATE TABLE `quesans` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `QUESTIONS` varchar(1000) NOT NULL,
  `ANSWER` varchar(1000) DEFAULT NULL,
  `ANSWERTYPE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ;
CREATE TABLE `subquesans` (
  `SUBID` int NOT NULL AUTO_INCREMENT,
  `FK_ID` int DEFAULT NULL,
  `SUBQUESTIONS` varchar(1000) NOT NULL,
  `SUBQUESANSWER` varchar(1000) DEFAULT NULL,
  `SUBANSTYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SUBID`),
  KEY `fk_QUES` (`FK_ID`),
  CONSTRAINT `fk_QUES` FOREIGN KEY (`FK_ID`) REFERENCES `quesans` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
);
