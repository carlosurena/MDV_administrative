CREATE DATABASE MDV_ADMIN;

DROP TABLE IF EXISTS Permissions;
CREATE TABLE Permissions (
    PermissionID int NOT NULL AUTO_INCREMENT,
    PermissionName varchar(255),
    PermissionDescription varchar(255),
    CreatedBy varchar(50),
    CreatedOn DATETIME,
    UpdatedBy varchar(50),
    UpdatedOn DATETIME,
    PRIMARY KEY(PermissionID)
);

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
    UserID int NOT NULL AUTO_INCREMENT,
    Email varchar(255) UNIQUE,
    Password varchar(255),
    LastName varchar(255),
    FirstName varchar(255),
    PermissionID int NOT NULL,
    Ministry varchar(255),
    CreatedBy varchar(50),
    CreatedOn DATETIME,
    UpdatedBy varchar(50),
    UpdatedOn DATETIME,
    PRIMARY KEY(UserID),
    FOREIGN KEY(PermissionID) REFERENCES Permissions(PermissionID)
);


DROP TABLE IF EXISTS Members;
CREATE TABLE Members (
    MemberID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(255) NOT NULL,
    LastName varchar(255) NOT NULL,
    Gender varchar(1) NOT NULL,
    MemberType varchar(255),
    DateOfBirth DATETIME,
    Address varchar(255),
    City varchar(255),
    State varchar(255),
    Country varchar(255),
    DateVisited DATETIME,
    CreatedBy varchar(50),
    CreatedOn DATETIME,
    UpdatedBy varchar(50),
    UpdatedOn DATETIME,
    PRIMARY KEY(MemberID)
);

CREATE TABLE Finacial_Entries (
    EntryID int NOT NULL AUTO_INCREMENT,
    Amount DOUBLE NOT NULL,
    EntryType varchar(255) NOT NULL,
    MemberID int,
    EntryDate DATETIME,
    PRIMARY KEY(EntryID),
    FOREIGN KEY(MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Users (UserID, Email, Password, LastName, FirstName, PermissionID)
VALUES
    (null,"Admin@aol.com","password", "Adminson", "Admin", 1);

