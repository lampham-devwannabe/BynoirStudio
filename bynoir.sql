USE [master]
GO
/****** Object:  Database [BynoirDB]    Script Date: 3/4/2024 8:55:00 PM ******/
CREATE DATABASE [BynoirDB]
GO
USE [BynoirDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/4/2024 8:55:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 3/4/2024 8:55:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[product_id] [int] NOT NULL,
	[color] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/4/2024 8:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[order_date] [date] NOT NULL,
	[total_money] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Detail]    Script Date: 3/4/2024 8:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Detail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/4/2024 8:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_price] [money] NOT NULL,
	[product_description] [nvarchar](max) NOT NULL,
	[img] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Size]    Script Date: 3/4/2024 8:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Size](
	[product_id] [int] NOT NULL,
	[size] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Products_Size] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 3/4/2024 8:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[size] [nvarchar](50) NOT NULL,
	[size_name] [nvarchar](50) NOT NULL,
	[measurements] [nvarchar](50) NOT NULL,
	[height] [nvarchar](100) NOT NULL,
	[weight] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/4/2024 8:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_email] [nvarchar](200) NOT NULL,
	[user_fullname] [nvarchar](200) NOT NULL,
	[user_password] [nvarchar](200) NOT NULL,
	[admin] [bit] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (1, N'Dress')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (2, N'Skirt')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (3, N'Cape')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (4, N'Vest')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (5, N'Set')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (6, N'Jacket')
GO
INSERT [dbo].[Categories] ([category_id], [category_name]) VALUES (7, N'Top')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (1, N'Grey
')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (3, N'White

')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (27, N'Grey')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (5, N'Black')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (6, N'Black')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (7, N'Black')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (8, N'Grey')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (28, N'Black')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (12, N'Grey')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (13, N'Black')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (14, N'Black')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (15, N'Black')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (16, N'Black')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (18, N'Beige')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (19, N'Black')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (20, N'Black')
GO
INSERT [dbo].[Colors] ([product_id], [color]) VALUES (21, N'White')
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (12, 2, CAST(N'2024-03-04' AS Date), 72000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (13, 2, CAST(N'2024-03-04' AS Date), 72000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (14, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (15, 1, CAST(N'2024-03-04' AS Date), 0.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (16, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (17, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (18, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (19, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (20, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (21, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (22, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (23, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (24, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (25, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (26, 2, CAST(N'2024-03-04' AS Date), 90000.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (27, 1, CAST(N'2024-03-04' AS Date), 0.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (28, 1, CAST(N'2024-03-04' AS Date), 0.0000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [order_date], [total_money]) VALUES (29, 1, CAST(N'2024-03-04' AS Date), 935000.0000)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Orders_Detail] ([order_id], [product_id], [quantity], [price]) VALUES (26, 28, 3, 30000.0000)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (1, 3, N'Annie Cape', 980000.0000, N'Áo choàng đen kẻ dạ
', N'DBimages/anniecape.jpg')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (3, 3, N'Bowie Cape

', 850000.0000, N'Váy cape đính đá phối đen trắng

', N'DBimages/bowiecape.jpg

')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (5, 1, N'Crystal Dress
', 850000.0000, N'Váy quây đính đá phối sơ mi
', N'DBimages/crystaldress.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (6, 1, N'Hanah Dress
', 880000.0000, N'Váy trễ vai phối nơ
', N'DBimages/hanahdress.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (7, 1, N'Fylina Dress
', 820000.0000, N'Váy công sở tay bồng
', N'DBimages/fylinadress2.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (8, 1, N'Aura Dress
', 820000.0000, N'Váy tay bồng cổ tròn nơ đá
', N'DBimages/auradress2.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (12, 6, N'Chuly Jacket
', 780000.0000, N'Áo Khoác Phối Bèo
', N'DBimages/chulyjacket.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (13, 6, N'On The Go Jacket
', 820000.0000, N'Áo Khoác Đính Đá
', N'DBimages/onthegojacket.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (14, 5, N'Hazel Set
', 999000.0000, N'Set Áo Sơ Mi Phối Váy Yếm
', N'DBimages/hazelset.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (15, 5, N'Corset Viral Set
', 980000.0000, N'Váy corset phối sơ mi
', N'DBimages/corsetviralset.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (16, 5, N'Zizi Dress Set
', 1020000.0000, N'Set váy', N'DBimages/ziziset.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (18, 5, N'Mie Set
', 880000.0000, N'Set Cổ Sen
', N'DBimages/mieset.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (19, 2, N'Mili Skirt
', 550000.0000, N'Chân váy nắp túi
', N'DBimages/miliskirt.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (20, 7, N'Viola Top
', 550000.0000, N'Set chân váy áo phối tay voan trắng
', N'DBimages/violatop.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (21, 7, N'Carolyn Top
', 820000.0000, N'Áo trễ vai phối hoa
', N'DBimages/carolyntop.jpg
')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (27, 6, N'Millie Jacket', 675000.0000, N'Full grey jacket', N'DBimages/milliejacket.jpg')
GO
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [product_price], [product_description], [img]) VALUES (28, 4, N'Blink Vest', 820000.0000, N'Áo Vest Kim Tuyến', N'DBimages/blinkvest.jpg')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (1, N'L', 2)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (1, N'M', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (1, N'S', 2)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (3, N'L', 3)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (3, N'M', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (3, N'S', 4)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (5, N'L', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (5, N'M', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (5, N'S', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (6, N'L', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (6, N'M', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (6, N'S', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (7, N'L', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (7, N'M', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (7, N'S', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (8, N'L', 3)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (8, N'M', 2)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (8, N'S', 3)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (12, N'L', 2)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (12, N'M', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (12, N'S', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (13, N'L', 4)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (13, N'M', 2)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (13, N'S', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (14, N'L', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (14, N'M', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (14, N'S', 2)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (15, N'L', 6)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (15, N'M', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (15, N'S', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (16, N'L', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (16, N'M', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (16, N'S', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (18, N'L', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (18, N'M', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (18, N'S', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (19, N'L', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (19, N'M', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (19, N'S', 1)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (20, N'L', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (20, N'M', 2)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (20, N'S', 2)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (21, N'L', 2)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (21, N'M', 0)
GO
INSERT [dbo].[Products_Size] ([product_id], [size], [quantity]) VALUES (21, N'S', 0)
GO
INSERT [dbo].[Sizes] ([size], [size_name], [measurements], [height], [weight]) VALUES (N'L', N'Large', N'92-73-98', N'1m63 trở lên', N'55kg- 59kg')
GO
INSERT [dbo].[Sizes] ([size], [size_name], [measurements], [height], [weight]) VALUES (N'M', N'Medium', N'88-69-94', N'1m55-1m63', N'49kg-53kg')
GO
INSERT [dbo].[Sizes] ([size], [size_name], [measurements], [height], [weight]) VALUES (N'S', N'Small', N'84-65-90', N'1m50', N'44kg-48kg')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (1, N'lampthe181615@fpt.edu.vn', N'Phạm Thanh Lâm', N'lam15102004', 1)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (2, N'admin@gmail.com', N'Admin', N'admin', 1)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (3, N'testuser@gmail.com', N'Test User', N'testuser', 1)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (4, N'gambrogi0@time.com', N'Gard Ambrogi', N'jR0KbW~>@)Z}c', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (5, N'jfrancois1@ebay.com', N'Jewell Francois', N'pY9nGG(|<=i', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (6, N'smcgarva2@addtoany.com', N'Shermy McGarva', N'eT9+yjS/', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (7, N'alidell3@google.fr', N'Ailina Lidell', N'cQ2_QJCSUCLCKB', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (8, N'melcock4@de.vu', N'Meggy Elcock', N'sQ9Av7%Ymh8', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (9, N'ojockle5@xing.com', N'Obie Jockle', N'xM9DXH*1vu', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (10, N'mallridge6@ft.com', N'Melantha Allridge', N'sJ3Aa,>XX(,?', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (11, N'nmix7@psu.edu', N'Noelle Mix', N'lQ0.''OzrIl"Nt&', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (12, N'dsammons8@eepurl.com', N'Daniela Sammons', N'sK45><kcFqK.g!(', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (13, N'tblazewicz9@mashable.com', N'Timmie Blazewicz', N'iV3NqBX<', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (14, N'mclancya@rakuten.co.jp', N'Murry Clancy', N'pE4_dYNcPyAsaYp', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (16, N'tmaccarterc@va.gov', N'Tuck MacCarter', N'eF3!.5nJ%', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (17, N'kgaized@hubpages.com', N'Kalvin Gaize', N'sZ2VK~=?dXo', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (18, N'shaille@xing.com', N'Stefa Haill', N'iF5JT.*&e`Cl(.~', 0)
GO
INSERT [dbo].[Users] ([user_id], [user_email], [user_fullname], [user_password], [admin]) VALUES (19, N'lam@gmail.com', N'lam', N'123', 0)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Colors]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Orders_Detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Orders_Detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Products_Size]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Products_Size]  WITH CHECK ADD FOREIGN KEY([size])
REFERENCES [dbo].[Sizes] ([size])
GO
USE [master]
GO
ALTER DATABASE [BynoirDB] SET  READ_WRITE 
GO
