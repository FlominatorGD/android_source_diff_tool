-- Drop the database if it exists
DROP DATABASE IF EXISTS sourcetable;

-- Create a new database
CREATE DATABASE sourcetable;

-- Use sourcetable
USE sourcetable;

-- [Source] --(contains)----< [Folder]
--   |                        |
--   |                        |
--   >---------------------<  |
--   |                        |
--   |                        |
-- [Folder] --(contains)----< [File]
--   |                        |
--   |                        |
--   >---------------------<  |
--   |                        |
--   |                        |
-- [File] --(contains)----< [Row/Column]
--   |                        |
--   |                        |
--   >---------------------<  |
--   |                        |
--   |                        |
-- [Row/Column] --(contains)----< [Character]

-- Create table for Source
CREATE TABLE Source_t (
    SourceID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL UNIQUE
);

-- Create table for Folder
CREATE TABLE Folder_t (
    FolderID INT AUTO_INCREMENT PRIMARY KEY,
    SourceID INT,
    Name VARCHAR(255) NOT NULL,
    FOREIGN KEY (SourceID) REFERENCES Source_t(SourceID),
    UNIQUE (SourceID, Name) -- Name of the folder must be unique within a source
);

-- Create table for File
CREATE TABLE File_t (
    FileID INT AUTO_INCREMENT PRIMARY KEY,
    FolderID INT,
    Name VARCHAR(255) NOT NULL,
    FOREIGN KEY (FolderID) REFERENCES Folder_t(FolderID),
    UNIQUE (FolderID, Name) -- Name of the file must be unique within a folder
);

-- Create table for Row/Column
CREATE TABLE Row_Column_t (
    RowColumnID INT AUTO_INCREMENT PRIMARY KEY,
    FileID INT,
    Number INT NOT NULL, -- Row or column number
    FOREIGN KEY (FileID) REFERENCES File_t(FileID),
    UNIQUE (FileID, Number) -- Number must be unique within a file
);

-- Create table for Character
CREATE TABLE Character_t (
    CharacterID INT AUTO_INCREMENT PRIMARY KEY,
    RowColumnID INT,
    CharacterPosition INT NOT NULL,
    CharacterValue CHAR(1) NOT NULL,
    FOREIGN KEY (RowColumnID) REFERENCES Row_Column_t(RowColumnID),
    UNIQUE (RowColumnID, CharacterPosition) -- Character position must be unique within a row/column
);
