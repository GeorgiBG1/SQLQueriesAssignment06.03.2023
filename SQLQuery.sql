CREATE DATABASE MinionsDB
GO
USE MinionsDB
GO
CREATE TABLE Countries
([Id] INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(200))

CREATE TABLE Towns
([Id] INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(200),
[CountryCode] INT
CONSTRAINT FK_TownCountry FOREIGN KEY (CountryCode)
REFERENCES Countries([Id])
)

CREATE TABLE Minions
([Id] INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(200),
[Age] INT,
[TownId] INT
CONSTRAINT FK_MinionTown FOREIGN KEY (TownId)
REFERENCES Towns([Id])
)


CREATE TABLE EvilnessFactors
(
[Id] INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(200)
)
CREATE TABLE Villians
(
[Id] INT IDENTITY PRIMARY KEY,
[Name] VARCHAR(200),
[EvilnessFactorId] INT
CONSTRAINT FK_VillianEvilnessFactor FOREIGN KEY (EvilnessFactorId)
REFERENCES EvilnessFactors([Id])
)

CREATE TABLE MinionsVillians
(
[MinionId] INT
CONSTRAINT FK_MinionVilliansMinion FOREIGN KEY (MinionId)
REFERENCES Minions([Id]),
[VillianId] INT
CONSTRAINT FK_MinionVilliansVillian FOREIGN KEY (VillianId)
REFERENCES Villians([Id])
)

INSERT INTO EvilnessFactors ([Name])
VALUES 
('Very good'),
('Good'),
('Evil'),
('Very evil'),
('Bad')
INSERT INTO Villians ([Name],[EvilnessFactorId]) VALUES
('Gru', 1), 
('Victor', 3),
('Jilly', 4),
('June', 2),
('Dino', 5),
('Peter', 2),
('Poppy', 1)

INSERT INTO Countries ([Name])
VALUES
('Germany'),
('England'),
('Bulgaria'),
('Netherlands'),
('Spain')

INSERT INTO Towns ([Name], [CountryCode])
VALUES
('Berlin', 1),
('Liverpool', 2),
('Sofia', 3),
('Burgas', 3),
('Varna', 3),
('Eindhoven', 4),
('Madrid', 5)

INSERT INTO Minions ([Name], [Age], [TownId])
VALUES
('Bob', 13, 1),
('Kevin', 14, 5),
('Steward', 19, 7),
('Mars', 23, 3),
('Cathleen', 20, 2),
('Carry', 20, 6),
('Simon',16, 4)

INSERT INTO MinionsVillians
VALUES
(1, 6),
(1, 12),
(1, 8),
(1, 9),
(2, 6),
(2, 7),
(2, 10),
(2, 8),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(4, 6),
(4, 9),
(4, 8),
(4, 7),
(5, 6),
(5, 9),
(5, 7),
(6, 7),
(6, 11),
(6, 8),
(6, 9),
(6, 10),
(7,7)
SELECT * FROM EvilnessFactors
SELECT * FROM Countries
SELECT * FROM Towns
SELECT * FROM Minions
SELECT * FROM Villians
SELECT * FROM MinionsVillians

SELECT v.[Name], m.[Name] FROM Villians AS v
LEFT OUTER JOIN MinionsVillians AS mv
ON v.Id = mv.VillianId
LEFT OUTER JOIN Minions AS m
ON mv.MinionId = m.Id
WHERE mv.VillianId = v.Id

SELECT  COUNT(*) FROM Villians AS v
