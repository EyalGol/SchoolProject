CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [name] NCHAR(50) NULL, 
    [email] NCHAR(50) NULL, 
    [password] NCHAR(50) NULL, 
    [birthdate] DATE NULL, 
    [country] NCHAR(50) NULL, 
    [gender] NCHAR(10) NULL, 
    [metal_gener] NCHAR(10) NULL
)
