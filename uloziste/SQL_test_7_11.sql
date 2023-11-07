CREATE TABLE `Uzivatel` (
  `userID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `username` varchar(255),
  `bday` date,
  `mail` varchar(255),
  `penezenka` int,
  `knihovna` varchar(255),
  `pratele` int,
  `jmeno` varchar(255),
  `heslo` varchar(255),
  `karty` int,
  `achievementy` int
);

CREATE TABLE `Games` (
  `hryID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nazev` varchar(255),
  `popis` varchar(255),
  `zanr` varchar(255)
);

CREATE TABLE `Predmety` (
  `inventarID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `hra` int,
  `nazev` varchar(255),
  `tradeable` boolean,
  `sellable` boolean,
  `tag` varchar(255),
  `owner` int
);

CREATE TABLE `Karty` (
  `kartaID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cisloKarty` int,
  `datumPlatnosti` date,
  `jmeno` varchar(255),
  `active` varchar(255)
);

CREATE TABLE `Achievement` (
  `achID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `hra` int,
  `jmeno` varchar(255),
  `secret` boolean
);

ALTER TABLE `Games` ADD FOREIGN KEY (`hryID`) REFERENCES `Predmety` (`hra`);

ALTER TABLE `Uzivatel` ADD FOREIGN KEY (`karty`) REFERENCES `Karty` (`kartaID`);

ALTER TABLE `Games` ADD FOREIGN KEY (`hryID`) REFERENCES `Achievement` (`achID`);

ALTER TABLE `Uzivatel` ADD FOREIGN KEY (`userID`) REFERENCES `Uzivatel` (`pratele`);

CREATE TABLE `Uzivatel_Achievement` (
  `Uzivatel_achievementy` int,
  `Achievement_achID` int,
  PRIMARY KEY (`Uzivatel_achievementy`, `Achievement_achID`)
);

ALTER TABLE `Uzivatel_Achievement` ADD FOREIGN KEY (`Uzivatel_achievementy`) REFERENCES `Uzivatel` (`achievementy`);

ALTER TABLE `Uzivatel_Achievement` ADD FOREIGN KEY (`Achievement_achID`) REFERENCES `Achievement` (`achID`);


CREATE TABLE `Uzivatel_Games` (
  `Uzivatel_knihovna` varchar(255),
  `Games_hryID` int,
  PRIMARY KEY (`Uzivatel_knihovna`, `Games_hryID`)
);

ALTER TABLE `Uzivatel_Games` ADD FOREIGN KEY (`Uzivatel_knihovna`) REFERENCES `Uzivatel` (`knihovna`);

ALTER TABLE `Uzivatel_Games` ADD FOREIGN KEY (`Games_hryID`) REFERENCES `Games` (`hryID`);

