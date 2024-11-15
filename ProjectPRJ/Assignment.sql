USE [Shop_PRJ]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/6/2024 1:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccId] [varchar](50) NOT NULL,
	[AccPass] [varchar](50) NOT NULL,
	[Role] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserAddress] [nvarchar](150) NOT NULL,
	[UserPhone] [varchar](20) NOT NULL,
	[QuesId] [int] NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/6/2024 1:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CaId] [int] IDENTITY(1,1) NOT NULL,
	[CaName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collections]    Script Date: 3/6/2024 1:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collections](
	[CoId] [int] IDENTITY(1,1) NOT NULL,
	[CoName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/6/2024 1:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrId] [int] IDENTITY(1,1) NOT NULL,
	[OrDate] [date] NOT NULL,
	[AccId] [varchar](50) NOT NULL,
	[TotalMoney] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/6/2024 1:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrId] [int] NOT NULL,
	[ProId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrId] ASC,
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/6/2024 1:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProId] [int] IDENTITY(1,1) NOT NULL,
	[ProName] [nvarchar](100) NOT NULL,
	[ProImg] [nvarchar](max) NOT NULL,
	[ProPrice] [float] NOT NULL,
	[ProDetail] [nvarchar](1000) NOT NULL,
	[CaId] [int] NOT NULL,
	[CoId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityQuestion]    Script Date: 3/6/2024 1:39:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityQuestion](
	[QuesId] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[QuesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([AccId], [AccPass], [Role], [UserName], [UserAddress], [UserPhone], [QuesId], [Answer]) VALUES (N'admin', N'123', 0, N'Admin', N'Ha Noi', N'0389848201', 1, N'hanoi')
INSERT [dbo].[Account] ([AccId], [AccPass], [Role], [UserName], [UserAddress], [UserPhone], [QuesId], [Answer]) VALUES (N'quachdong', N'123', 1, N'Minh Dong', N'Ha Vy, Le Loi, Thuong Tin', N'0969729035', 1, N'yeuanhdong')
INSERT [dbo].[Account] ([AccId], [AccPass], [Role], [UserName], [UserAddress], [UserPhone], [QuesId], [Answer]) VALUES (N'sieunhandong', N'12345', 1, N'Dong', N'Thuong Tin, Ha Noi', N'0389848201', 1, N'hanoi')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CaId], [CaName]) VALUES (1, N'Cleanser')
INSERT [dbo].[Categories] ([CaId], [CaName]) VALUES (2, N'Toner')
INSERT [dbo].[Categories] ([CaId], [CaName]) VALUES (3, N'Serum')
INSERT [dbo].[Categories] ([CaId], [CaName]) VALUES (4, N'Sunscreen')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Collections] ON 

INSERT [dbo].[Collections] ([CoId], [CoName]) VALUES (1, N'Cocoon')
INSERT [dbo].[Collections] ([CoId], [CoName]) VALUES (2, N' Klairs ')
INSERT [dbo].[Collections] ([CoId], [CoName]) VALUES (3, N'Vichy')
INSERT [dbo].[Collections] ([CoId], [CoName]) VALUES (4, N'Biore')
INSERT [dbo].[Collections] ([CoId], [CoName]) VALUES (5, N'Innisfree')
SET IDENTITY_INSERT [dbo].[Collections] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrId], [OrDate], [AccId], [TotalMoney]) VALUES (10, CAST(N'2024-03-06' AS Date), N'quachdong', 630)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrId], [ProId], [Quantity], [Price]) VALUES (10, 1, 1, 150)
INSERT [dbo].[OrderDetail] ([OrId], [ProId], [Quantity], [Price]) VALUES (10, 13, 1, 300)
INSERT [dbo].[OrderDetail] ([OrId], [ProId], [Quantity], [Price]) VALUES (10, 17, 1, 180)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (1, N'Sữa rửa mặt nghệ 140ml', N'img/srm_cocoon.jpg', 150, N'Với công thức dịu nhẹ không Sulfate, sữa rửa mặt từ nghệ Hưng Yên giúp làm sạch hiệu quả mà không gây khô da, đồng thời hỗ trợ làm sạch tế bào chết, mang lại làn da đều màu, mềm mịn và tươi sáng rạng rỡ.', 1, 1)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (3, N'Serum Sa-chi phục hồi tóc 70ml', N'img/serum_cocoon.jpg', 200, N'Bạn có biết tóc cần chất béo để khỏe mạnh? Dầu Sa-chi là loại dầu rất đặc biệt với hàm lượng chất béo không bão hòa lên đến 94% gồm Omega 3,6 và 9. Dầu sa-chi khi kết hợp cùng Vitamin E, tinh dầu hương nhu và Phospholipid sẽ tăng cường khả năng chống oxy hóa, cải thiện các sợi tóc hư tổn, bảo vệ tóc khỏi nhiệt và tia UV, giúp tóc luôn chắc khỏe tràn đầy sức sống.', 3, 1)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (4, N'Nước bí đao cân bằng da 310ml', N'img/toner_cocoon.jpg', 290, N'Nhờ các thành phần gồm bí đao, rau má và tràm trà, nước bí đao với công thức không chứa cồn có tác dụng cân bằng pH, giảm dầu, làm sạch lỗ chân lông, cải thiện tình trạng mụn. Sản phẩm còn được bổ sung thêm Vitamin B3, HA và chiết xuất cam thảo giúp cấp ẩm cho làn da luôn mịn màng và giảm thiểu các vết đỏ trên da.', 2, 1)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (5, N'Kem chống nắng bí đao 15ml', N'img/kcn_cocoon.jpg', 155, N'Kết hợp các màng lọc thế hệ mới, chiết xuất bí đao, Synoxyl AZ và Melanin, sữa chống nắng bí đao giúp bảo vệ da trước tia UVA, UVB và ánh sáng năng lượng cao nhìn thấy được.
Với kết cấu không trọng lượng, lướt nhẹ và thấm nhanh vào da mà không để lại vệt trắng, sữa chống nắng bí đao mang lại lớp nền trong trẻo, khoẻ khoắn và cảm giác thoải mái khi sử dụng. Sản phẩm phù hợp cho mọi loại da, kể cả da dầu và da nhạy cảm.', 1, 1)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (6, N'Sữa rửa mặt axit amin trà xanh', N'img/srm_inis.jpg', 200, N'Sữa rửa mặt dưỡng ẩm với trà xanh và phức hợp axit amin dưỡng ẩm giúp loại bỏ bụi bẩn và tạp chất mà không làm tổn thương da.', 1, 5)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (7, N'Sữa rửa mặt làm sạch Bija', N'img/srm_inis2.jpg', 220, N'Sữa rửa mặt làm sạch sâu với axit salicylic và dầu hạt Bija giúp phá vỡ các tạp chất để làm sạch sâu.', 1, 5)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (8, N'Sữa rửa mặt Cherry Blossom', N'img/srm_inis3.jpg', 200, N'Sữa rửa mặt dạng gel dịu nhẹ với chiết xuất hoa anh đào và betaine giúp da sáng và có cảm giác ngậm nước.', 1, 5)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (9, N'Kem chống nắng Matte Priming UV Shield', N'img/kcninis1.jpg', 140, N'Một loại kem lót và kem chống nắng có phổ rộng SPF 37 giúp bảo vệ da trong khi chuẩn bị cho lớp trang điểm.   ', 4, 5)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (10, N'Tinh chất Hyaluronic hạt trà xanh', N'img/serum_inis1.jpg', 260, N'Một loại serum dưỡng ẩm hàng ngày với công thức làm dịu da được bổ sung Trà xanh và axit hyaluronic dạng nang giúp cân bằng đồng thời củng cố hàng rào bảo vệ da để dưỡng ẩm và sáng mịn lâu dài.', 3, 5)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (11, N'Sữa rửa mặt than củi Bioré', N'img/srm_biore2.jpg', 190, N'Loại bỏ và loại bỏ nhiều bụi bẩn và tạp chất gấp 2 lần so với sữa rửa mặt cơ bản với loại sữa rửa mặt màu đen cải tiến này tạo bọt trắng và rửa sạch. Được ứng dụng công nghệ làm sạch da của Nhật Bản, sữa rửa mặt này mang lại cho bạn kết quả chỉ sau một lần sử dụng!', 1, 4)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (12, N'Nước hoa hồng Bioré ® Hydrate', N'img/toner_biora.jpg', 320, N'Làm dịu đi sự tích tụ tắc nghẽn lỗ chân lông với Biore Hydrate & Glow Toner của chúng tôi. Tuyệt vời cho làn da khô, nhạy cảm, loại mực này được pha trộn với hỗn hợp làm sáng da của nước dừa, Prebiotic và Axit Lactic. Nhẹ nhàng hòa tan các tế bào da chết mà không gây kích ứng hoặc gây khô quá mức, đồng thời chuẩn bị cho làn da một lượng nước dưỡng ẩm lành mạnh.', 1, 4)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (13, N'Sữa rửa mặt làm sạch sâu Klairs', N'img/Sanitizer-GelSanitizer-Gel.jpg', 300, N'Dear, Klairs Gentle Black Deep Cleaning Oil hoàn hảo để làm sạch nhẹ nhàng, sâu sắc với các thành phần chiết xuất từ ​​hạt đen tự nhiên.
– Hoàn thành thử nghiệm kích ứng da cơ bản
– Hoàn thành thử nghiệm kích ứng da cơ bản cho da nhạy cảm
– Hoàn thành thử nghiệm kích ứng mắt', 1, 2)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (14, N'Tinh chất Vitamin tươi', N'img/serum_klairs.jpg', 250, N'Freshly Juiced Vitamin Drop là tinh chất bổ sung hàng ngày với Vitamin C nguyên chất để mang lại làn da trong trẻo và sống động.
– Đã hoàn thành Thử nghiệm kích ứng da cơ bản dành cho da nhạy cảm
– Đã hoàn thành Thử nghiệm giảm kích ứng da do tia cực tím
– Đã hoàn thành thử nghiệm về hiệu quả chống oxy hóa trong ống nghiệm (Chất chống oxy hóa – DPPH, ORAC)', 3, 2)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (15, N'Nước hoa hồng không mùi Klairs', N'img/toner_klairs.jpg', 320, N'Supple Chuẩn bị không mùi Toner là một loại mực không chứa dầu thiết yếu. Nó được điều chế với nền tảng là các chiết xuất thực vật khác nhau để cân bằng độ pH của da và cung cấp đầy đủ dưỡng chất cho da.
– Đã hoàn thành Thử nghiệm kích ứng da sơ cấp
– Đã hoàn thành Thử nghiệm kích ứng da sơ cấp dành cho da nhạy cảm', 2, 2)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (16, N'Sữa rửa mặt dạng gel Vichy', N'img/srm_vichy.jpg', 200, N'Một loại gel giàu bọt giúp làm sạch hiệu quả các tạp chất, lớp trang điểm và ô nhiễm khỏi da đồng thời chống lại tác động gây hại cho da của nước cứng. Mang lại cho làn da cảm giác mềm mại và tươi mát, không bị căng. Công thức với Purisoft và 15 loại nước núi lửa Vichy giàu khoáng chất giúp thanh lọc và củng cố hàng rào bảo vệ da.', 1, 3)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (17, N'Serum VITAMIN C LIFTACTIV', N'img/serum_vichy.jpg', 180, N'Các tác nhân gây hại từ môi trường hàng ngày như ô nhiễm gây ra sự đổi màu rõ rệt, khiến làn da kém rạng rỡ hơn. Khám phá Serum LiftActiv 15% Vitamin C để có kết quả rạng rỡ rõ rệt sau 10 ngày & kết quả đã được chứng minh lâm sàng để bảo vệ da khỏi sự đổi màu do ô nhiễm. Giờ đây đã có một dụng cụ bôi mới và cải tiến để giúp ngăn ngừa ô nhiễm công thức. Công thức chỉ với 11 thành phần và phức hợp chống oxy hóa tiên tiến trong công thức nhẹ, không mùi và không gây dị ứng.', 3, 3)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (18, N'Kem chống nắng LIFTACTIV SPF 30', N'img/kcn_vichy.jpg', 250, N'Bảo vệ làn da của bạn, Kem chống nắng LiftActiv Peptide-C SPF 30 là một loại kem dưỡng ẩm chống lão hóa * hàng ngày với khả năng bảo vệ UVA và UVB phổ rộng. Bác sĩ da liễu đã thử nghiệm công thức của Phyto Peptides, Vitamin C và 15 loại nước núi lửa Vichy giàu khoáng chất giúp cải thiện nếp nhăn, đốm đen, da xỉn màu và không đều màu cũng như mất độ săn chắc', 1, 3)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (19, N'Toner dành cho da nhạy cảm', N'img/toner_vichy.jpg', 230, N'Một chất làm sạch nhẹ nhàng nhưng hiệu quả được tạo ra cho làn da nhạy cảm. Công thức nước Micellar giúp làm sạch da, loại bỏ lớp trang điểm trên mặt và mắt, đồng thời làm dịu da chỉ trong một bước đơn giản. Không cần chà xát hoặc rửa sạch. Bác sĩ da liễu đã thử nghiệm công thức với Panthenol (Vitamin B5) và 15 loại nước núi lửa Vichy giàu khoáng chất để giúp hydrat hóa và củng cố hàng rào bảo vệ da.', 2, 3)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (20, N'Sữa rửa mặt cà phê 150ml', N'img/srm_cocoon2.jpg', 165, N'Những hạt cà phê Đắk Lắk xay nhuyễn giàu cafeine hòa quyện với bơ cacao Tiền Giang giúp bạn loại bỏ lớp tế bào chết già cỗi và xỉn màu, đánh thức làn da tươi mới đầy năng lượng cùng cảm giác mượt mà và mềm mịn lan tỏa.', 1, 1)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (21, N'Tinh chất hoa hồng 30ml', N'img/serum_cocoon2.jpg', 265, N'Với kết cấu mọng nước, tinh chất hoa hồng sẽ thẩm thấu nhanh và mang các dưỡng chất ngậm nước đi sâu vào các tầng da, giúp dưỡng ẩm sâu, phục hồi những tổn thương do sự mất nước gây ra, đồng thời trả lại sự đầy đặn và tươi mới vốn có của làn da. Đây là cách nhanh nhất để da trở nên căng mọng và ẩm mịn.', 3, 1)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (22, N'Sữa rửa mặt PURETÉ', N'img/srm_vichy2.jpg', 140, N'Sữa rửa mặt dạng gel tươi mát giúp làm sạch hiệu quả các tạp chất, lớp trang điểm và ô nhiễm trên da. Mang lại cho làn da cảm giác mềm mại và tươi mát, không bị khô hoặc căng. Công thức chứa Niacinamide và Vichy Volcanic Water giúp thanh lọc và tăng cường hàng rào độ ẩm cho da.', 1, 3)
INSERT [dbo].[Product] ([ProId], [ProName], [ProImg], [ProPrice], [ProDetail], [CaId], [CoId]) VALUES (23, N'Nước hoa hồng PHA trà xanh', N'img/toner_inis.jpg', 200, N'Sản phẩm tẩy da chết nhẹ nhàng, lưu lại hàng ngày với 7% PHA và Enzyme trà xanh giúp làm mịn rõ rệt và làm đều kết cấu thô ráp đồng thời dưỡng ẩm cho da.', 2, 5)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[SecurityQuestion] ON 

INSERT [dbo].[SecurityQuestion] ([QuesId], [Question]) VALUES (1, N'In what city were you born?')
INSERT [dbo].[SecurityQuestion] ([QuesId], [Question]) VALUES (2, N'What is the name of your favorite pet?')
INSERT [dbo].[SecurityQuestion] ([QuesId], [Question]) VALUES (3, N'What is your mothers name?')
INSERT [dbo].[SecurityQuestion] ([QuesId], [Question]) VALUES (4, N'What high school did you attend?')
INSERT [dbo].[SecurityQuestion] ([QuesId], [Question]) VALUES (5, N'What was the name of your elementary school?')
INSERT [dbo].[SecurityQuestion] ([QuesId], [Question]) VALUES (6, N'What was your favorite food as a child?')
SET IDENTITY_INSERT [dbo].[SecurityQuestion] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([QuesId])
REFERENCES [dbo].[SecurityQuestion] ([QuesId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([AccId])
REFERENCES [dbo].[Account] ([AccId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProId])
REFERENCES [dbo].[Product] ([ProId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrId])
REFERENCES [dbo].[Order] ([OrId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CaId])
REFERENCES [dbo].[Categories] ([CaId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CoId])
REFERENCES [dbo].[Collections] ([CoId])
GO
