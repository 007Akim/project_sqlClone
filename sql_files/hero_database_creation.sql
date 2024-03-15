CREATE DATABASE SUPERHERO;

USE SUPERHERO;

CREATE TABLE Hero (
    Id INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Powerstats (
    Id INT PRIMARY KEY,
    Intelligence INT,
    Strength INT,
    Speed INT,
    Surability INT,
    Power INT,
    Combat INT,
    Overall_ps INT,
    FOREIGN KEY (Id) REFERENCES Hero(Id)
);

CREATE TABLE Appearance (
    Id INT PRIMARY KEY,
    Gender VARCHAR(255),
    Race VARCHAR(255),
    Height VARCHAR(255),
    Weight VARCHAR(255),
    FOREIGN KEY (Id) REFERENCES Hero(Id)
);


CREATE TABLE Biography (
    Id INT PRIMARY KEY,
    Publisher VARCHAR(255),
    Alignment VARCHAR(255),
    Year INT,
    FOREIGN KEY (Id) REFERENCES Hero(Id)
);

SHOW tables;

ALTER TABLE Powerstats
CHANGE COLUMN Surability Durability INT;