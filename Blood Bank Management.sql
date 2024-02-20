CREATE DATABASE IF NOT EXISTS Bloodbank_world3;
USE Bloodbank_world3;

CREATE TABLE IF NOT EXISTS BB_Manager (
    M_id INT NOT NULL PRIMARY KEY,
    mName VARCHAR(100) NOT NULL,
    m_phNo BIGINT
);

INSERT INTO BB_Manager VALUES
(102,'Jack', 4693959671),
(103,'Peter', 4693959601),
(104,'Mark', 4693959677),
(105,'Jason', 4693957671),
(106,'Steve', 4694959671),
(107,'Jason', 4695959671),
(108,'Stella', 4663959671),
(109,'Monika', 4673959671),
(110,'John', 4693859671);

CREATE TABLE IF NOT EXISTS Blood_Donor (
    bd_ID INT NOT NULL PRIMARY KEY,
    bd_name VARCHAR(50) NOT NULL,
    bd_age INT,
    bd_sex VARCHAR(8),
    bd_Bgroup VARCHAR(10),
    bd_reg_date DATE,
    reco_ID INT NOT NULL,
    City_ID INT NOT NULL
);

INSERT INTO Blood_Donor VALUES
(150221,'Mark',25,'M','B+','2015-12-17',101212,1100),
(160011,'Abdul',35,'F','A+','2016-11-22',101212,1100),
(160101,'Smith',22,'M','O+','2016-01-04',101312,1200),
(150011,'Pat',29,'M','O+','2015-07-19',101412,1300),
(150021,'Shyam',42,'F','A-','2015-12-24',101412,1300),
(150121,'Dan',44,'M','AB+','2015-08-28',101212,1200),
(160031,'Mike',33,'F','AB-','2016-02-06',101212,1400),
(160301,'Elisa',31,'F','AB+','2016-09-10',101312,1200),
(160091,'Carrol',24,'M','B-','2016-10-15',101312,1500),
(160401,'Mark',29,'M','O-','2016-12-17',101212,1200);

CREATE TABLE IF NOT EXISTS BloodSpecimen (
    specimen_number INT NOT NULL PRIMARY KEY,
    b_group VARCHAR(10) NOT NULL,
    dfind_ID INT NOT NULL,
    M_id INT NOT NULL,
    specimenumber_pk INT
);

INSERT INTO BloodSpecimen VALUES
(1001, 'B+', 1,11,101),
(1002, 'O+', 1,12,102),
(1003, 'AB+', 1,11,102),
(1004, 'O-', 1,13,103),
(1005, 'A+', 0,14,101),
(1006, 'A-', 1,13,104),
(1007, 'AB-', 1,15,104),
(1008, 'AB-', 0,11,105),
(1009, 'B+', 1,13,105),
(1010, 'O+', 0,12,105),
(1011, 'O+', 1,13,103),
(1012, 'O-', 1,14,102),
(1013, 'B-', 1,14,102),
(1014, 'AB+', 0,15,101);

CREATE TABLE IF NOT EXISTS City (
    City_ID INT NOT NULL,
    City_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (City_ID)
);

INSERT INTO City VALUES
(1100,'Austin'),
(1200,'Irving'),
(1300,'Houston'),
(1400,'Richardson'),
(1500,'Plano'),
(1600,'Frisco'),
(1700,'Arlington'),
(1800,'San Antonio'),
(1900,'Tyler');

CREATE TABLE IF NOT EXISTS DiseaseFinder (
    dfind_ID INT NOT NULL PRIMARY KEY,
    dfind_name VARCHAR(40) NOT NULL,
    dfind_PhNo BIGINT
);

INSERT INTO DiseaseFinder VALUES
(11,'Peter',4693804223),
(12,'Park',4693804223),
(13,'Jerry',4693804223),
(14,'Mark',4693804223),
(15,'Monika',4693804223),
(16,'Ram',4693804123),
(17,'Swathi',4693804223),
(18,'Gautham',4693804323),
(19,'Ashwin',4693804423),
(20,'Yash',4693804523);

CREATE TABLE IF NOT EXISTS Hospital_Info_1 (
    hosp_ID INT NOT NULL PRIMARY KEY,
    hosp_name VARCHAR(50) NOT NULL,
    City_ID INT NOT NULL,
    M_id INT NOT NULL
);

INSERT INTO Hospital_Info_1 VALUES
(1,'MayoClinic',1100,101),
(2,'CleavelandClinic',1200,103),
(3,'NYU',1300,103),
(4,'Baylor',1400,104),
(5,'Charlton',1800,103),
(6,'Greenoaks',1300,106),
(7,'Forestpark',1300,102),
(8,'Parkland',1200,106),
(9,'Pinecreek',1500,109),
(10,'WalnutHill',1700,105);

CREATE TABLE IF NOT EXISTS Hospital_Info_2 (
    hosp_ID INT NOT NULL,
    hosp_name VARCHAR(50) NOT NULL,
    hosp_needed_Bgrp VARCHAR(10) NOT NULL,
    hosp_needed_qnty INT,
    PRIMARY KEY(hosp_ID,hosp_needed_Bgrp)
);

INSERT INTO Hospital_Info_2 VALUES
(1,'MayoClinic','A+',20),
(1,'MayoClinic','AB+',0),
(1,'MayoClinic','A-',40),
(1,'MayoClinic','B-',10),
(1,'MayoClinic','AB-',20),
(2,'CleavelandClinic','A+',40),
(2,'CleavelandClinic','AB+',20),
(2,'CleavelandClinic','A-',10),
(2,'CleavelandClinic','B-',30),
(2,'CleavelandClinic','B+',0),
(2,'CleavelandClinic','AB-',10),
(3,'NYU','A+',0),
(3,'NYU','AB+',0),
(3,'NYU','A-',0),
(3,'NYU','B-',20),
(3,'NYU','B+',10),
(3,'NYU','AB-',0),
(4,'Baylor','A+',10),
(4,'Baylor','A-',40),
(5,'Charlton','B+',30),
(7,'Forestpark','B-',40),
(8,'Parkland','B+',10),
(9,'Pinecreek','AB-',20);

CREATE TABLE IF NOT EXISTS Recipient (
    reci_ID INT NOT NULL PRIMARY KEY,
    reci_name VARCHAR(50) NOT NULL,
    reci_age INT,
    reci_Brgp VARCHAR(20),
    reci_Bqnty FLOAT,
    reco_ID INT NOT NULL,
    City_ID INT NOT NULL,
    M_id INT NOT NULL,
    reci_sex VARCHAR(20),
    reci_reg_date DATE
);

INSERT INTO Recipient VALUES
(10001,'Mark',25,'B+',1.5,101212,1100,101,'M','2015-12-17'),
(10002,'Dan',60,'A+',1,101312,1100,102,'M','2015-12-16'),
(10003,'Steve',35,'AB+',0.5,101312,1200,102,'M','2015-10-17'),
(10004,'Parker',66,'B+',1,101212,1300,104,'M','2016-11-17'),
(10005,'Jason',53,'B-',1,101412,1400,105,'M','2015-04-17'),
(10006,'Preetham',45,'O+',1.5,101512,1500,105,'M','2015-12-17'),
(10007,'Swetha',22,'AB-',1,101212,1500,101,'F','2015-05-17'),
(10008,'Swathi',25,'B+',2,101412,1300,103,'F','2015-12-14'),
(10009,'Lance',30,'A+',1.5,101312,1100,104,'M','2015-02-16'),
(10010,'Marsh',25,'AB+',3.5,101212,1200,107,'M','2016-10-17');

CREATE TABLE IF NOT EXISTS Recording_Staff (
    reco_ID INT NOT NULL PRIMARY KEY,
    reco_Name VARCHAR(30) NOT NULL,
    reco_phNo BIGINT
);

INSERT INTO Recording_Staff VALUES
(101212,'Walcot',4045806553),
(101312,'Henry',4045806553),
(101412,'Silva',4045806553),
(101512,'Adrian',4045806553),
(101612,'Mark',4045806553),
(101712,'Abdul',4045816553),
(101812,'Jerry',4045826553),
(101912,'Tim',4045836553),
(101012,'Lekha',4044846553),
(101112,'Mark',4045856553);
