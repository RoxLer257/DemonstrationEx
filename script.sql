USE [DemExamin]
GO
/****** Object:  Table [dbo].[Izmerenie]    Script Date: 20.06.2025 14:38:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Izmerenie](
	[ID_EdIzmerenie] [int] IDENTITY(1,1) NOT NULL,
	[NameIzmerenie] [nvarchar](255) NULL,
 CONSTRAINT [PK_Izmerenie] PRIMARY KEY CLUSTERED 
(
	[ID_EdIzmerenie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material_type]    Script Date: 20.06.2025 14:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_type](
	[ID_TypeMaterial] [int] IDENTITY(1,1) NOT NULL,
	[TypeMaterial] [nvarchar](255) NULL,
	[PercentMaterial] [float] NULL,
 CONSTRAINT [PK_Material_type] PRIMARY KEY CLUSTERED 
(
	[ID_TypeMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 20.06.2025 14:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[ID_Material] [int] IDENTITY(1,1) NOT NULL,
	[NameMaterial] [nvarchar](255) NULL,
	[IDTypeMaterial] [int] NULL,
	[PriceEdMaterial] [float] NULL,
	[QuantitySklad] [int] NULL,
	[MinQuantity] [int] NULL,
	[QuantityUpakovka] [int] NULL,
	[IDEdIzmerenie] [int] NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[ID_Material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_materials]    Script Date: 20.06.2025 14:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_materials](
	[ID_ProductMaterial] [int] IDENTITY(1,1) NOT NULL,
	[IDProduct] [int] NULL,
	[IDMaterial] [int] NULL,
	[NuzhnoQuantityMaterial] [float] NULL,
 CONSTRAINT [PK_Product_materials] PRIMARY KEY CLUSTERED 
(
	[ID_ProductMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_type]    Script Date: 20.06.2025 14:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_type](
	[ID_ProductType] [int] IDENTITY(1,1) NOT NULL,
	[TypeProduct] [nvarchar](255) NULL,
	[KoeffTypeProduct] [float] NULL,
 CONSTRAINT [PK_Product_type] PRIMARY KEY CLUSTERED 
(
	[ID_ProductType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 20.06.2025 14:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID_Product] [int] NOT NULL,
	[IDTypeProduct] [int] NULL,
	[NameProduct] [nvarchar](255) NULL,
	[Articul] [float] NULL,
	[MinCostForPartner] [float] NULL,
	[RollWidthMetr] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Izmerenie] ON 

INSERT [dbo].[Izmerenie] ([ID_EdIzmerenie], [NameIzmerenie]) VALUES (1, N'рул')
INSERT [dbo].[Izmerenie] ([ID_EdIzmerenie], [NameIzmerenie]) VALUES (2, N'кг')
INSERT [dbo].[Izmerenie] ([ID_EdIzmerenie], [NameIzmerenie]) VALUES (3, N'л')
SET IDENTITY_INSERT [dbo].[Izmerenie] OFF
GO
SET IDENTITY_INSERT [dbo].[Material_type] ON 

INSERT [dbo].[Material_type] ([ID_TypeMaterial], [TypeMaterial], [PercentMaterial]) VALUES (1, N'Бумага', 0.7)
INSERT [dbo].[Material_type] ([ID_TypeMaterial], [TypeMaterial], [PercentMaterial]) VALUES (2, N'Краска', 0.5)
INSERT [dbo].[Material_type] ([ID_TypeMaterial], [TypeMaterial], [PercentMaterial]) VALUES (3, N'Клей', 0.15)
INSERT [dbo].[Material_type] ([ID_TypeMaterial], [TypeMaterial], [PercentMaterial]) VALUES (4, N'Дисперсия', 0.2)
SET IDENTITY_INSERT [dbo].[Material_type] OFF
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (1, N'Бумага-основа с покрытием для флизелиновых обоев', 1, 1700, 2500, 1000, 100, 1)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (2, N'Бумага-основа для флизелиновых обоев', 1, 1500, 3000, 1000, 100, 1)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (3, N'Бумага обойная для вспененных виниловых обоев', 1, 1200, 1500, 1000, 100, 1)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (4, N'Концентрат водоразбавляемой печатной краски', 2, 1500, 550, 500, 200, 2)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (5, N'Перламутровый пигмент', 2, 3100, 200, 100, 10, 2)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (6, N'Сухой клей на основе ПВС', 3, 360, 700, 500, 50, 2)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (7, N'Флизелин', 1, 1600, 2000, 1000, 140, 1)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (8, N'Стирол-акриловая дисперсия для производства обоев', 4, 14.9, 2000, 880, 220, 3)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (9, N'Стирол-акриловая дисперсия для гидрофобных покрытий', 4, 14.9, 1200, 880, 220, 3)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (10, N'Акрилат-винилацетатная дисперсия для производства бумаги', 4, 15.5, 1000, 660, 220, 3)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (11, N'Цветная пластизоль', 2, 650, 200, 100, 5, 2)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (12, N'Дисперсия анионно-стабилизированного стирол-акрилового сополимера', 3, 170, 800, 660, 220, 3)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (13, N'Водорастворимая краска водная', 2, 500, 400, 300, 25, 2)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (14, N'Диспергатор минеральных пигментов и наполнителей', 4, 16, 400, 360, 120, 3)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (15, N'Ассоциативный акриловый загуститель', 4, 16.5, 400, 360, 120, 3)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (16, N'Водорастворимая краска спецводная ', 2, 700, 350, 300, 25, 2)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (17, N'Металлический пигмент', 2, 4100, 250, 100, 15, 2)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (18, N'Акриловая дисперсия', 4, 14.9, 1000, 880, 220, 3)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (19, N'Бумага-основа для обоев марки АФ', 1, 1200, 2000, 1000, 100, 1)
INSERT [dbo].[Materials] ([ID_Material], [NameMaterial], [IDTypeMaterial], [PriceEdMaterial], [QuantitySklad], [MinQuantity], [QuantityUpakovka], [IDEdIzmerenie]) VALUES (20, N'Бумага с подложкой устойчивая к атмосферным воздействиям', 1, 3500, 2000, 800, 50, 1)
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_materials] ON 

INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (1, 5, 10, 1.95)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (2, 12, 10, 0.21)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (3, 14, 18, 1.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (4, 18, 18, 1)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (5, 10, 18, 1)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (6, 1, 15, 0.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (7, 16, 15, 0.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (8, 11, 3, 2.55)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (9, 16, 3, 3.6)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (10, 12, 3, 2.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (11, 1, 20, 2.9)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (12, 11, 20, 2.55)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (13, 6, 20, 1.8)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (14, 18, 20, 2.2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (15, 2, 20, 3.4)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (16, 13, 19, 3.6)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (17, 15, 19, 3.7)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (18, 14, 19, 1.6)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (19, 10, 19, 3.56)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (20, 5, 2, 4.6)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (21, 3, 1, 2.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (22, 9, 1, 3.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (23, 5, 16, 3.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (24, 9, 16, 5.25)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (25, 18, 16, 5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (26, 10, 16, 3.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (27, 13, 13, 4.75)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (28, 1, 13, 3)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (29, 15, 14, 1.3)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (30, 19, 14, 1.3)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (31, 7, 14, 1.8)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (32, 4, 14, 0.2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (33, 8, 14, 0.2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (34, 9, 14, 0.25)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (35, 1, 12, 0.2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (36, 19, 12, 0.2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (37, 5, 12, 0.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (38, 16, 12, 0.2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (39, 20, 12, 0.25)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (40, 14, 12, 0.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (41, 6, 12, 0.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (42, 18, 12, 0.7)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (43, 2, 12, 1)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (44, 10, 12, 0.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (45, 17, 4, 2.55)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (46, 14, 4, 2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (47, 6, 4, 2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (48, 2, 4, 1)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (49, 5, 17, 0.45)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (50, 4, 17, 0.3)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (51, 9, 17, 1)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (52, 13, 5, 1)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (53, 1, 5, 0.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (54, 12, 5, 0.35)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (55, 18, 5, 1.25)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (56, 15, 9, 1)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (57, 11, 9, 1)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (58, 13, 8, 0.15)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (59, 19, 8, 1)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (60, 3, 8, 1.2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (61, 7, 8, 1.2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (62, 17, 8, 1)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (63, 6, 8, 1.2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (64, 2, 8, 0.33)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (65, 13, 6, 0.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (66, 11, 6, 2.9)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (67, 7, 6, 1.4)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (68, 17, 6, 1.7)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (69, 8, 6, 0.3)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (70, 9, 6, 1)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (71, 19, 7, 1.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (72, 3, 7, 2.5)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (73, 7, 7, 1.75)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (74, 17, 7, 1.85)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (75, 4, 7, 2.2)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (76, 8, 7, 1.3)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (77, 20, 7, 0.8)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (78, 3, 11, 1.65)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (79, 14, 11, 1.25)
INSERT [dbo].[Product_materials] ([ID_ProductMaterial], [IDProduct], [IDMaterial], [NuzhnoQuantityMaterial]) VALUES (80, 6, 11, 1)
SET IDENTITY_INSERT [dbo].[Product_materials] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_type] ON 

INSERT [dbo].[Product_type] ([ID_ProductType], [TypeProduct], [KoeffTypeProduct]) VALUES (1, N'Декоративные обои', 5.5)
INSERT [dbo].[Product_type] ([ID_ProductType], [TypeProduct], [KoeffTypeProduct]) VALUES (2, N'Фотообои', 7.54)
INSERT [dbo].[Product_type] ([ID_ProductType], [TypeProduct], [KoeffTypeProduct]) VALUES (3, N'Обои под покраску', 3.25)
INSERT [dbo].[Product_type] ([ID_ProductType], [TypeProduct], [KoeffTypeProduct]) VALUES (4, N'Стеклообои', 2.5)
SET IDENTITY_INSERT [dbo].[Product_type] OFF
GO
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (1, 1, N'Обои из природного материала Традиционный принт светло-коричневые', 1549922, 16950, 0.91)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (2, 2, N'Фотообои флизелиновые Горы 500x270 см', 2018556, 15880, 0.5)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (3, 3, N'Обои под покраску флизелиновые Рельеф', 3028272, 11080, 0.75)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (4, 4, N'Стеклообои Рогожка белые', 4029272, 5898, 1)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (5, 1, N'Обои флизелиновые Эвелин светло-серые', 1028248, 15200, 1.06)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (6, 2, N'Фотообои флизелиновые 3D Лес и горы 300x280 см', 2118827, 12500.96, 0.3)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (7, 3, N'Обои под покраску флизелиновые цвет белый', 3130981, 4320.56, 1.06)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (8, 4, N'Стеклохолст', 4029784, 2998.99, 1)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (9, 1, N'Флизелиновые обои Принт Вензель серые', 1658953, 16200.96, 0.68)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (10, 2, N'Фотообои флизелиновые Узор 300x270 см', 2026662, 8780.69, 0.3)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (11, 3, N'Обои под покраску флизелиновые Кирпичная стена', 3159043, 15750, 1.06)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (12, 4, N'Стеклообои Средняя елка белые', 4588376, 5500, 1)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (13, 1, N'Обои бумажные Полосы цвет бежевый', 1758375, 13500.96, 0.68)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (14, 2, N'Фотообои Тропики 290x260 см', 2759324, 6980, 0.29)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (15, 3, N'Обои под покраску Рисунок Штукатурка белые', 3118827, 5890, 1.06)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (16, 4, N'Стеклообои Геометрические фигуры белые ', 4559898, 5369, 1)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (17, 1, N'Обои флизелиновые Лилия бежевые', 1259474, 9750.79, 1.06)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (18, 2, N'Фотообои флизелиновые 3D Пейзаж 300x280 см', 2115947, 16850, 0.3)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (19, 3, N'Обои под покраску флизелиновые однотонные цвет белый ', 3033136, 3390, 1.06)
INSERT [dbo].[Products] ([ID_Product], [IDTypeProduct], [NameProduct], [Articul], [MinCostForPartner], [RollWidthMetr]) VALUES (20, 4, N'Стеклохолст малярный Паутинка', 4028048, 1750, 1)
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Izmerenie] FOREIGN KEY([IDEdIzmerenie])
REFERENCES [dbo].[Izmerenie] ([ID_EdIzmerenie])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Izmerenie]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Material_type] FOREIGN KEY([IDTypeMaterial])
REFERENCES [dbo].[Material_type] ([ID_TypeMaterial])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Material_type]
GO
ALTER TABLE [dbo].[Product_materials]  WITH CHECK ADD  CONSTRAINT [FK_Product_materials_Materials] FOREIGN KEY([IDMaterial])
REFERENCES [dbo].[Materials] ([ID_Material])
GO
ALTER TABLE [dbo].[Product_materials] CHECK CONSTRAINT [FK_Product_materials_Materials]
GO
ALTER TABLE [dbo].[Product_materials]  WITH CHECK ADD  CONSTRAINT [FK_Product_materials_Products] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Products] ([ID_Product])
GO
ALTER TABLE [dbo].[Product_materials] CHECK CONSTRAINT [FK_Product_materials_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Product_type] FOREIGN KEY([IDTypeProduct])
REFERENCES [dbo].[Product_type] ([ID_ProductType])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Product_type]
GO
