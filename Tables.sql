CREATE TABLE [dbo].[Categories] (
    [Id]         INT primary key IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (50) NULL
);

CREATE TABLE [dbo].[Products] (
    [Id]       INT primary key IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (50) NULL
);

create table ProductCategories
(
    [Id] INT primary key IDENTITY (1, 1) NOT NULL, 
    [ProductId] int,
    [CategoryId] int
);

SET IDENTITY_INSERT [dbo].[Categories] ON
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (1, null)
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (2, N'4К Телевизоры')
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (3, N'8К Телевизоры')
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (4, N'4G Телефоны')
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (5, N'5G Телефоны')
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (6, N'6 core Процессоры')
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (7, N'8 core Процессоры')
INSERT INTO [dbo].[Categories] ([Id], [Name]) VALUES (8, N'12 core Процессоры')
SET IDENTITY_INSERT [dbo].[Categories] OFF

SELECT * FROM [Categories]

SET IDENTITY_INSERT [dbo].[Products] ON
INSERT INTO [dbo].[Products] ([Id], [Name]) VALUES (1, N'43" Oled')
INSERT INTO [dbo].[Products] ([Id], [Name]) VALUES (2, N'49" Oled')
INSERT INTO [dbo].[Products] ([Id], [Name]) VALUES (3, null)
INSERT INTO [dbo].[Products] ([Id], [Name]) VALUES (4, N'Samsung')
INSERT INTO [dbo].[Products] ([Id], [Name]) VALUES (5, N'Iphone')
INSERT INTO [dbo].[Products] ([Id], [Name]) VALUES (6, N'Nokia')
INSERT INTO [dbo].[Products] ([Id], [Name]) VALUES (7, N'Intel')
INSERT INTO [dbo].[Products] ([Id], [Name]) VALUES (8, N'AMD')
SET IDENTITY_INSERT [dbo].[Products] OFF

SELECT * FROM [Products]

SET IDENTITY_INSERT [dbo].[ProductCategories] ON
INSERT INTO [dbo].[ProductCategories] ([Id], [ProductId], [CategoryId]) VALUES (1,1,1), (2,1,2), (3,1,3), 
                                                                         (4,2,1), (5,2,2), (6,2,3), (7,3,1), (8,3,2), (9,3,3), 
                                                                         (10,4,4), (11,4,5), (12,4,6),
                                                                         (13,5,4), (14,5,5), (15,5,6),
                                                                         (16,6,7), (17,6,8), 
                                                                         (18,7,7), (19,7,8),
                                                                         (20,8,7), (21,8,8)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF

SELECT * FROM [ProductCategories]

SELECT P."Name", C."Name"
FROM Products P
LEFT JOIN ProductCategories PC
	ON P.Id = PC.ProductId
LEFT JOIN Categories C
	ON PC.CategoryId = C.Id
    ORDER BY P.Name;
