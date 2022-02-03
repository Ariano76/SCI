create table EmployeeRecords
( EmpId int, EmpName varchar(100), EmpAge int, EmpSalary float) 
ENGINE=INNODB;

-- sobre una columna
CREATE TABLE articles (
id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, 
titulo VARCHAR(200), 
descripcion TEXT, 
FULLTEXT (descripcion)
) ENGINE=MyISAM;
 
-- sobre dos columnas
CREATE TABLE articles (
id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
titulo VARCHAR(200), 
descripcion TEXT, 
FULLTEXT (titulo,descripcion)
) ENGINE=MyISAM;