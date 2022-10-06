USE [SWP]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 10/6/2022 8:31:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [ntext] NULL,
	[description] [ntext] NULL,
	[cate_id] [int] NOT NULL,
	[detail] [ntext] NULL,
	[created_at] [datetime] NOT NULL,
	[image] [nvarchar](250) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([post_id], [title], [description], [cate_id], [detail], [created_at], [image]) VALUES (10, N'Trẻ em nên niềng răng khi nào?', N'Bên cạnh mang lại tính thẩm mỹ cho khuôn mặt, niềng răng cho trẻ còn giúp bảo vệ con khỏi mắc các bệnh lý về răng miệng. Tiến hành niềng răng cho trẻ sớm giúp nha sĩ có thời gian chỉnh răng, tăng cơ hội đạt khớp cắn lý tưởng và điều trị thuận lợi.', 1, N'<div class="rich-text">
<p><strong>Bên cạnh mang lại tính thẩm mỹ cho khuôn mặt, niềng răng cho trẻ còn giúp bảo vệ con khỏi mắc các bệnh lý về răng miệng. Tiến hành niềng răng cho trẻ sớm giúp nha sĩ có thời gian chỉnh răng, tăng cơ hội đạt khớp cắn lý tưởng và điều trị thuận lợi.</strong></p>
</div>


<h2>1. Trẻ em có nên niềng răng hay không?</h2>


<div class="rich-text">
<p>&nbsp;</p>
<p>Rất có thể nha sĩ là người đầu tiên chỉ ra vấn đề về răng của con bạn, chẳng hạn như răng bị mẻ quá mức nghiêm trọng, mọc chen chúc, khấp khểnh hoặc khớp cắn chéo (răng hô / móm), và quyết định&nbsp;<strong>trẻ em nên niềng răng khi nào</strong>. Vì thế, bạn nên bắt đầu cân nhắc&nbsp;<strong>niềng răng cho trẻ</strong>&nbsp;sớm nếu được bác sĩ chỉ định. Hầu hết những đứa trẻ cần niềng răng mắc cài phải thực hiện ở 8 hoặc&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/hoi-dap-bac-si/co-nen-deo-nep-rang-cho-tre-9-tuoi-khong/?link_type=related_posts"><strong class="link-in-body">9 tuổi</strong></a>&nbsp;- khi chưa mọc hết răng vĩnh viễn và hàm vẫn đang phát triển. Nếu con bạn bị&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/lech-khop-can-la-gi-anh-huong-nao-toi-chuc-nang-rang-va-tham-my-khuon-mat/?link_type=related_posts"><strong class="link-in-body">lệch khớp cắn</strong></a>, cần chỉnh sửa trước khi nhổ chiếc&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/hoi-dap-bac-si/rang-sua-chua-nho-ma-rang-moi-da-nhu-len-co-anh-huong-gi-khong/?link_type=related_posts"><strong class="link-in-body">răng sữa</strong></a>&nbsp;đầu tiên. Nếu để quá muộn, tình trạng này có thể khiến xương hàm phát triển không cân xứng.</p>
</div>


<h2>2. Nguy cơ phải niềng răng cho trẻ mút ngón tay</h2>


<div class="rich-text">
<p>&nbsp;</p>
<p>Những đứa trẻ vẫn mút tay hoặc bú sữa khi răng vĩnh viễn bắt đầu mọc có nhiều khả năng cần niềng răng. Nếu từ 5 tuổi trở lên mà trẻ vẫn chưa bỏ được thói quen này, có thể kéo lệch răng trưởng thành, khiến những chiếc&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/nguyen-nhan-va-anh-huong-cua-rang-moc-chen-chuc/?link_type=related_posts"><strong class="link-in-body">răng mọc chen chúc</strong></a>&nbsp;nhau hoặc tạo ra tình trạng cắn phủ (overbite) - răng cửa nhô ra phía trước. Tuy nhiên nguyên nhân này không phổ biến, hầu hết các vấn đề về khớp cắn (hô hoặc móm) là do di truyền.</p>
</div>


<figure class="post-image full has-zoomable loaded-img"><img class="full uploaded img-in-body" src="https://vinmec-prod.s3.amazonaws.com/images/20200515_011927_090844_treem.max-1800x1800.jpg" alt="Trẻ mút ngậm tay" data-src="https://vinmec-prod.s3.amazonaws.com/images/20200515_011927_090844_treem.max-1800x1800.jpg" />
<figcaption class="caption">
<div class="rich-text">Những đứa trẻ vẫn mút tay có nhiều khả năng cần niềng răng</div>
</figcaption>
</figure>


<h2>3. Quy trình niềng răng cho trẻ</h2>


<div class="rich-text">
<p>&nbsp;</p>
<p>Bác sĩ chỉnh nha sẽ dán các mắc cài vào mặt trước của răng và kết nối chúng bằng một sợi dây cung. Sau đó, trẻ sẽ được điều chỉnh hoặc thay dây mỗi 4 - 6 tuần, để răng từ từ được kéo vào đúng vị trí. Trẻ cũng có thể phải đeo:</p>
<ul>
<li>Thun (chuỗi Elastic đàn hồi): Nối răng trên với răng dưới để tăng thêm áp lực và độ chính xác.</li>
<li>Mũ chỉnh nha: Một nẹp kim loại với các giá đỡ quấn quanh đầu, có tác dụng kéo các răng cửa về phía sau.</li>
</ul>
<p>Sau khi tháo niềng răng, hầu hết trẻ em sẽ cần phải đeo hàm duy trì (retainer) - một loại mắc cài tùy chỉnh có thể tháo rời, để giữ cho răng ở đúng vị trí cho đến khi&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/nao-la-rang-khon-moc-lech-ham-tren/?link_type=related_posts"><strong class="link-in-body">răng khôn mọc</strong></a>&nbsp;và hàm ngừng phát triển, khoảng 18 hoặc 19 tuổi. Một số người trưởng thành cũng có thể phải tiếp tục đeo hàm duy trì này 1 ngày/tuần.</p>
</div>




<h2>4. Niềng răng có đau không?</h2>


<div class="rich-text">
<p>&nbsp;</p>
<p><strong>Niềng răng cho trẻ</strong>&nbsp;ngày nay sẽ ít đau hơn nhiều so với thời gian trước. Nhiều thập kỷ trước, nha sĩ cần phải dán các mắc cài vào mặt trước của răng để giảm bớt áp lực của các dây kim loại xung quanh mỗi răng. Ngày nay, các khi chỉnh nha được sử dụng linh hoạt hơn, đặc biệt là những dây được làm bằng hợp kim, chẳng hạn như niken titan, giúp tạo áp lực nhẹ nhàng hơn.</p>
<p>Tuy nhiên công nghệ hiện đại hơn vẫn không có nghĩa là niềng răng hoàn toàn không gây đau đớn. Hầu hết trẻ em đều đau nhức trong 1 - 2 ngày sau khi siết chặt niềng răng. Những loại thuốc giảm đau không kê đơn như ibuprofen, thường có tác dụng làm dịu cảm giác khó chịu. Nếu nướu hoặc má bị kích ứng do cọ xát với giá đỡ, bác sĩ chỉnh nha có thể cung cấp sáp bôi trơn và làm mềm để các mô lành lại.</p>
</div>


<figure class="post-image full has-zoomable loaded-img"><img class="full uploaded img-in-body" src="https://vinmec-prod.s3.amazonaws.com/images/20201013_160057_633875_huong-dan-co-ban-ve.max-1800x1800.jpg" alt="trẻ  niềng răng" data-src="https://vinmec-prod.s3.amazonaws.com/images/20201013_160057_633875_huong-dan-co-ban-ve.max-1800x1800.jpg" style="height: 201px;" />
<figcaption class="caption">
<div class="rich-text">Niềng răng có thể gây đau cho trẻ trong một vài ngày</div>
</figcaption>
</figure>


<h2>5. Thời gian và chi phí niềng răng cho trẻ</h2>


<div class="readmore_content_exists">&nbsp;</div>', CAST(N'2022-10-03T21:59:49.720' AS DateTime), N'20201017_191917_128671_kinh-nghiem-hay-cua.max-1800x1800.jpg')
INSERT [dbo].[Post] ([post_id], [title], [description], [cate_id], [detail], [created_at], [image]) VALUES (14, N'123', NULL, 1, N'<p>123</p>', CAST(N'2022-10-04T16:57:53.170' AS DateTime), N'team-3.jpg')
INSERT [dbo].[Post] ([post_id], [title], [description], [cate_id], [detail], [created_at], [image]) VALUES (16, N'12345', NULL, 1, N'<p>45648965156</p>', CAST(N'2022-10-04T16:59:44.167' AS DateTime), N'testimonial-1.jpg')
INSERT [dbo].[Post] ([post_id], [title], [description], [cate_id], [detail], [created_at], [image]) VALUES (17, N'Cẩn trọng với viêm kết mạc hậu COVID-19 ở trẻ', NULL, 3, N'<p class="entry-content__expert"><em>ắt l&agrave; một trong những cơ quan đầu ti&ecirc;n trong cơ thể bị virus SARS-CoV-2 "tấn c&ocirc;ng", v&igrave; thế kh&ocirc;ng &iacute;t trẻ mắc COVID-19 k&egrave;m theo triệu chứng vi&ecirc;m kết mạc (đau mắt đỏ). Nếu kh&ocirc;ng được điều trị hoặc tự &yacute; tra thuốc, bệnh c&oacute; thể dẫn đến tổn thương gi&aacute;c mạc nặng, suy giảm thị lực.</em></p>
<p>Vi&ecirc;m kết mạc l&agrave; bệnh nhiễm tr&ugrave;ng mắt thường gặp, nguy&ecirc;n nh&acirc;n do virus hoặc vi khuẩn, đ&ocirc;i khi do một số t&aacute;c nh&acirc;n dị ứng, c&oacute; thể điều trị v&agrave; ph&ograve;ng tr&aacute;nh được. Những dấu hiệu sớm của COVID-19 như vi&ecirc;m kết mạc cũng thể hiện ở mắt nhưng nhiều khi người bệnh kh&ocirc;ng biết hoặc bỏ qua.</p>
<div id="attachment_29815" class="wp-caption aligncenter"><a href="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/05/word_image_1623395176032.jpg"><img class="size-full wp-image-29815" src="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/05/word_image_1623395176032.jpg" alt="" width="650" height="553" loading="lazy" aria-describedby="caption-attachment-29815"></a>
<p id="caption-attachment-29815" class="wp-caption-text">Vi&ecirc;m kết mạc l&agrave; một trong những biểu hiện của người bệnh dương t&iacute;nh COVID-19</p>
</div>
<p>Theo c&aacute;c chuy&ecirc;n gia y tế, tại Việt Nam chưa c&oacute; nghi&ecirc;n cứu n&agrave;o về COVID-19 ảnh hưởng đến mắt. Tuy nhi&ecirc;n, một ph&acirc;n t&iacute;ch tổng hợp năm 2021 của Nasiri, trong 7.300 bệnh nh&acirc;n COVID-19 đến 11% trường hợp c&oacute; những biểu hiện ở mắt, thường gặp l&agrave; vi&ecirc;m kết mạc, kh&ocirc; mắt, đỏ mắt, chảy nước mắt v&agrave; ngứa. Trong đ&oacute;, 30% bệnh nh&acirc;n mắc di chứng COVID-19 k&eacute;o d&agrave;i c&oacute; c&aacute;c triệu chứng kh&ocirc; mắt, nặng mắt, đau mắt.</p>
<p>ThS. BS Lưu Thị Quỳnh Anh &ndash; Ph&oacute; Trưởng Khoa Mắt, Bệnh viện Nhi Trung ương cho biết: &ldquo;Thời gian gần đ&acirc;y, Khoa Mắt đ&atilde; tiếp nhận kh&aacute; nhiều trường hợp trẻ đến kh&aacute;m trong t&igrave;nh trạng mắt đỏ, ngứa, cộm, chảy nước mắt v&agrave; nhức mắt sau khi khỏi COVID-19&rdquo;</p>
<p><a href="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/05/Mat_999.jpg"><img class="aligncenter size-full wp-image-29816" src="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/05/Mat_999.jpg" alt="" width="650" height="450" loading="lazy"></a></p>
<div id="attachment_29817" class="wp-caption aligncenter"><a href="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/05/z3304179695549_5f59912ea5cef2c882bd10908bda8040.jpg"><img class="size-full wp-image-29817" src="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/05/z3304179695549_5f59912ea5cef2c882bd10908bda8040.jpg" alt="" width="650" height="450" loading="lazy" aria-describedby="caption-attachment-29817"></a>
<p id="caption-attachment-29817" class="wp-caption-text">Trẻ bị vi&ecirc;m kết mạc hậu COVID-19 được kh&aacute;m v&agrave; chẩn đo&aacute;n tại Khoa Mắt &ndash; Bệnh viện Nhi Trung ương</p>
</div>
<p>&ldquo;Nguy&ecirc;n nh&acirc;n ch&iacute;nh khiến trẻ bị đau mắt đỏ sau khi khỏi bệnh l&agrave; virus nh&acirc;n l&ecirc;n trong ni&ecirc;m mạc mắt. Trẻ bị vi&ecirc;m kết mạc hậu COVID-19 thường c&oacute; biểu hiện đỏ mắt ở c&aacute;c phần m&agrave;u trắng của mắt, kh&ocirc;ng g&acirc;y kh&oacute; chịu hoặc mắt c&oacute; thể bị đau, cảm gi&aacute;c ngứa hoặc cộm, chảy nhiều nước mắt v&agrave; gỉ mắt k&egrave;m nhức mắt.&nbsp;Nếu kh&ocirc;ng được chăm s&oacute;c, vệ sinh mắt đ&uacute;ng c&aacute;ch, t&igrave;nh trạng của trẻ c&oacute; thể nặng hơn, dẫn đến những tổn thương kh&oacute; lường, thậm ch&iacute; nếu kh&ocirc;ng điều trị kịp thời c&oacute; thể g&acirc;y mất thị lực, m&ugrave; l&ograve;a&rdquo;&nbsp;&nbsp;&ndash; ThS. BS Lưu Thị Quỳnh Anh chia sẻ th&ecirc;m.</p>
<p>Trong một số trường hợp, dấu hiệu đỏ mắt kh&ocirc;ng đơn thuần l&agrave; vi&ecirc;m kết mạc m&agrave; l&agrave; một số t&igrave;nh trạng nguy hiểm hơn, như vi&ecirc;m m&agrave;ng bồ đ&agrave;o trước (một t&igrave;nh trạng vi&ecirc;m phần trước nh&atilde;n cầu), li&ecirc;n quan đến bệnh l&yacute; đ&aacute;p ứng vi&ecirc;m hệ thống đa cơ quan.</p>
<p>V&igrave; thế, ngay sau khi thấy trẻ c&oacute; những biểu hiện của vi&ecirc;m kết mạc (đau mắt đỏ) hậu COVID, cha mẹ n&ecirc;n đưa con đến gặp b&aacute;c sĩ chuy&ecirc;n khoa Mắt để được thăm kh&aacute;m, chẩn đo&aacute;n v&agrave; can thiệp kịp thời, tr&aacute;nh trường hợp chủ quan, tự chữa tại nh&agrave;, sẽ dẫn đến nhiều nguy hại cho đ&ocirc;i mắt của trẻ.</p>
<p>Cha mẹ cũng n&ecirc;n lưu &yacute; biện ph&aacute;p ph&ograve;ng tr&aacute;nh vi&ecirc;m kết mạc hậu COVID-19 ở trẻ bằng c&aacute;ch:</p>
<ul>
<li>Vệ sinh mắt cho trẻ bằng nước muối sinh l&yacute; 0.9% (loại 10ml) để vệ sinh mắt. Nước muối sinh l&yacute; c&oacute; t&aacute;c dụng rửa tr&ocirc;i virus v&agrave; c&aacute;c yếu tố g&acirc;y vi&ecirc;m khỏi bề mặt nh&atilde;n cầu, gi&uacute;p sự hồi lưu nước mắt v&agrave; hồi phục nhanh hơn trong c&aacute;c trường hợp đau đỏ mắt.</li>
<li>Cha mẹ hạn chế cho con nh&igrave;n điện thoại, m&aacute;y t&iacute;nh, c&aacute;c thiết bị điện tử trong thời gian d&agrave;i để tr&aacute;nh bị mỏi mắt, tổn thương v&otilde;ng mạc.</li>
<li>Trẻ sau khi khỏi COVID-19 c&oacute; t&igrave;nh trạng đau mắt đỏ, cộm, đau nhức nhiều ng&agrave;y, tuyệt đối kh&ocirc;ng được tự &yacute; d&ugrave;ng thuốc, m&agrave; h&atilde;y n&ecirc;n đưa con đến kh&aacute;m b&aacute;c sĩ chuy&ecirc;n khoa để được tư vấn, điều trị đ&uacute;ng c&aacute;ch, tr&aacute;nh biến chứng nặng.</li>
</ul>
<div id="attachment_29820" class="wp-caption aligncenter"><a href="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/05/nuoc-muoi-nho-mat-1.jpg"><img class="size-full wp-image-29820" src="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/05/nuoc-muoi-nho-mat-1.jpg" alt="" width="650" height="465" loading="lazy" aria-describedby="caption-attachment-29820"></a>
<p id="caption-attachment-29820" class="wp-caption-text">C&oacute; thể nhỏ nước muối sinh l&yacute; 0.9% (loại 10ml) để vệ sinh mắt, kh&ocirc;ng tự &yacute; d&ugrave;ng thuốc</p>
</div>', CAST(N'2022-10-04T17:13:08.783' AS DateTime), N'word_image_1623395176032.jpg')
INSERT [dbo].[Post] ([post_id], [title], [description], [cate_id], [detail], [created_at], [image]) VALUES (18, N'Một số điều cần biết về táo bón trẻ em', NULL, 2, N'<h2><strong>I. Đại cương</strong></h2>
<p>T&aacute;o b&oacute;n kh&ocirc;ng phải l&agrave; một bệnh m&agrave; l&agrave; triệu chứng thường gặp trong thực h&agrave;nh nhi khoa v&agrave; gần đ&acirc;y được coi l&agrave; một vấn đề lớn trong sức khoẻ cộng đồng.</p>
<div id="attachment_30202" class="wp-caption aligncenter"><a href="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/06/Mot-so-dieu-can-biet-ve-tao-bon.jpg"><img class="wp-image-30202 size-full" src="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/06/Mot-so-dieu-can-biet-ve-tao-bon.jpg" alt="" width="650" height="449" loading="lazy" aria-describedby="caption-attachment-30202"></a>
<p id="caption-attachment-30202" class="wp-caption-text">Ảnh minh họa (Nguồn: Internet)</p>
</div>
<h3><strong>1. Định nghĩa</strong></h3>
<h4><strong>1.1. Tần suất b&agrave;i xuất ph&acirc;n b&igrave;nh thường ở trẻ em</strong></h4>
<p>Khi đứa trẻ lớn l&ecirc;n, c&aacute;c thay đổi sinh l&yacute; b&igrave;nh thường diễn ra ở ruột non v&agrave; đại tr&agrave;ng sẽ l&agrave;m giảm số lần đại tiện h&agrave;ng ng&agrave;y (bảng 1). Nếu t&aacute;o b&oacute;n được định nghĩa l&agrave; &ldquo;sự suy giảm đại tiện ở đoạn dưới đại tr&agrave;ng một c&aacute;ch ho&agrave;n to&agrave;n&rdquo; th&igrave; thậm ch&iacute; đứa trẻ đại tiện đều h&agrave;ng ng&agrave;y nhưng đi đại tiện vặt th&igrave; cũng được coi l&agrave; t&aacute;o b&oacute;n. Ỉa đ&ugrave;n l&agrave; t&igrave;nh trạng r&ograve; ph&acirc;n ra quần l&oacute;t một c&aacute;ch tự động, đ&oacute; c&oacute; thể l&agrave; dấu hiệu của t&aacute;o b&oacute;n.</p>
<table width="526">
<tbody>
<tr>
<td width="176">
<p><strong>Tuổi</strong></p>
</td>
<td width="170"><strong>Số lần đại tiện trung b&igrave;nh/1 tuần</strong></td>
<td width="180">
<p><strong>Số lần đại tiện&nbsp;</strong><strong>trung b&igrave;nh/1 ng&agrave;y</strong></p>
</td>
</tr>
<tr>
<td width="176">0-3 th&aacute;ng: b&uacute; mẹ</td>
<td width="170">5 &ndash; 40</td>
<td width="180">2,9</td>
</tr>
<tr>
<td width="176">0-3 th&aacute;ng: ăn sữa b&ograve;</td>
<td width="170">5 &ndash; 28</td>
<td width="180">2,0</td>
</tr>
<tr>
<td width="176">6-12 th&aacute;ng</td>
<td width="170">5 &ndash; 28</td>
<td width="180">1,8</td>
</tr>
<tr>
<td width="176">1-3 tuổi</td>
<td width="170">4 &ndash; 21</td>
<td width="180">1,4</td>
</tr>
<tr>
<td width="176">&gt; 3 tuổi</td>
<td width="170">3 &ndash; 14</td>
<td width="180">1,0</td>
</tr>
</tbody>
</table>
<p>Bảng 1. Tần suất đại tiện ở trẻ em</p>
<h4><strong>1.2. Định nghĩa</strong></h4>
<p>T&aacute;o b&oacute;n được chẩn đo&aacute;n theo ti&ecirc;u chuẩn ROME IV, t&aacute;o b&oacute;n chức năng được x&aacute;c định khi:</p>
<p>&ndash; Trẻ dưới 4 tuổi triệu chứng phải k&eacute;o d&agrave;i &iacute;t nhất 1 th&aacute;ng v&agrave; phải c&oacute; &iacute;t nhất 2 trong số c&aacute;c ti&ecirc;u chuẩn sau:</p>
<p>1/ Đại tiện &le; 2 lần/tuần.</p>
<p>2/ Tiền sử ứ ph&acirc;n qu&aacute; mức.</p>
<p>3/ Tiền sử đại tiện ph&acirc;n cứng hoặc đau khi đại tiện.</p>
<p>4/ Tiền sử đại tiện ph&acirc;n khu&ocirc;n k&iacute;ch thước lớn.</p>
<p>5/ C&oacute; khối ph&acirc;n lớn trong trực tr&agrave;ng.</p>
<p>Với những trẻ đ&atilde; được huấn luyện kỹ năng đại tiện ở nh&agrave; vệ sinh (tr&ecirc;n 2,5 tuổi) 2 ti&ecirc;u chuẩn sau c&oacute; thể được sử dụng:</p>
<p>6/ S&oacute;n ph&acirc;n &iacute;t nhất 1 lần/tuần sau khi đ&atilde; đạt được kỹ năng đại tiện ở nh&agrave; vệ sinh.</p>
<p>7/ Tiền sử đại tiện khu&ocirc;n ph&acirc;n k&iacute;ch thước lớn, c&oacute; thể l&agrave;m tắc bồn cầu.</p>
<p>&ndash; Trẻ tr&ecirc;n 4 tuổi c&aacute;c triệu chứng phải xuất hiện &iacute;t nhất 1 lần/ tuần, k&eacute;o d&agrave;i tối thiểu 1 th&aacute;ng v&agrave; phải c&oacute; &iacute;t nhất 2 trong số c&aacute;c ti&ecirc;u chuẩn sau v&agrave; kh&ocirc;ng đủ ti&ecirc;u chuẩn chẩn đo&aacute;n hội chứng ruột k&iacute;ch th&iacute;ch.</p>
<p>1/ Đại tiện &le; 2 lần/tuần.</p>
<p>2/ S&oacute;n ph&acirc;n &iacute;t nhất 1 lần/tuần.</p>
<p>3/ Tiền sử nhịn đi ngo&agrave;i hoặc ứ ph&acirc;n qu&aacute; mức một c&aacute;ch tự &yacute;.</p>
<p>4/ Tiền sử đi ph&acirc;n cứng hoặc đau khi đi ngo&agrave;i.</p>
<p>5/ C&oacute; khối ph&acirc;n lớn trong trực tr&agrave;ng.</p>
<p>6/ Tiền sử đi ngo&agrave;i khu&ocirc;n ph&acirc;n k&iacute;ch thước lớn, c&oacute; thể l&agrave;m tắc bồn cầu.</p>
<p>Sau khi thăm kh&aacute;m, c&aacute;c triệu chứng kh&ocirc;ng thể được giải th&iacute;ch đầy đủ bởi bất kỳ t&igrave;nh trạng bệnh l&yacute; n&agrave;o.</p>
<p>&ndash; T&iacute;nh chất ph&acirc;n:</p>
<p><a href="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/06/Tinh-chat-phan-tao-bon-1.jpg"><img class="aligncenter size-full wp-image-30191" src="https://benhviennhitrunguong.gov.vn/wp-content/uploads/2022/06/Tinh-chat-phan-tao-bon-1.jpg" alt="" width="650" height="389" loading="lazy"></a></p>
<h3><strong>2. Tỷ lệ mắc</strong></h3>
<p>Tỷ lệ t&aacute;o b&oacute;n ở trẻ em dao động trong khoảng 1-30%. T&aacute;o b&oacute;n l&agrave; nguy&ecirc;n nh&acirc;n khiến trẻ phải đi kh&aacute;m tại c&aacute;c ph&ograve;ng kh&aacute;m nhi khoa l&agrave; 3-5% v&agrave; tại c&aacute;c ph&ograve;ng kh&aacute;m chuy&ecirc;n khoa ti&ecirc;u h&oacute;a nhi l&agrave; 35%.</p>
<h2><strong>II. Nguy&ecirc;n nh&acirc;n</strong></h2>
<h3><strong>1. T&aacute;o b&oacute;n do nguy&ecirc;n nh&acirc;n thực thể</strong></h3>
<p>Chiếm 5% &ndash; 10% c&aacute;c trường hợp t&aacute;o b&oacute;n. Cần ph&acirc;n loại chọn lọc sớm v&igrave; đ&ograve;i hỏi biện ph&aacute;p điều trị đặc hiệu v&agrave; đề ph&ograve;ng những biến chứng nặng nề như bệnh ph&igrave;nh to đại tr&agrave;ng (bệnh Hirschsprung) v&agrave; suy gi&aacute;p trạng (bệnh myxoedeme).</p>
<p>&ndash; Nguy&ecirc;n nh&acirc;n đường ruột: bệnh Hirschsprung, dị tật hậu m&ocirc;n trực tr&agrave;ng, loạn sản thần kinh đường ruột</p>
<p>&ndash; Nguy&ecirc;n nh&acirc;n chuyển ho&aacute;/nội tiết: suy gi&aacute;p, đ&aacute;i th&aacute;o đường, tăng canxi huyết, hạ kali huyết, nhiễm độc vitamin D</p>
<p>&ndash; Thuốc: Opioid, kh&aacute;ng cholinergic, chống trầm cảm</p>
<p>&ndash; C&aacute;c nguy&ecirc;n nh&acirc;n kh&aacute;c: biếng ăn t&acirc;m thần, lạm dụng t&igrave;nh dục, xơ cứng b&igrave;, xơ nang ho&aacute;</p>
<h3><strong>2. T&aacute;o b&oacute;n do nguy&ecirc;n nh&acirc;n cơ năng</strong></h3>
<p>&ndash; L&agrave; t&aacute;o b&oacute;n khi đ&atilde; loại trừ c&aacute;c nguy&ecirc;n nh&acirc;n thực thể về giải phẫu, tổ chức sinh ho&aacute; học, chỉ c&oacute; chức năng ống ti&ecirc;u ho&aacute; chưa ho&agrave;n thiện trong đ&oacute; c&oacute; hai chức năng ti&ecirc;u ho&aacute; l&agrave;:</p>
<ul>
<li>Hấp thụ nước v&agrave; điện giải ở ruột cuối.</li>
<li>Động t&aacute;c co b&oacute;p, đẩy tống ph&acirc;n ra.</li>
</ul>
<p>&ndash; T&aacute;o b&oacute;n cơ năng bao gồm:</p>
<ul>
<li>T&aacute;o b&oacute;n cơ năng m&atilde;n t&iacute;nh tự ph&aacute;t</li>
<li>Hội chứng ruột k&iacute;ch th&iacute;ch đi k&egrave;m với t&aacute;o b&oacute;n</li>
</ul>
<p>&ndash; C&oacute; 3 loại t&aacute;o b&oacute;n cơ năng m&atilde;n t&iacute;nh tự ph&aacute;t:</p>
<ul>
<li>T&aacute;o b&oacute;n c&oacute; thời gian chuyển tiếp b&igrave;nh thường</li>
<li>T&aacute;o b&oacute;n c&oacute; thời gian chuyển tiếp chậm</li>
<li>T&aacute;o b&oacute;n do rối loạn đường ra-t&aacute;o b&oacute;n loạn đồng vận.</li>
</ul>
<h2><strong>III. Chẩn đo&aacute;n</strong></h2>
<p>Chẩn đo&aacute;n chủ yếu dựa tr&ecirc;n l&acirc;m s&agrave;ng. Tiền sử v&agrave; kh&aacute;m thể chất l&agrave; nền tảng trong chẩn đo&aacute;n v&agrave; điều trị t&aacute;o b&oacute;n m&atilde;n t&iacute;nh.</p>
<h3><strong>1. Bệnh sử</strong></h3>
<ul>
<li>Bệnh sử chi tiết v&agrave; kh&aacute;m thực thể cẩn thận sẽ gi&uacute;p trong chẩn đo&aacute;n ph&acirc;n biệt đối với hầu hết bệnh nh&acirc;n. Việc ch&uacute; &yacute; đến kiểu đại tiện trong thời kỳ sơ sinh sẽ gi&uacute;p cho b&aacute;c sĩ ph&aacute;t hiện được bệnh Hirschsprung.</li>
<li>C&aacute;c triệu chứng sau thường thấy ở trẻ em bị t&aacute;o b&oacute;n tự ph&aacute;t: tần suất đại tiện &iacute;t hơn 3 lần trong một tuần, đau khi đại tiện, nhịn ph&acirc;n, ph&acirc;n rắn, s&oacute;n ph&acirc;n v&agrave; đau bụng. Tuy nhi&ecirc;n, c&aacute;c triệu chứng quan trọng kh&aacute;c c&oacute; thể l&agrave; đường k&iacute;nh v&agrave; chiều d&agrave;i của khối ph&acirc;n (tắc nh&agrave; vệ sinh), kiểu v&agrave; thời gian s&oacute;n ph&acirc;n (chẳng hạn, sau giờ học), biếng ăn, đau bụng thường được giảm nhẹ bằng c&aacute;ch đại tiện.</li>
<li>Thuốc hoặc c&aacute;c yếu tố phơi nhiễm trong m&ocirc;i trường c&oacute; thể g&acirc;y ra t&aacute;o b&oacute;n cần được l&agrave;m r&otilde;.</li>
<li>Tiền sử ph&aacute;t triển c&oacute; thể cho thấy sự chậm ph&aacute;t triển tinh thần-vận động, tự kỷ, hoặc c&aacute;c rối loạn h&agrave;nh vi kh&aacute;c.</li>
</ul>
<h3><strong>2. Kh&aacute;m thể chất</strong></h3>
<h4><strong>2.1. Kh&aacute;m bụng</strong></h4>
<ul>
<li>Kh&aacute;m bụng thấy c&oacute; u ph&acirc;n/l&egrave;n ph&acirc;n ở khoảng một nửa số bệnh nh&acirc;n.</li>
</ul>
<h4><strong>2.2. Kh&aacute;m hậu m&ocirc;n &ndash; trực tr&agrave;ng bằng tay</strong></h4>
<ul>
<li>Kh&aacute;m trực tr&agrave;ng v&agrave; v&ugrave;ng quanh hậu m&ocirc;n bằng tay cung cấp nhiều th&ocirc;ng tin nhất trong đ&aacute;nh gi&aacute; l&acirc;m s&agrave;ng.</li>
<li>Kh&aacute;m hậu m&ocirc;n trực tr&agrave;ng c&oacute; thể ph&aacute;t hiện được trầy da, nếp da, nứt kẽ hậu m&ocirc;n hoặc hậu m&ocirc;n lạc chỗ.</li>
<li>Đ&aacute;nh gi&aacute; cảm gi&aacute;c đ&aacute;y chậu v&agrave; phản xạ da hậu m&ocirc;n bằng c&aacute;ch chọc nhẹ v&ugrave;ng da quanh hậu m&ocirc;n bằng tăm b&ocirc;ng hoặc kim đầu t&ugrave; ở tất cả c&aacute;c g&oacute;c phần tư sẽ g&acirc;y ra qu&aacute; tr&igrave;nh co phản xạ cơ thắt hậu m&ocirc;n ngo&agrave;i. Nếu kh&ocirc;ng c&oacute; phản xạ n&agrave;y, c&oacute; thể nghi ngờ bệnh l&yacute; thần kinh.</li>
<li>Kh&aacute;m trực tr&agrave;ng bằng tay c&oacute; thể ph&aacute;t hiện hẹp hậu m&ocirc;n, co thắt, đoạn mềm, khối ph&acirc;n hoặc m&aacute;u.</li>
</ul>
<h2><strong>IV. Cận l&acirc;m s&agrave;ng</strong></h2>
<h3><strong>1. X-quang bụng thẳng</strong></h3>
<ul>
<li>X-quang bụng thẳng được thực hiện để x&aacute;c định mức độ giữ ph&acirc;n trong đại tr&agrave;ng v&agrave; trực tr&agrave;ng.</li>
</ul>
<h3><strong>2. Chụp đại tr&agrave;ng c&oacute; cản quang</strong></h3>
<ul>
<li>Chụp khung đại tr&agrave;ng c&oacute; bơm thuốc cản quang c&oacute; &iacute;ch chủ yếu ở bệnh nh&acirc;n c&oacute; bệnh sử hoặc kết quả kh&aacute;m cho thấy nhiều khả năng bị gi&atilde;n trực tr&agrave;ng hoặc ph&igrave;nh đại tr&agrave;ng bẩm sinh.</li>
<li>Trong trường hợp điển h&igrave;nh, thuốc đi từ trực tr&agrave;ng kh&ocirc;ng gi&atilde;n qua một đoạn chuyển tiếp h&igrave;nh phễu đến đoạn đại tr&agrave;ng ph&iacute;a tr&ecirc;n gi&atilde;n.</li>
<li>Phim nghi&ecirc;ng thường thấy r&otilde; ba đoạn ruột c&oacute; k&iacute;ch thước kh&aacute;c nhau: đoạn hẹp, đoạn chuyển tiếp v&agrave; đoạn gi&atilde;n.</li>
</ul>
<h3><strong>3. Chụp Sitzmark</strong></h3>
<ul>
<li>Để đ&aacute;nh gi&aacute; thời gian chuyển tiếp trong đại tr&agrave;ng cần phải uống 24 chỉ thị cản quang v&agrave; định lượng c&aacute;c chỉ thị n&agrave;y tr&ecirc;n phim chụp bụng thẳng. Thời gian chuyển tiếp trong ruột b&igrave;nh thường sẽ c&oacute; sự thải loại &iacute;t nhất 80% chỉ thị v&agrave;o ng&agrave;y thứ 5 x&eacute;t nghiệm.</li>
<li>Đo thời gian chuyển tiếp trong đại tr&agrave;ng cho ph&eacute;p chẩn đo&aacute;n ph&acirc;n biệt t&aacute;o b&oacute;n c&oacute; thời gian chuyển tiếp trong đại tr&agrave;ng chậm với t&aacute;o b&oacute;n c&oacute; thời gian chuyển tiếp b&igrave;nh thường.</li>
<li>Đo thời gian chuyển tiếp trong đại tr&agrave;ng thường được chỉ định ở trẻ em bị t&aacute;o b&oacute;n mạn t&iacute;nh kh&aacute;ng thuốc.</li>
</ul>
<h3><strong>4. Đo &aacute;p lực hậu m&ocirc;n trực tr&agrave;ng</strong></h3>
<ul>
<li>Đo &aacute;p lực hậu m&ocirc;n trực tr&agrave;ng l&agrave; một tập hợp c&aacute;c x&eacute;t nghiệm kh&aacute;c nhau đo sự thay đổi &aacute;p lực trong trực tr&agrave;ng v&agrave; ống hậu m&ocirc;n. X&eacute;t nghiệm n&agrave;y thường được kết hợp với điện cơ đồ điện cực bề mặt cơ thắt hậu m&ocirc;n ngo&agrave;i v&agrave; cơ mu trực tr&agrave;ng. X&eacute;t nghiệm n&agrave;y sẽ cung cấp chi tiết về cảm gi&aacute;c trực tr&agrave;ng, phản xạ ức chế hậu m&ocirc;n trực tr&agrave;ng, trương lực của cơ thắt hậu m&ocirc;n v&agrave; động lực đại tiện.</li>
<li>Ưu điểm quan trọng nhất của đo &aacute;p lực hậu m&ocirc;n trực tr&agrave;ng ở trẻ em bị t&aacute;o b&oacute;n l&agrave; loại trừ bệnh Hirschsprung. Th&ocirc;ng thường, sự c&oacute; mặt của phản xạ ức chế hậu m&ocirc;n trực tr&agrave;ng sẽ loại trừ bệnh Hirschsprung.</li>
</ul>
<h3><strong>5. Defecography</strong></h3>
<ul>
<li>Chụp ảnh qu&aacute; tr&igrave;nh đại tiện c&oacute; gi&aacute; trị trong đ&aacute;nh gi&aacute; rối loạn chức năng th&ocirc;ng thường của đ&aacute;y chậu.</li>
<li>To&agrave;n bộ qu&aacute; tr&igrave;nh đại tiện c&oacute; thể được xem x&eacute;t v&agrave; c&oacute; thể ph&aacute;t hiện c&aacute;c bất thường như sa trực tr&agrave;ng, lồng ruột v&agrave; co cơ mu trực tr&agrave;ng nghịch l&yacute; trong qu&aacute; tr&igrave;nh đại tiện, đồng thời đ&aacute;nh gi&aacute; được cả g&oacute;c hậu m&ocirc;n trực tr&agrave;ng.</li>
</ul>
<h2><strong>V. Điều trị t&aacute;o b&oacute;n cơ năng</strong></h2>
<h3><strong>1. Gi&aacute;o dục v&agrave; điều trị h&agrave;nh vi</strong></h3>
<ul>
<li>Cộng đồng c&oacute; nhiều kh&aacute;i niệm kh&aacute;c nhau về t&aacute;o b&oacute;n c&oacute; thể ảnh hưởng đến qu&aacute; tr&igrave;nh điều trị l&acirc;m s&agrave;ng. Do đ&oacute;, gi&aacute;o dục nhận thức cho cha mẹ v&agrave; bệnh nh&acirc;n về sinh l&yacute; bệnh v&agrave; c&aacute;c yếu tố nguy cơ sẽ gi&uacute;p giảm lo &acirc;u v&agrave; tăng mức độ tham gia v&agrave;o qu&aacute; tr&igrave;nh điều trị.</li>
<li>Điều trị h&agrave;nh vi đối với trẻ bị t&aacute;o b&oacute;n nhằm điều chỉnh th&oacute;i quen đại tiện, loại bỏ th&oacute;i quen giữ ph&acirc;n.</li>
<li>Tăng cường hoạt động thể lực vận động.</li>
<li>Tập cho trẻ t&aacute;c phong đi ngo&agrave;i h&agrave;ng ng&agrave;y. Tạo th&oacute;i quen đi vệ sinh tốt với mục ti&ecirc;u l&agrave; l&agrave;m cho đứa trẻ đi vệ sinh v&agrave;o những thời điểm đều đặn (chẳng hạn sau bữa ăn, trước khi đi ngủ).</li>
<li>Ghi lại tất cả c&aacute;c lần đại tiện l&ecirc;n bảng (nhật k&iacute; đại tiện). Thời gian, lượng, v&agrave; vị tr&iacute; đại tiện (chẳng hạn, v&agrave;o bỉm, quần, nh&agrave; vệ sinh, hoặc một chỗ kh&aacute;c) v&agrave; s&oacute;n ph&acirc;n sẽ cho biết những thời điểm n&agrave;o trong ng&agrave;y sẽ l&agrave; thời điểm đại tiện th&agrave;nh c&ocirc;ng nhất khi v&agrave;o nh&agrave; vệ sinh.</li>
</ul>
<h3><strong>2. Chế độ ăn</strong></h3>
<ul>
<li>Đ&acirc;y l&agrave; một phương ph&aacute;p phổ biến hướng dẫn bệnh nh&acirc;n bị t&aacute;o b&oacute;n tăng lượng dịch lỏng v&agrave; lượng chất xơ ăn v&agrave;o.</li>
<li>Lượng chất xơ ăn v&agrave;o thấp đ&atilde; được coi l&agrave; yếu tố nguy cơ đối với t&aacute;o b&oacute;n.</li>
<li>Lượng chất xơ ăn h&agrave;ng n&agrave;y tối thiểu được khuyến c&aacute;o l&agrave;: (tuổi + 5g/ng&agrave;y).</li>
<li>V&iacute; dụ về c&aacute;c thức ăn c&oacute; chất xơ bao gồm:</li>
</ul>
<table width="493">
<tbody>
<tr>
<td width="342"><strong>Thức ăn chứa chất xơ</strong></td>
<td width="151"><strong>H&agrave;m lượng chất xơ</strong></td>
</tr>
<tr>
<td colspan="2"><strong>B&aacute;nh mỳ, ngũ cốc v&agrave; lạc</strong></td>
</tr>
<tr>
<td><sup>1</sup>/2 cốc đậu đen, nấu ch&iacute;n</td>
<td>4,0g</td>
</tr>
<tr>
<td><sup>1</sup>/2 cốc đậu t&acirc;y, nấu ch&iacute;n</td>
<td>5,7g</td>
</tr>
<tr>
<td><sup>1</sup>/2 cốc đậu lima, nấu ch&iacute;n</td>
<td>4.5g</td>
</tr>
<tr>
<td colspan="2"><strong>Ngũ cốc nguy&ecirc;n hạt, lạnh</strong></td>
</tr>
<tr>
<td><sup>1</sup>/2 cốc ngũ cốc nguy&ecirc;n c&aacute;m</td>
<td>9,6g</td>
</tr>
<tr>
<td><sup>3</sup>/4 cốc ngũ cốc to&agrave;n phần</td>
<td>2.4g</td>
</tr>
<tr>
<td><sup>3</sup>/4 cốc ngũ cốc sau khi x&aacute;t</td>
<td>5,3g</td>
</tr>
<tr>
<td>1 g&oacute;i ngũ cốc nguy&ecirc;n hạt, n&oacute;ng (oatmeal, Wheatena)</td>
<td>3,0g</td>
</tr>
<tr>
<td>1 l&aacute;t l&uacute;a mỳ nguy&ecirc;n hạt hoặc bột mỳ</td>
<td>1,7g</td>
</tr>
<tr>
<td colspan="2"><strong>Hoa quả</strong></td>
</tr>
<tr>
<td>1 quả t&aacute;o cỡ trung b&igrave;nh</td>
<td>3,3g</td>
</tr>
<tr>
<td>1 quả đ&agrave;o cỡ trung b&igrave;nh</td>
<td>1,8g</td>
</tr>
<tr>
<td>1/2 cốc m&acirc;m x&ocirc;i</td>
<td>4,0g</td>
</tr>
<tr>
<td>1 quả qu&yacute;t cỡ trung b&igrave;nh</td>
<td>1,9g</td>
</tr>
<tr>
<td colspan="2"><strong>Rau</strong></td>
</tr>
<tr>
<td>1 cốc b&iacute; ng&ocirc;, tươi</td>
<td>2,1g</td>
</tr>
<tr>
<td>1 c&acirc;y cải xanh trung b&igrave;nh, tươi</td>
<td>3,9g</td>
</tr>
<tr>
<td>5 c&acirc;y cải bỉ, tươi</td>
<td>3,6g</td>
</tr>
<tr>
<td>1 cốc cải bắp, tươi</td>
<td>2,0g</td>
</tr>
<tr>
<td>1 quả c&agrave; rốt trung b&igrave;nh, tươi</td>
<td>1,8g</td>
</tr>
<tr>
<td>1 cốc s&uacute;p lơ, tươi</td>
<td>2,5g</td>
</tr>
<tr>
<td>1 cốc rau ch&acirc;n vịt, nấu ch&iacute;n</td>
<td>4,3g</td>
</tr>
<tr>
<td>1 cốc b&iacute; xanh, tươi</td>
<td>1,4g</td>
</tr>
</tbody>
</table>
<p><em>Nguồn: USDA/ARS Nutrient Data Laboratory</em></p>
<ul>
<li>Ngừng hoặc hạn chế sử dụng c&aacute;c thuốc g&acirc;y t&aacute;o b&oacute;n.</li>
</ul>
<h3><strong>3. Thuốc</strong></h3>
<ul>
<li>Thuốc b&ocirc;i trơn: dầu parafine.</li>
<li>Thuốc nhuận tr&agrave;ng thẩm thấu: Lactulose, Hydroxit magie, Polyethylen glycol, PEG, Sorbitol</li>
<li>Thuốc nhuận tr&agrave;ng k&iacute;ch th&iacute;ch: Xiro Senna, Bisacodyl (vi&ecirc;n n&eacute;n 5mg)</li>
</ul>
<h3><strong>4. Điều trị phản hồi sinh học &ndash; Biofeedback</strong></h3>
<ul>
<li>Phản hồi sinh học l&agrave; một chương tr&igrave;nh luyện tập để học c&aacute;ch kiểm so&aacute;t c&aacute;c hoạt động sinh học của cơ thể.</li>
<li>Trong phản hồi sinh học, bệnh nh&acirc;n được cung cấp biểu đồ bằng h&igrave;nh ảnh về &aacute;p lực trực tr&agrave;ng v&agrave; điện cơ đồ của cơ thắt hậu m&ocirc;n ngo&agrave;i v&agrave; được hướng dẫn để gi&atilde;n cơ thắt hậu m&ocirc;n ngo&agrave;i c&ugrave;ng với sự gia tăng &aacute;p lực trực tr&agrave;ng. Phương ph&aacute;p n&agrave;y c&oacute; t&aacute;c dụng tốt đối với bệnh nh&acirc;n bị t&aacute;o b&oacute;n loạn đồng vận đ&aacute;y chậu v&agrave; gi&uacute;p những bệnh nh&acirc;n n&agrave;y gi&atilde;n đ&aacute;y chậu v&agrave; cơ thắt hậu m&ocirc;n ngo&agrave;i để c&oacute; thể đạt được khả năng đại tiện b&igrave;nh thường.</li>
<li>Phương ph&aacute;p n&agrave;y kh&ocirc;ng cải thiện t&aacute;o b&oacute;n do thời gian chuyển tiếp chậm.</li>
</ul>
<h3><strong>5. Phẫu thuật</strong></h3>
<ul>
<li>Phương &aacute;n phẫu thuật cần được xem x&eacute;t chỉ khi điều trị bằng thuốc v&agrave; điều trị phản hồi sinh học thất bại trong t&aacute;o b&oacute;n k&eacute;o d&agrave;i.</li>
</ul>
<p><strong>Bất cứ khi n&agrave;o trẻ c&oacute; c&aacute;c dấu hiệu bị t&aacute;o b&oacute;n hoặc nghi ngờ t&aacute;o b&oacute;n, bố mẹ hoặc người gi&aacute;m hộ c&oacute; thể đưa trẻ đến kh&aacute;m tại c&aacute;c đơn vị sau:</strong></p>
<ul>
<li>Khoa kh&aacute;m bệnh đa khoa</li>
<li>Khoa kh&aacute;m bệnh chuy&ecirc;n khoa</li>
<li>Trung t&acirc;m Quốc tế.</li>
</ul>', CAST(N'2022-10-04T17:14:04.017' AS DateTime), N'Mot-so-dieu-can-biet-ve-tao-bon.jpg')
INSERT [dbo].[Post] ([post_id], [title], [description], [cate_id], [detail], [created_at], [image]) VALUES (19, N'Cảnh giác: Con bạn có thể đang sử dụng quá nhiều kem đánh răng', NULL, 1, N'<div class="rich-text">
<p><strong>Hiện nay rất nhiều trẻ em bị s&acirc;u răng. Để bảo vệ răng miệng cho con, bạn cần hướng dẫn b&eacute; chải răng đ&uacute;ng c&aacute;ch &iacute;t nhất 2 lần mỗi ng&agrave;y. Nhưng nhiều phụ huynh vẫn chưa r&otilde; trẻ nhỏ c&oacute; cần kem đ&aacute;nh răng hay kh&ocirc;ng, chọn loại n&agrave;o v&agrave; d&ugrave;ng bao nhi&ecirc;u kem đ&aacute;nh răng mỗi lần?</strong></p>
</div>
<h2>1. Cho trẻ d&ugrave;ng bao nhi&ecirc;u kem đ&aacute;nh răng mỗi lần?</h2>
<div class="rich-text">
<p>&nbsp;</p>
<p>C&aacute;ch tốt nhất để đ&aacute;nh răng cho con l&agrave; sử dụng một b&agrave;n chải đ&aacute;nh răng nhỏ, mềm v&agrave; một &iacute;t&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/co-the-nguoi/fluor-174/"><strong class="link-in-body">kem đ&aacute;nh răng c&oacute; chứa fluor</strong></a>. Bạn c&oacute; thể chọn bất kỳ loại kem đ&aacute;nh răng n&agrave;o c&oacute; chứa fluor. Lưu &yacute; rằng nhiều loại&nbsp;<strong>kem đ&aacute;nh răng cho trẻ</strong>&nbsp;sơ sinh v&agrave; trẻ nhỏ được b&aacute;n tr&ecirc;n thị trường kh&ocirc;ng chứa florua.</p>
<p>Ngay khi răng của con bắt đầu nh&uacute; l&ecirc;n, h&atilde;y d&ugrave;ng một &iacute;t&nbsp;<strong>kem đ&aacute;nh răng cho trẻ</strong>&nbsp;c&oacute; k&iacute;ch thước bằng hạt gạo. Sau khi b&eacute; được 3 tuổi, bạn c&oacute; thể sử dụng một lượng cỡ hạt đậu. Đảm bảo l&agrave;m theo c&aacute;c khuyến nghị n&agrave;y v&agrave;&nbsp;<a class="link-in-body" href="https://www.vinmec.com/en/tin-tuc/thong-tin-suc-khoe/huong-dan-me-cham-soc-rang-mieng-cho-tre-theo-tung-do-tuoi/"><strong class="link-in-body">hướng dẫn chăm s&oacute;c răng miệng cho trẻ theo từng độ tuổi</strong></a>&nbsp;để tr&aacute;nh cho trẻ hấp thụ qu&aacute; nhiều florua.</p>
<p>Fluor mang đến một số lợi &iacute;ch cho những chiếc răng đang ph&aacute;t triển của trẻ. Kho&aacute;ng chất n&agrave;y tăng cường men răng, chống lại axit v&agrave; vi khuẩn c&oacute; hại, từ đ&oacute; ngăn ngừa&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/tac-hai-cua-sau-rang-tre-em/"><strong class="link-in-body">s&acirc;u răng</strong></a>. Trẻ nhỏ c&oacute; thể nhận được florua từ kem đ&aacute;nh răng, nước v&agrave; c&aacute;c chất bổ sung nếu cần. Nước đ&oacute;ng chai v&agrave; nước tr&aacute;i c&acirc;y cũng c&oacute; thể chứa florua, mặc d&ugrave; kh&ocirc;ng phải l&uacute;c n&agrave;o cũng được ghi tr&ecirc;n nh&atilde;n. Đ&ocirc;i khi nha sĩ cũng sẽ phủ một lớp dầu b&oacute;ng c&oacute; chứa fluor l&ecirc;n răng của b&eacute; trong mỗi lần đến kh&aacute;m răng.</p>
<p>Hầu hết c&aacute;c nguồn cung cấp nước trong th&agrave;nh phố đều được tăng cường đủ fluor. Nếu bạn lấy nước từ giếng, n&ecirc;n c&acirc;n nhắc mua một bộ x&eacute;t nghiệm nguồn nước từ sở y tế địa phương hoặc hiệu thuốc. Nếu h&agrave;m lượng florua &lt;0,3&permil; (nhỏ hơn 0,3 phần triệu), h&atilde;y hỏi nha sĩ c&oacute; n&ecirc;n cho trẻ uống bổ sung flour hay kh&ocirc;ng.</p>
<p>Lưu &yacute;, chỉ một &iacute;t florua sẽ tốt cho răng của con bạn, nhưng nuốt qu&aacute; nhiều florua theo thời gian c&oacute; thể dẫn đến việc nhiễm fluor. Biểu hiện của t&igrave;nh trạng n&agrave;y l&agrave; xuất hiện c&aacute;c đốm trắng tr&ecirc;n răng của con. Đ&oacute; l&agrave; l&yacute; do tại sao kh&ocirc;ng n&ecirc;n sử dụng qu&aacute; nhiều&nbsp;<strong>kem đ&aacute;nh răng cho trẻ</strong>, đặc biệt l&agrave; khi trẻ chưa biết c&aacute;ch s&uacute;c miệng v&agrave; nhổ ra.</p>
<p>Một số nha sĩ cũng khuy&ecirc;n bạn n&ecirc;n d&ugrave;ng chỉ nha khoa để l&agrave;m sạch kẽ răng của b&eacute;. Thời điểm tốt nhất để d&ugrave;ng chỉ nha khoa l&agrave; ngay sau khi&nbsp;<strong>trẻ đ&aacute;nh răng</strong>&nbsp;để chỉ nha khoa mang florua từ kem đ&aacute;nh răng xuống kẽ răng.</p>
</div>
<figure class="post-image full"><img class="full uploaded img-in-body" src="https://vinmec-prod.s3.amazonaws.com/images/20201017_191917_128671_kinh-nghiem-hay-cua.max-1800x1800.jpg" alt="trẻ đ&aacute;nh răng" data-src="https://vinmec-prod.s3.amazonaws.com/images/20201017_191917_128671_kinh-nghiem-hay-cua.max-1800x1800.jpg">
<figcaption class="caption">
<div class="rich-text">Cha mẹ n&ecirc;n lựa chọn loại kem đ&aacute;nh răng d&agrave;nh ri&ecirc;ng cho trẻ nhỏ</div>
</figcaption>
</figure>
<div class="post-banner-middle"><a id="banner-middle" class="item" href="https://i.vinmec.com/dangkytuvandinhduong?utm_source=bannertuvan&amp;utm_medium=mid&amp;utm_campaign=tuvandinhduong" data-event-category="Homepage banner" data-event-action="Click on banner" data-event-label=""><img id="img-banner-middle" class="middle-post-details-bannertuvandinhduongmidle" src="https://vinmec-prod.s3.amazonaws.com/images/vicaread/20210806_050400_017861_22_Laminkid_middle_destop.jpg" alt="banner image" data-gtm-vis-first-on-screen-11692848_412="3947"></a></div>
<h2>2. Khi n&agrave;o c&oacute; thể cho trẻ bắt đầu tự đ&aacute;nh răng?</h2>
<div class="rich-text">
<p>&nbsp;</p>
<p>Mặc d&ugrave; trẻ dưới 7 tuổi c&oacute; thể kh&ocirc;ng th&agrave;nh thạo việc tự đ&aacute;nh răng, nhưng bố mẹ n&ecirc;n để con thử v&agrave; tập dần ngay khi b&eacute; sẵn s&agrave;ng. Quy tắc chung khi&nbsp;<strong>trẻ đ&aacute;nh răng</strong>&nbsp;l&agrave;:</p>
<ul>
<li>Chải răng 2 lần mỗi ng&agrave;y, v&agrave;o buổi s&aacute;ng v&agrave; buổi tối sau khi ăn tối</li>
<li>Nhẹ nh&agrave;ng chải răng ở cả mặt trong v&agrave; mặt ngo&agrave;i</li>
<li>Đừng qu&ecirc;n l&agrave;m vệ sinh lưỡi để loại bỏ vi khuẩn g&acirc;y h&ocirc;i miệng</li>
<li>Dạy con&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/suc-khoe-tong-quat/luu-y-khi-su-dung-nuoc-suc-mieng-diet-khuan/"><strong class="link-in-body">s&uacute;c miệng</strong></a>&nbsp;sạch bằng nước để tr&aacute;nh nuốt kem đ&aacute;nh răng.</li>
</ul>
<p>Khi bắt đầu dạy con tự&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/danh-rang-nao-la-dung-cach/"><strong class="link-in-body">đ&aacute;nh răng đ&uacute;ng c&aacute;ch</strong></a>, bố mẹ đồng thời cũng đ&aacute;nh răng c&ugrave;ng với b&eacute;, sau đ&oacute; kiểm tra răng của nhau xem c&oacute; sạch kh&ocirc;ng. N&oacute;i với con rằng bạn đ&atilde; ph&aacute;t hiện được những nơi b&eacute; qu&ecirc;n l&agrave;m sạch, đồng thời để con t&igrave;m kiếm v&agrave; ph&aacute;t hiện &ldquo;lỗi&rdquo; đ&aacute;nh răng của bạn.</p>
<p>Nếu con quấy kh&oacute;c khi đến giờ đ&aacute;nh răng, bạn c&oacute; thể mua cho con một chiếc b&agrave;n chải c&oacute; nh&acirc;n vật hoạt h&igrave;nh y&ecirc;u th&iacute;ch. Bạn cũng c&oacute; thể chuẩn bị cho con nhiều b&agrave;n chải với nhiều m&agrave;u sắc kh&aacute;c nhau, sau đ&oacute; để trẻ chọn c&aacute;i muốn d&ugrave;ng trong giờ chải răng ng&agrave;y h&ocirc;m đ&oacute;. Đừng qu&ecirc;n thay b&agrave;n chải đ&aacute;nh răng mới cho b&eacute; khi thấy l&ocirc;ng b&agrave;n chải bắt đầu m&ograve;n hoặc bong ra.</p>
<p>Giải ph&aacute;p kh&aacute;c l&agrave; để&nbsp;<strong>trẻ đ&aacute;nh răng</strong>&nbsp;trong l&uacute;c đang ph&acirc;n t&acirc;m, v&iacute; dụ như xem tivi, gi&uacute;p trẻ dần quen với m&ugrave;i vị v&agrave; cảm gi&aacute;c khi đ&aacute;nh răng. Một phụ huynh gợi &yacute; đ&aacute;nh răng cho con khi b&eacute; đang chơi trong bồn tắm. Bạn c&oacute; thể chải răng cho c&aacute;c ch&uacute; vịt nhựa v&agrave; những đồ chơi kh&aacute;c của con, bảo rằng &ldquo;c&aacute;c bạn&rdquo; đều sạch sẽ khi v&agrave;o bồn tắm v&agrave; khuy&ecirc;n con l&agrave;m theo.</p>
</div>
<h2 class="">3. Ph&ograve;ng ngừa s&acirc;u răng cho trẻ nhỏ</h2>
<div class="rich-text">
<p>Nguy&ecirc;n nh&acirc;n s&acirc;u răng ở trẻ em chủ yếu l&agrave; do c&aacute;c b&eacute; hay ăn vặt, nhưng lại chưa biết vệ sinh răng sạch sẽ. Đồ ngọt (bao gồm tr&aacute;i c&acirc;y, tr&aacute;i c&acirc;y sấy kh&ocirc;, nước tr&aacute;i c&acirc;y v&agrave; c&aacute;c loại thực phẩm như bơ đậu phộng v&agrave; thạch rau c&acirc;u...) v&agrave; tinh bột (như b&aacute;nh m&igrave;, b&aacute;nh quy, m&igrave; ống,...) c&oacute; thể g&oacute;p phần g&acirc;y s&acirc;u răng.</p>
</div>
<figure class="post-image full has-zoomable loaded-img"><img class="full uploaded img-in-body" src="https://vinmec-prod.s3.amazonaws.com/images/20200414_051456_743822_treem.max-1800x1800.jpg" alt="Chế độ ăn trẻ nhỏ, trẻ em ăn" data-src="https://vinmec-prod.s3.amazonaws.com/images/20200414_051456_743822_treem.max-1800x1800.jpg">
<figcaption class="caption">
<div class="rich-text">Nguy&ecirc;n nh&acirc;n s&acirc;u răng ở trẻ em chủ yếu l&agrave; do c&aacute;c b&eacute; hay ăn vặt</div>
</figcaption>
</figure>
<div class="rich-text">
<p>&nbsp;</p>
<p>Bạn c&oacute; thể khuyến kh&iacute;ch trẻ d&ugrave;ng những thực phẩm n&agrave;y v&agrave;o bữa ăn ch&iacute;nh thay v&igrave; ăn vặt để ch&uacute;ng dễ bị ph&acirc;n hủy v&agrave; kh&ocirc;ng b&aacute;m tr&ecirc;n răng qu&aacute; l&acirc;u. Ăn những m&oacute;n n&agrave;y c&ugrave;ng với nước cũng rất hữu &iacute;ch. Ngo&agrave;i hạn chế cho con ăn vặt, bố mẹ cũng cần&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/bo-sung-chat-xo-qua-che-do-hop-ly/"><strong class="link-in-body">bổ sung nhiều chất xơ</strong></a>&nbsp;v&agrave;&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/dinh-duong/danh-sach-cac-loai-thuc-pham-giau-canxi-nhat/"><strong class="link-in-body">canxi</strong></a>&nbsp;trong bữa ăn để răng của b&eacute; ph&aacute;t triển tốt hơn.</p>
<p>Học viện Nhi khoa Hoa Kỳ khuy&ecirc;n bạn n&ecirc;n đưa con đến gặp nha sĩ trong v&ograve;ng 6 th&aacute;ng sau khi trẻ mọc chiếc răng đầu ti&ecirc;n hoặc trước ng&agrave;y sinh nhật 1 tuổi. Nếu bạn chưa đưa con&nbsp;<a class="link-in-body" href="https://www.vinmec.com/vi/tin-tuc/thong-tin-suc-khoe/suc-khoe-tong-quat/bao-lau-nen-di-kham-rang-mot-lan/"><strong class="link-in-body">đi kh&aacute;m răng</strong></a>, h&atilde;y sắp xếp thời gian tiến h&agrave;nh c&agrave;ng sớm c&agrave;ng tốt. Sau đ&oacute; l&agrave;m theo hướng dẫn của nha sĩ v&agrave; t&aacute;i kh&aacute;m đ&uacute;ng lịch hẹn.</p>
<p>Trẻ cần cung cấp đủ lượng kẽm nguy&ecirc;n tố/ng&agrave;y để trẻ ăn ngon, đạt chiều cao v&agrave; c&acirc;n nặng đ&uacute;ng chuẩn v&agrave; vượt chuẩn. Kẽm đ&oacute;ng vai tr&ograve; t&aacute;c động đến hầu hết c&aacute;c qu&aacute; tr&igrave;nh sinh học diễn ra trong cơ thể, đặc biệt l&agrave; qu&aacute; tr&igrave;nh ph&acirc;n giải tổng hợp axit nucleic, protein... C&aacute;c cơ quan trong cơ thể khi thiếu kẽm c&oacute; thể dẫn đến một số bệnh l&yacute; như rối loạn thần kinh, dễ sinh c&aacute;u gắt,... V&igrave; vậy cha mẹ cần t&igrave;m hiểu về&nbsp;<a class="link-in-body" href="https://www.vinmec.com/tin-tuc/thong-tin-suc-khoe/vai-tro-cua-kem-huong-dan-bo-sung-kem-hop-ly/"><strong class="link-in-body">Vai tr&ograve; của kẽm v&agrave; hướng dẫn bổ sung kẽm hợp l&yacute; cho b&eacute;</strong></a>.</p>
<p>Ngo&agrave;i kẽm, cha mẹ cũng cần bổ sung cho trẻ c&aacute;c vitamin v&agrave; kho&aacute;ng chất quan trọng kh&aacute;c như lysine, crom, vitamin nh&oacute;m B,... gi&uacute;p con ăn ngon, c&oacute; hệ miễn dịch tốt, tăng cường đề kh&aacute;ng để &iacute;t ốm vặt.</p>
<p>H&atilde;y thường xuy&ecirc;n truy cập website&nbsp;<a class="link-in-body" href="http://www.vinmec.com/"><strong class="link-in-body">Vinmec.com</strong></a>&nbsp;v&agrave; cập nhật những th&ocirc;ng tin hữu &iacute;ch để chăm s&oacute;c cho b&eacute; v&agrave; cả gia đ&igrave;nh nh&eacute;.</p>
</div>
<div class="rich-text">
<p>&nbsp;</p>
<p><strong>Nguồn tham khảo: babycenter.com</strong></p>
</div>', CAST(N'2022-10-05T11:23:31.693' AS DateTime), N'20201017_191917_128671_kinh-nghiem-hay-cua.max-1800x1800.jpg')
INSERT [dbo].[Post] ([post_id], [title], [description], [cate_id], [detail], [created_at], [image]) VALUES (20, N'Con nhà người ta, bạn có thế?', NULL, 4, N'<p>Kh&ocirc;ng c&oacute; g&igrave; đ&acirc;u, đ&ugrave;a th&ocirc;i</p>', CAST(N'2022-10-05T11:34:22.297' AS DateTime), N'word_image_1623395176032.jpg')
INSERT [dbo].[Post] ([post_id], [title], [description], [cate_id], [detail], [created_at], [image]) VALUES (23, N'Bài viết về trẻ em', N'123456', 4, N'                                                                                                                        <p>123456</p>
                                    
                                    
                                    ', CAST(N'2022-10-06T08:08:47.923' AS DateTime), N'')
INSERT [dbo].[Post] ([post_id], [title], [description], [cate_id], [detail], [created_at], [image]) VALUES (24, N'Chăm sóc răng cho trẻ trong độ tuổi thay răng', N'SKĐS - Răng có vai trò quan trọng không chỉ vì thẩm mỹ, mà còn là chức năng ăn nhai để cung cấp năng lượng cho sự phát triển của trẻ. Vì vậy, cha mẹ cần chăm sóc răng đúng cách cho trẻ ngay từ khi còn là răng sữa.', 1, N'<p><div class="sc-af20435e-1 kPNRmG article-mobile-ad" style=" font-size: 16px; -webkit-font-smoothing: antialiased; text-rendering: optimizelegibility; text-size-adjust: none; vertical-align: baseline; display: flex; -webkit-box-pack: center; justify-content: center; font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Oxygen, Ubuntu, Cantarell, &quot;Helvetica Neue&quot;, sans-serif"></div></p>
<h2 class="detail-sapo" data-role="sapo" style=" margin: 0px 0px 20px; font-family: Arial; font-weight: bold; font-size: 17px; line-height: 23.8px; color: rgb(68, 68, 68); background-color: rgb(255, 255, 255)">SKĐS - Răng có vai trò quan trọng không chỉ vì thẩm mỹ, mà còn là chức năng ăn nhai để cung cấp năng lượng cho sự phát triển của trẻ. Vì vậy, cha mẹ cần chăm sóc răng đúng cách cho trẻ ngay từ khi còn là răng sữa.</h2>
<zone id="krlutq8c" style=" color: rgb(81, 81, 81); font-family: Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255)"></zone>
<div itemprop="articleBody" style=" color: rgb(81, 81, 81); font-family: Arial, Helvetica, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255)"><div class="detail-content afcbc-body" data-role="content" style=" font-family: Arial; font-weight: normal; font-size: 17px; line-height: 23.8px; color: rgb(51, 51, 51)"><div type="RelatedOneNews" class="VCSortableInPreviewMode" style=" margin: 10px 0px; z-index: 96; display: inline-block; flex-direction: column; position: relative; transition: all 0.3s ease-in-out 0s; width: 670px; visibility: visible; overflow-wrap: break-word; cursor: default; clear: both; background: none 0px 0px repeat scroll rgb(247, 247, 247); border: 1px solid rgb(221, 221, 221)"><a href="https://suckhoedoisong.vn/luu-y-khi-cham-soc-rang-tre-em-16991336.htm" style=" text-decoration: none; color: -webkit-link"><img src="https://suckhoedoisong.qltns.mediacdn.vn/Images/_OLD/2015/chai-rang-8405-1422631956-1422698572146.jpg" data-cke-saved-src="https://suckhoedoisong.qltns.mediacdn.vn/Images/_OLD/2015/chai-rang-8405-1422631956-1422698572146.jpg" alt="Lưu ý khi chăm sóc răng trẻ em" style=" margin: 0px 10px 0px 0px; width: 150px; max-width: 100%; display: block; height: 120px; outline: none medium; float: left" /></a><a href="https://suckhoedoisong.vn/luu-y-khi-cham-soc-rang-tre-em-16991336.htm" class="OneNewsTitle" style=" margin: 7px 0px; text-decoration: none; color: rgb(0, 66, 118); font-size: 15px; font-weight: bold; text-align: left">Lưu ý khi chăm sóc răng trẻ em</a><p class="VCObjectBoxRelatedNewsItemSapo" style=" margin: 0px 10px 0px 0px; font: 12px / 16.8px Arial; color: rgb(119, 119, 119); display: block">Nên cho trẻ chải răng từ lúc nào? Có nên cho trẻ sử dụng chung kem đánh răng với người lớn không? Làm sao để trẻ có bộ răng khỏe mạnh?</p></div><h2 style=" margin: 13.4px 0px; line-height: 1.2; font-size: 17px; text-align: justify"><b>Khi trẻ mọc răng sữa</b></h2><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify"><a class="link-inline-content" href="https://suckhoedoisong.vn/sau-rang-o-tre-em-nhan-biet-nguyen-nhan-va-dieu-tri-169211130203258607.htm" title="Răng sữa" data-rel="follow" style=" text-decoration: none; color: -webkit-link; background-color: rgb(255, 255, 255)">Răng sữa</a><span>&nbsp;</span>có vai trò quan trọng trong nhai nghiền thức ăn, thẩm mỹ và định hướng cho răng vĩnh viễn. Thời gian mọc răng sữa của trẻ diễn ra ở khoảng:</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">+ Khi trẻ từ 6 - 7 tháng tuổi bé mọc 4 răng cửa hàm dưới.</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">+ Khi trẻ từ 8 - 9 tháng tuổi bé mọc 4 răng cửa hàm trên.</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">+ Khi trẻ từ 3 đến 4 tuổi các bé sẽ mọc khoảng 20 răng sữa, răng sữa sẽ bắt đầu từ răng số 1 đến răng số 5. Từ răng số 6 sẽ tính là răng vĩnh viễn và chỉ mọc một lần.</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify"><a class="link-inline-content" href="https://suckhoedoisong.vn/hieu-ve-qua-trinh-thay-rang-cua-be-16998562.htm" title="Thay răng" data-rel="follow" style=" text-decoration: none; color: -webkit-link">Thay răng</a><b><span>&nbsp;</span>sữa ở trẻ khi nào?</b></p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">Độ tuổi thay răng vĩnh viễn có thể chia như sau:</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">+ Khi bé 6 đến 8 tuổi sẽ thay 4 răng cửa dưới.</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">+ Khi bé 7 đến 9 tuổi sẽ thay 4 răng cửa trên.</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">Tuy nhiên, tuổi thay răng của các trẻ không hoàn toàn giống nhau, có trẻ có thể bắt đầu thay răng khi 4 tuổi, cũng có thể khoảng 7- 8 tuổi. Có một lưu ý nếu trẻ thay răng quá sớm thì cha mẹ cần đưa trẻ đến thăm khám nha sĩ.</p><figure class="VCSortableInPreviewMode" type="Photo" style=" margin: 0px auto 15px; z-index: 96; display: inline-block; flex-direction: column; position: relative; transition: all 0.3s ease-in-out 0s; width: 670px; visibility: visible; overflow-wrap: break-word; cursor: default; clear: both"><div><a href="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/10/2/co-nen-nho-rang-sua-cho-be-tai-nha-nhung-luu-y-khi-nho-rang-tai-nha-202207041621584732-16647025591051455898123.jpg" data-fancybox="img-lightbox" title="Răng sữa có vai trò quan trọng trong nhai nghiền thức ăn, thẩm mỹ và định hướng cho răng vĩnh viễn." target="_blank" class="detail-img-lightbox" style=" text-decoration: none; color: -webkit-link; cursor: zoom-in; display: block; outline: none !important"><img src="https://suckhoedoisong.qltns.mediacdn.vn/thumb_w/640/324455921873985536/2022/10/2/co-nen-nho-rang-sua-cho-be-tai-nha-nhung-luu-y-khi-nho-rang-tai-nha-202207041621584732-16647025591051455898123.jpg" id="img_500961634880827392" w="760" h="442" alt="Chăm sóc răng cho trẻ ở độ tuổi thay răng - Ảnh 2." title="Chăm sóc răng cho trẻ ở độ tuổi thay răng - Ảnh 2." rel="lightbox" photoid="500961634880827392" data-original="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/10/2/co-nen-nho-rang-sua-cho-be-tai-nha-nhung-luu-y-khi-nho-rang-tai-nha-202207041621584732-16647025591051455898123.jpg" type="photo" class="lightbox-content" style=" margin: 0px auto; width: 670px; max-width: 100%; display: inline-block; height: auto; vertical-align: top" /></a></div><figcaption class="PhotoCMS_Caption" style=" margin: 0px 0px 24px; padding: 5px 8px; background: rgb(233, 233, 233)"><p data-placeholder="Nhập chú thích ảnh" style=" font-style: italic; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 14px !important; line-height: 19.6px; font-family: Arial">Răng sữa có vai trò quan trọng trong nhai nghiền thức ăn, thẩm mỹ và định hướng cho răng vĩnh viễn.</p></figcaption></figure><h2 style=" margin: 13.4px 0px; line-height: 1.2; font-size: 17px; text-align: justify"><b>Thay răng sữa có cần đến nha sĩ</b><b>?</b></h2><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">Câu hỏi đặt ra cho tất cả bà mẹ rằng nếu răng sữa thay có cần đến nha sĩ? Trên thực tế hiện nay, nhiều cha mẹ quan tâm con cái hơn nên thường đưa trẻ đến cơ sở y tế, phòng khám nha khoa để được hỗ trợ. Tuy nhiên, cũng có nhiều cha mẹ thường tự<a class="link-inline-content" href="https://suckhoedoisong.vn/vi-sao-khong-nen-tu-nho-rang-sua-cho-tre-169129743.htm" title=" nhổ răng " data-rel="follow" style=" text-decoration: none; color: -webkit-link"><span>&nbsp;</span>nhổ răng<span>&nbsp;</span></a>sữa tại nhà cho trẻ. Việc tự nhổ răng sữa ở nhà bằng tay hay bằng chỉ có thể khiến trẻ bị chảy máu chân răng, gây ra vết thương hở.</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">Hơn nữa khi nhổ răng bằng tay hoặc chỉ không được vô trùng, có thể gây nhiễm trùng vùng nhổ răng. Vì vậy, tuyệt đối không nên tự nhổ răng tại nhà cho trẻ. Trường hợp răng vĩnh viễn đã mọc lên nhưng răng sữa chưa lung lay, bác sĩ cần can thiệp chủ động nhổ răng để lấy chỗ cho răng vĩnh viễn mọc lên. Trường hợp răng lệch lạc nhiều, gây mất khoảng để các răng sau mọc lên, bác sĩ có thể can thiệp chỉnh nha sớm cho trẻ. Cha mẹ cần nắm được độ tuổi thay răng của trẻ để giúp trẻ có quá trình mọc và thay răng tốt.</p><zone id="krlv706p"></zone><div class="VCSortableInPreviewMode alignRight" type="RelatedNewsBox" data-style="align-right" relatednewsboxtype="type-2" style=" margin: 0px auto 15px 15px; z-index: 95; display: inline-block; flex-direction: column; position: relative; transition: all 0.3s ease-in-out 0s; width: 301.5px; visibility: visible; overflow-wrap: break-word; cursor: default; clear: both; float: right"><div class="kbwscwl-relatedbox type-2 suckhoedoisong" style=" float: right; display: block; border-top: 3px solid rgb(250, 94, 0); border-bottom: 3px solid rgb(250, 94, 0); width: 301.5px"><ul class="kbwscwlr-list" style=" list-style: none; text-align: left"><li class="kbwscwlrl" data-date="26/03/2018 07:12" data-id="169142551" data-avatar="https://suckhoedoisong.qltns.mediacdn.vn/Images/duylinh/2018/03/26/de-rang-tre-chac-khoe-phai-cham-soc-ngay-tu-nho1521999247.JPG" data-url="/de-rang-tre-chac-khoe-phai-cham-soc-ngay-tu-nho-169142551.htm" data-title="Để răng trẻ chắc khỏe phải chăm sóc ngay từ nhỏ" style=" margin: 0px 0px 0px 15px; padding: 20px 0px; display: list-item; list-style-type: disc !important; color: rgb(250, 94, 0); border-bottom: 1px solid rgb(226, 226, 226)"><h4 class="kbwscwlrl-title" style=" line-height: 1.2; font-size: 17px"><a target="_blank" href="https://suckhoedoisong.vn/de-rang-tre-chac-khoe-phai-cham-soc-ngay-tu-nho-169142551.htm" class="title link-callout" style=" margin: 0px 0px 5px; text-decoration: none; color: rgb(51, 51, 51); font-size: 16px; display: block; line-height: 19px">Để răng trẻ chắc khỏe phải chăm sóc ngay từ nhỏ</a></h4></li><li class="kbwscwlrl" data-date="07/06/2016 18:44" data-id="169117722" data-avatar="https://suckhoedoisong.qltns.mediacdn.vn/Images/duylinh/2016/06/07/rang-tre-bi-o-vang1465292736.jpg" data-url="/cach-khac-phuc-rang-tre-bi-o-vang-169117722.htm" data-title="Cách khắc phục răng trẻ bị ố vàng" style=" margin: 0px 0px 0px 15px; padding: 20px 0px; display: list-item; list-style-type: disc !important; color: rgb(250, 94, 0); border-bottom: 1px solid rgb(226, 226, 226)"><h4 class="kbwscwlrl-title" style=" line-height: 1.2; font-size: 17px"><a target="_blank" href="https://suckhoedoisong.vn/cach-khac-phuc-rang-tre-bi-o-vang-169117722.htm" class="title link-callout" style=" margin: 0px 0px 5px; text-decoration: none; color: rgb(51, 51, 51); font-size: 16px; display: block; line-height: 19px">Cách khắc phục răng trẻ bị ố vàng</a></h4></li></ul></div></div><h2 style=" margin: 13.4px 0px; line-height: 1.2; font-size: 17px; text-align: justify"><b>Cần chăm sóc răng cho trẻ đúng cách</b></h2><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">Răng có vài trò quan trọng không chỉ vì thẩm mỹ mà còn là chức năng ăn nhai, cung cấp năng lượng cho sự phát triển của trẻ. Vì vậy, cha mẹ cần<a class="link-inline-content" href="https://suckhoedoisong.vn/8-sai-lam-nghiem-trong-can-tranh-trong-cham-soc-rang-mieng-169220328102245663.htm" title=" chăm sóc răng" data-rel="follow" style=" text-decoration: none; color: -webkit-link"><span>&nbsp;</span>chăm sóc răng</a><span>&nbsp;</span>đúng cách cho trẻ ngay từ khi còn là răng sữa cụ thể.</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">Đối với trẻ nhỏ dưới 3 tuổi, có thể dùng bàn chải và nước sạch để chải răng cho trẻ, chưa cần dùng đến kem đánh răng, vì trẻ chưa có ý thức sẽ nuốt phải kem đánh răng.</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">Đối với trẻ trên 3 tuổi bắt đầu quen với việc chải răng, có thể cho trẻ chải răng với kem đánh răng dành riêng cho trẻ em với lượng kem ít để tránh nuốt phải. Hướng dẫn trẻ chải răng đúng cách và đủ sau mỗi bữa ăn hoặc ít nhất 2 lần mỗi ngày.</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">Chải đủ các vị trí trên răng, mặt nhai, mặt bên bằng kem đánh răng, chải theo chiều dọc từ trên xuống hoặc xoay tròn.</p><figure class="VCSortableInPreviewMode" type="Photo" style=" margin: 0px auto 15px; z-index: 96; display: inline-block; flex-direction: column; position: relative; transition: all 0.3s ease-in-out 0s; width: 670px; visibility: visible; overflow-wrap: break-word; cursor: default; clear: both"><div><a href="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/10/2/99-1024x684-1664702559067907285411.jpg" data-fancybox="img-lightbox" title="Hướng dẫn trẻ chải răng đúng cách và đủ sau mỗi bữa ăn hoặc ít nhất 2 lần mỗi ngày." target="_blank" class="detail-img-lightbox" style=" text-decoration: none; color: -webkit-link; cursor: zoom-in; display: block; outline: none !important"><img src="https://suckhoedoisong.qltns.mediacdn.vn/thumb_w/640/324455921873985536/2022/10/2/99-1024x684-1664702559067907285411.jpg" id="img_500961639081652224" w="1024" h="684" alt="Chăm sóc răng cho trẻ ở độ tuổi thay răng - Ảnh 4." title="Chăm sóc răng cho trẻ ở độ tuổi thay răng - Ảnh 4." rel="lightbox" photoid="500961639081652224" data-original="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/10/2/99-1024x684-1664702559067907285411.jpg" type="photo" class="lightbox-content" style=" margin: 0px auto; width: 670px; max-width: 100%; display: inline-block; height: auto; vertical-align: top" /></a></div><figcaption class="PhotoCMS_Caption" style=" margin: 0px 0px 24px; padding: 5px 8px; background: rgb(233, 233, 233)"><p data-placeholder="Nhập chú thích ảnh" style=" font-style: italic; font-variant: normal; font-weight: normal; font-stretch: normal; font-size: 14px !important; line-height: 19.6px; font-family: Arial">Hướng dẫn trẻ chải răng đúng cách và đủ sau mỗi bữa ăn hoặc ít nhất 2 lần mỗi ngày.</p></figcaption></figure><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">Đưa trẻ đến nha sĩ thăm khám định kì, khoảng 4 đến 6 tháng một lần để kiểm tra<a class="link-inline-content" href="https://suckhoedoisong.vn/sau-rang-o-tre-em-nhan-biet-nguyen-nhan-va-dieu-tri-169211130203258607.htm" title=" sâu răng" data-rel="follow" style=" text-decoration: none; color: -webkit-link"><span>&nbsp;</span>sâu răng</a>,<span>&nbsp;</span><a class="link-inline-content" href="https://suckhoedoisong.vn/cach-phong-ngua-cac-benh-rang-mieng-16998460.htm" title="vệ sinh răng miệng " data-rel="follow" style=" text-decoration: none; color: -webkit-link">vệ sinh răng miệng<span>&nbsp;</span></a>cho trẻ. Luôn theo dõi lộ trình thay răng của trẻ, hạn chế ăn những đồ nhiều đường, đặc biệt trước khi đi ngủ để hạn chế sâu răng. Quá trình thay răng có thể khiến trẻ bị đau, cha mẹ cần cho trẻ ăn những đồ ăn mềm, bổ sung đầy đủ<span>&nbsp;</span><a class="link-inline-content" href="https://suckhoedoisong.vn/dinh-duong-khoa-hoc-giup-tang-cuong-he-mien-dich-169188525.htm" title="dinh dưỡng" data-rel="follow" style=" text-decoration: none; color: -webkit-link">dinh dưỡng</a><span>&nbsp;</span>cho trẻ.</p><p style=" margin: 13.4px 0px; font: 17px / 23.8px Arial; word-break: break-word; text-align: justify">Một lưu ý, trong giai đoạn này trẻ có thể hình thành các thói quen xấu như mút ngón tay, cắn móng tay, cắn bút, chống cằm, đẩy lưỡi,<span>&nbsp;</span><a class="link-inline-content" href="https://suckhoedoisong.vn/tat-nghien-rang-chua-the-nao-169119734.htm" title="nghiến răng" data-rel="follow" style=" text-decoration: none; color: -webkit-link">nghiến răng</a>, thở miệng… những thói quen này có thể khiến răng trẻ bị thưa, móm, lệch mặt, chen chúc… Cha mẹ cần theo dõi để nhắc nhở trẻ bỏ những thói quen này. Giai đoạn thay răng ở trẻ là giai đoạn rất quan trọng, ảnh hưởng đến thẩm mỹ và chức năng của hàm răng sau này. Vì vậy, cha mẹ nên hỗ trợ, theo dõi chăm sóc răng miệng cho trẻ thật tốt, giúp trẻ có một hàm răng chắc khỏe.</p></div></div>', CAST(N'2022-10-06T12:12:27.933' AS DateTime), N'nho-rang-sua-cho-tre-2-16647025591201655045421-0-0-500-800-crop-1664702633440558848834.jpg')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [DF_Post_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_PostCategory] FOREIGN KEY([cate_id])
REFERENCES [dbo].[PostCategory] ([cate_id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_PostCategory]
GO
