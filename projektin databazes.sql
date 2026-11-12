USE ProjektSoftware;
GO

-- 1. Projekte
IF OBJECT_ID('Projekte', 'U') IS NULL
BEGIN
    CREATE TABLE Projekte (
        ProjektID INT IDENTITY(1,1) PRIMARY KEY,
        EmriProjektit VARCHAR(100),
        DataFillimit DATE,
        Statusi VARCHAR(50)
    );
END
GO

-- 2. Punonjes
IF OBJECT_ID('Punonjes', 'U') IS NULL
BEGIN
    CREATE TABLE Punonjes (
        PunonjesID INT IDENTITY(1,1) PRIMARY KEY,
        Emri VARCHAR(100),
        Roli VARCHAR(50)
    );
END
GO
USE ProjektSoftware;
GO

SELECT name 
FROM sys.tables;

-- 3. Detyra (varet nga dy të parat)
IF OBJECT_ID('Detyra', 'U') IS NULL
BEGIN
    CREATE TABLE Detyra (
        DetyraID INT IDENTITY(1,1) PRIMARY KEY,
        Pershkrimi VARCHAR(200),
        Afati DATE,
        Statusi VARCHAR(50),
        ProjektID INT,
        PunonjesID INT,
        CONSTRAINT FK_Detyra_Projekte 
            FOREIGN KEY (ProjektID) REFERENCES Projekte(ProjektID),
        CONSTRAINT FK_Detyra_Punonjes 
            FOREIGN KEY (PunonjesID) REFERENCES Punonjes(PunonjesID)
    );
END
GO

IF NOT EXISTS (SELECT 1 FROM Projekte)
BEGIN
    INSERT INTO Projekte (EmriProjektit, DataFillimit, Statusi)
    VALUES 
    ('Sistem Menaxhimi', '2026-01-20', 'Aktiv'),
    ('Website Kompanie', '2026-01-22', 'Ne proces');
END

IF NOT EXISTS (SELECT 1 FROM Punonjes)
BEGIN
    INSERT INTO Punonjes (Emri, Roli)
    VALUES 
    ('Ardi Kola', 'Programues'),
    ('Elira Meta', 'Testuese');
END
IF NOT EXISTS (SELECT 1 FROM Detyra)
BEGIN
    INSERT INTO Detyra (Pershkrimi, Afati, Statusi, ProjektID, PunonjesID)
    VALUES
    ('Zhvillim backend', '2026-02-01', 'Ne proces', 1, 1),
    ('Testim sistemi', '2026-02-05', 'Ne pritje', 1, 2);
END

SELECT name FROM sys.databases;
SELECT P.EmriProjektit, D.Pershkrimi, D.Statusi
FROM Projekte P
JOIN Detyra D ON P.ProjektID = D.ProjektID;
SELECT Pu.Emri, D.Pershkrimi
FROM Punonjes Pu
JOIN Detyra D ON Pu.PunonjesID = D.PunonjesID;

SELECT * 
FROM Projekte
WHERE Statusi = 'Aktiv';

IF OBJECT_ID('Klient', 'U') IS NULL
BEGIN
    CREATE TABLE Klient (
        KlientID INT PRIMARY KEY IDENTITY(1,1),
        EmriKlient NVARCHAR(100)
    );
END

IF OBJECT_ID('Teknologji', 'U') IS NULL
BEGIN
    CREATE TABLE Teknologji (
        TeknologjiID INT PRIMARY KEY IDENTITY(1,1),
        EmriTeknologjise NVARCHAR(50)
    );
END

IF OBJECT_ID('ProjektTeknologji', 'U') IS NULL
BEGIN
    CREATE TABLE ProjektTeknologji (
        ProjektID INT,
        TeknologjiID INT,
        PRIMARY KEY (ProjektID, TeknologjiID),
        FOREIGN KEY (ProjektID) REFERENCES Projekte(ProjektID),
        FOREIGN KEY (TeknologjiID) REFERENCES Teknologji(TeknologjiID)
    );
END

IF NOT EXISTS (SELECT * FROM Klient WHERE EmriKlient = 'Kompania ABC')
BEGIN
    INSERT INTO Klient (EmriKlient)
    VALUES ('Kompania ABC');
END

INSERT INTO Teknologji (EmriTeknologjise)
 VALUES ('SQL Server');

SELECT 
    d.Pershkrimi,
    d.Statusi,
    p.EmriProjektit
FROM Detyra d
JOIN Projekte p ON d.ProjektID = p.ProjektID;

SELECT 
    d.Pershkrimi,
    pu.Emri AS Punonjesi
FROM Detyra d
JOIN Punonjes pu ON d.PunonjesID = pu.PunonjesID;
SELECT 
    p.EmriProjektit,
    t.EmriTeknologjise
FROM Projekte p
JOIN ProjektTeknologji pt ON p.ProjektID = pt.ProjektID
JOIN Teknologji t ON pt.TeknologjiID = t.TeknologjiID;
