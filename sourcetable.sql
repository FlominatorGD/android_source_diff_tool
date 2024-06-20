-- Drop the database if it exists
DROP DATABASE IF EXISTS sourcetable;

-- Create a new database
CREATE DATABASE sourcetable;

-- Use sourcetable
USE sourcetable;

-- Create Source table
CREATE TABLE Source (
    SourceID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE
);

-- Create Folder table
CREATE TABLE Folder (
    FolderID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE,
    SourceID INT,
    FOREIGN KEY (SourceID) REFERENCES Source(SourceID)
);

-- Create File table
CREATE TABLE File (
    FileID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE,
    Type VARCHAR(50),
    FolderID INT,
    FOREIGN KEY (FolderID) REFERENCES Folder(FolderID)
);

-- Create Line table
CREATE TABLE Line (
    LineID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE,
    FileID INT,
    FOREIGN KEY (FileID) REFERENCES File(FileID)
);

-- Create Colum table
CREATE TABLE Column (
    ColumnID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE,
    LineID INT,
    FOREIGN KEY (LineID) REFERENCES Line(LineID)
);

-- Create Character table
CREATE TABLE Character (
    CharacterID INT PRIMARY KEY,
    Value CHAR(1),
    LineID INT,
    FOREIGN KEY (LineID) REFERENCES Line(LineID)
);
