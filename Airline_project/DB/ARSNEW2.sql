DROP DATABASE IF EXISTS ARSNEW2;
CREATE DATABASE ARSNEW2;
USE ARSNEW2;

DROP TABLE IF EXISTs User;
CREATE TABLE User(
Id varchar(45) not null primary key,
First_Name varchar(45) not null,
Last_Name varchar(45) not null,
Password varchar(45) not null,
Gender varchar(45) not null,
Contact long not null,
User_Type varchar(45) default "user"
);

drop table flight;
CREATE TABLE `arsnew2`.`flight` (
  `Flight_No` int NOT NULL auto_increment,
  `Flight_Name` VARCHAR(45) NOT NULL,
  `Source` VARCHAR(45) NOT NULL,
  `Destination` VARCHAR(45) NOT NULL,
  `Takeoff_Time` TIME NOT NULL,
  `Landing_Time` TIME NOT NULL,
  `Business_Cost` INT NOT NULL,
  `Economy_Cost` INT NOT NULL,
  `Available_Tickets` INT NOT NULL,
  `Travel_Date` DATE NOT NULL,
  `Id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Flight_No`),
  INDEX `id1_fk_idx` (`Id` ASC) VISIBLE,
  CONSTRAINT `id1_fk`
    FOREIGN KEY (`Id`)
    REFERENCES `arsnew2`.`user` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
DROP TABLE IF EXISTs booking_details;
CREATE TABLE `arsnew2`.`booking_details` (
  `Booking_Id` INT NOT NULL auto_increment,
  `Class_Type` VARCHAR(45) NOT NULL,
  `Booking_Date` DATE NOT NULL,
  `Passport_No` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NOT NULL,
  `DOB` DATE NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `Card_No` VARCHAR(45) NOT NULL,
  `Name_On_Card` VARCHAR(45) NOT NULL,
  `Type_Of_Payment` VARCHAR(45) NOT NULL,
  `Total_Amount` INT NOT NULL,
  `Flight_No` int NOT NULL,
  `Id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Booking_Id`),
  INDEX `flight_no_fk_idx` (`Flight_No` ASC) VISIBLE,
  INDEX `id2_fk_idx` (`Id` ASC) VISIBLE,
  CONSTRAINT `flight_no_fk`
    FOREIGN KEY (`Flight_No`)
    REFERENCES `arsnew2`.`flight` (`Flight_No`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `id2_fk`
    FOREIGN KEY (`Id`)
    REFERENCES `arsnew2`.`user` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
insert into User(Id,First_Name, Last_Name,Password,Gender,Contact,User_Type) 
values("admin1@gmail.com","admin1","admin1","admin@1","Male",1234567890,"admin"),
("admin2@gmail.com","admin2","admin2","admin@2","Female",1234567890,"admin"),
("jay@gmail.com","Jay","Kumar","jayk","Male",9090212133);
select * from User;


insert into flight(Flight_Name, Source, Destination, Takeoff_Time, Landing_Time, Business_Cost, Economy_Cost, Available_Tickets, Travel_Date, Id) 
values("IndiGo","Mumbai","Hyderabad","23:00","07:30",6000,3000,100,"2021-05-15","admin1@gmail.com");
insert into flight(Flight_Name, Source, Destination, Takeoff_Time, Landing_Time, Business_Cost, Economy_Cost, Available_Tickets, Travel_Date, Id) 
values("Emirates","cochin","Banglore","12:30","04:30",6000,3500,90,"2021-04-23","admin1@gmail.com");

INSERT INTO flight(Flight_Name, Source, Destination, Takeoff_Time, Landing_Time, Business_Cost, Economy_Cost, Available_Tickets, Travel_Date, Id) 
values("Emirates","NC","DFW","12:30","04:30",6000,3500,90,"2023-04-27","admin1@gmail.com");

delete from flight where flight_no in (8,6,5,7);

select * from flight;    -- To get data of flight table please import flight.csv here

insert into booking_details (Booking_Id, Class_Type, Booking_Date, Passport_No,Name,DOB,Gender, Card_No, Name_On_Card, Type_Of_Payment, Total_Amount, Flight_No, Id) 
values(2,"Business","2021-06-11","U12677","Jay Kumar","1985-05-10","Male","1735983276351826","Jay Kumar","Debit Card",5000,"101","jay@gmail.com");
select * from booking_details;
create table meals(flight_no int primary key,meal_type varchar(20),meal_availability varchar(20));
insert into meals values(1,"vegetarian",100);
insert into meals values(11,"non-vegetarian",40);
create table baggage(flight_no int primary key,baggage_type varchar(20),weight int,allowed_no int);
select * from meals;
insert into baggage values(11,"checked_baggage",
show variables like 'secure_file_priv';
set global secure_file_priv='';

LOAD DATA INFILE 'D:\1st SEM\FDB\Project\DB\DB\flight.csv' 
INTO TABLE flight
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;