-- Drop the database if it exists
DROP DATABASE IF EXISTS sourcetable;

-- Create a new database
CREATE DATABASE sourcetable;

-- Use sourcetable
USE sourcetable;

-- Create Source table
CREATE TABLE Source_t (
    SourceID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE
);

-- Create Folder table
CREATE TABLE Folder_t (
    FolderID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE,
    SourceID INT,
    FOREIGN KEY (SourceID) REFERENCES Source_t(SourceID)
);

-- Create File table
CREATE TABLE File_t (
    FileID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE,
    Type VARCHAR(50),
    FolderID INT,
    FOREIGN KEY (FolderID) REFERENCES Folder_t(FolderID)
);

-- Create Line table
CREATE TABLE Line_t (
    LineID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE,
    FileID INT,
    FOREIGN KEY (FileID) REFERENCES File_t(FileID)
);

-- Create Colum table
CREATE TABLE Column_t (
    ColumnID INT PRIMARY KEY,
    Name VARCHAR(255) UNIQUE,
    LineID INT,
    FOREIGN KEY (LineID) REFERENCES Line_t(LineID)
);

-- Create Character table
CREATE TABLE Character_t (
    CharacterID INT PRIMARY KEY,
    Value CHAR(1),
    LineID INT,
    FOREIGN KEY (LineID) REFERENCES Line_t(LineID)
);
