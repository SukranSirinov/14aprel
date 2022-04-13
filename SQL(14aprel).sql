CREATE DATABASE Kitabxana
USE Kitabxana
CREATE TABLE Authors
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30) NOT NULL  ,
Surname NVARCHAR(30) NOT NULL ,
)
DROP TABLE Books
CREATE TABLE Books
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(30) NOT NULL  CHECK (LEN(Name) BETWEEN 2 AND 100),
AuthorId INT CONSTRAINT AI_CHECK FOREIGN KEY REFERENCES  Authors(Id),
PageCount INT NOT NULL CHECK (PageCount>=10)

)
INSERT INTO Authors
VALUES
('Orxan','Zeynalli'),
('Ramiz','Rovsen'),
('Osho','Testov'),
('Test','Abbasov')
INSERT INTO Books
VALUES
('ARTveXAOS',1,10),
('1ciADDIM',2,15),
('2ciADDIM',3,20),
('3ciADDIM',4,10)
DELETE FROM Books


CREATE VIEW ALL_LIBRARY
AS
SELECT B.Id,B.Name,B.PageCount,A.Name+''+A.Surname AS 'AuthorFullName' FROM Books AS B
JOIN Authors AS A
ON B.AuthorId=A.Id


 CREATE PROCEDURE ALL_AuthorFullName
 @AuthorFullName NVARCHAR(30)
 AS
SELECT *FROM ALL_LIBRARY
WHERE AuthorFullName=@AuthorFullName


EXEC ALL_AuthorFullName 'OrxanZeynalli'

CREATE PROCEDURE USP_INSERT_Authors
@Name NVARCHAR(30),
@Surname NVARCHAR(30)
AS
INSERT INTO Authors(Name,Surname)
VALUES
(@Name,@Surname)

CREATE PROCEDURE USP_UPDATE_Authors
@Name NVARCHAR(30)
AS
UPDATE Authors
SET Name=@Name
WHERE Name=@Name


CREATE PROCEDURE USP_DELETE_Authors

AS
DELETE Authors

CREATE PROCEDURE USP_COUNT_AUTHOR
AS
SELECT COUNT(Id) FROM Authors WHERE Authors.Id=1

CREATE PROCEDURE USP_FullName_AUTHOR
AS
SELECT Name+''+Surname AS 'AuthorFullName' FROM Authors 
