
------ Insert bổ sung dữ liệu 

INSERT INTO dbo.Payment
(payName,
payDescription ,
payDateUpdate ,
Name_of_bank)

VALUES
('COD', N'Thanh toán trực tiếp khi nhận hàng',Getdate(),null),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Ngân hàng Tiên Phong'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Ngân hàng Đông Á'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Ngân hàng Đông Nam Á'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Ngân hàng An Bình'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Ngân hàng Bắc Á'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Ngân hàng Bản Việt'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Hàng Hải Việt Nam'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Kỹ Thương Việt Nam'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Kiên Long'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Nam Á'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Quốc Dân'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Việt Nam Thịnh Vượng'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Phát triển nhà Thành phố Hồ Chí Minh'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Phương Đông'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Quân đội'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Đại chúng'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Quốc tế'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Sài Gòn'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Sài Gòn Công Thương'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Sài Gòn-Hà Nội'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Sài Gòn Thương Tín'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Việt Á'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Bảo Việt'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Việt Nam Thương Tín'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Xăng dầu Petrolimex'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Xuất Nhập khẩu Việt Nam'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Bưu điện Liên Việt'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Ngoại thương Việt Nam'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Công Thương Việt Nam'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Đầu tư và Phát triển Việt Nam'),
('ATM_Internet baking', N'Thanh toán qua thẻ ATM hoặc internet banking',Getdate(),N'Ngân hàng Á Châu')
GO
INSERT INTO dbo.Payment
(payName,
payDescription ,
payDateUpdate ,
Name_of_EWallet ,
costPayment )
VALUES
('electronic wallet', N'Thanh toán qua ví điện tử', getdate(),'MOMO', 0 ), 
('electronic wallet', N'Thanh toán qua ví điện tử', getdate(),'ZaloPay', 0)
GO

INSERT INTO dbo.Payment
(payName,
payDescription ,
payDateUpdate ,
Name_of_bank)
VALUES
('International card',N'Thanh toán qua thẻ quốc tế', getdate(),'BIDV'),
('International card',N'Thanh toán qua thẻ quốc tế', getdate(),'CitiBank'),
('International card',N'Thanh toán qua thẻ quốc tế', getdate(),'NAM A bank'),
('International card',N'Thanh toán qua thẻ quốc tế', getdate(),'Shinhan bank'),
('International card',N'Thanh toán qua thẻ quốc tế', getdate(),'OCB bank'),
('International card',N'Thanh toán qua thẻ quốc tế', getdate(),'TP bank')
INSERT INTO dbo.endow_of_bank
(
    paymentMethod,
    discount_value,
    discount_percent,
    max_discount_value,
    min_order_cost_InterCard,
    typeCard,
    description_InterCard
)
VALUES 
(1, 150000,NULL, 150000, 1000000 , N'Thẻ tín dụng',
N'Giảm trực tiếp 150.000đ cho đơn hàng từ 1 triệu đồng khi mua hàng tại website hoặc ứng dụng Tiki.
|Áp dụng áp dụng áp dụng cho tất cả các sản phẩm tại TIKI, ngoại trừ phiếu quà tặng, dịch vụ tiện ích (Thẻ cào điện thoại, thẻ game...), tã, bỉm, sữa, thực phẩm ăn dặm, bia, mì gói.
|Thời gian diễn ra chương trình: 9h - 23h59 thứ 6 hàng tuần từ 03/08/2020 - 29/01/2021
|Mỗi chủ thẻ được sử dụng ưu đãi 1 lần/tháng
|Chỉ áp dụng cho 50 Chủ thẻ hợp lệ đầu tiên trong ngày.
|Để nhận Ưu đãi, ở bước thanh toán, khách hàng vui lòng chọn phương thức thanh toán Thẻ tín dụng BIDV'),

(2, 1000000,NULL, 1000000, 10000000, N'Thẻ ghi nợ',
N'Giảm trực tiếp 1.000.000đ cho đơn hàng từ 10.000.000đ khi mua hàng tại website hoặc ứng dụng Tiki. Áp dụng cho Thẻ ghi nợ Citibank có 06 số đầu mã bin 559929, 529766. Để nhận được ưu đãi khách hàng thực hiện các thao tác sau:
|Bước 1: Nhập mã vào ô "Mã giảm giá".
|Bước 2: Ở bước thanh toán, khách hàng chọn phương thức thanh toán bằng Thẻ ghi nợ Citibank.
|Thời gian diễn ra chương trình: Từ 9h - 23h59 ngày 11/12/2020 - 31/01/2021.
|Mỗi chủ thẻ được nhận ưu đãi 1 lần/tuần'),

(2, 100000,NULL, 100000, 600000, N'Thẻ ghi nợ' ,
N'Giảm trực tiếp 100.000đ cho đơn hàng từ 600.000đ khi mua hàng tại website hoặc ứng dụng Tiki. Áp dụng cho Thẻ ghi nợ Citibank có 06 số đầu mã bin 559929, 529766. Để nhận được ưu đãi khách hàng thực hiện các thao tác sau:
|Bước 1: Nhập mã vào ô "Mã giảm giá".
|Bước 2: Ở bước thanh toán, khách hàng chọn phương thức thanh toán bằng Thẻ ghi nợ Citibank.
|Thời gian diễn ra chương trình: Từ 9h - 23h59 ngày 11/12/2020 - 31/01/2021.
|Mỗi chủ thẻ được nhận ưu đãi 1 lần/tuần'),

(2, 500000, NULL, 500000, 5000000 , N'Thẻ ghi nợ',
N'Giảm trực tiếp 500.000đ cho đơn hàng từ 5.000.000đ khi mua hàng tại website hoặc ứng dụng Tiki. Áp dụng cho Thẻ ghi nợ Citibank có 06 số đầu mã bin 559929, 529766. Để nhận được ưu đãi khách hàng thực hiện các thao tác sau:
|Bước 1: Nhập mã vào ô "Mã giảm giá".
|Bước 2: Ở bước thanh toán, khách hàng chọn phương thức thanh toán bằng Thẻ ghi nợ Citibank.
|Thời gian diễn ra chương trình: Từ 9h - 23h59 ngày 11/12/2020 - 31/01/2021.
|Mỗi chủ thẻ được nhận ưu đãi 1 lần/tuần'),

(2, 50000,NULL, 50000, 200000 , N'Thẻ ghi nợ',
N'Giảm trực tiếp 50.000đ cho đơn hàng từ 200.000đ khi mua hàng tại website hoặc ứng dụng Tiki. Áp dụng cho Thẻ ghi nợ Citibank có 06 số đầu mã bin 559929, 529766. Để nhận được ưu đãi khách hàng thực hiện các thao tác sau:
|Bước 1: Nhập mã vào ô "Mã giảm giá".
|Bước 2: Ở bước thanh toán, khách hàng chọn phương thức thanh toán bằng Thẻ ghi nợ Citibank.
|Thời gian diễn ra chương trình: Từ 9h - 23h59 ngày 11/12/2020 - 31/01/2021.
|Mỗi chủ thẻ được nhận ưu đãi 1 lần/tuần'),

(3, null,0.2, 200000, 500000, N'Thẻ tín dụng',
N'Giảm trực tiếp 20%, tối đa 200.000đ cho đơn hàng từ 500.000đ khi mua hàng tại website hoặc ứng dụng Tiki.
|Thời gian diễn ra chương trình: Từ 9h - 23h59 ngày 04/12/2020 - 31/12/2020
|Mỗi chủ thẻ được sử dụng ưu đãi 1 lần/ngày
|Chỉ áp dụng cho 50 Chủ thẻ hợp lệ đầu tiên trong ngày.
|Để nhận Ưu đãi, ở bước thanh toán, khách hàng vui lòng chọn phương thức thanh toán Thẻ tín dụng Nam A Bank'),

(5, null,0.25, 300000, 1000000 , N'Thẻ tín dụng',
N'Giảm trực tiếp 25%, tối đa 300.000đ cho đơn hàng từ 1.000.000đ khi mua hàng tại website hoặc ứng dụng Tiki.
|Thời gian diễn ra chương trình: Từ 9h00 - 23h59 các ngày Black Friday ( 26, 27, 28/11/2020), Noel ( 24, 25, 26/12/2020), Tet ( 1, 2, 3/1/2021)
|Mỗi chủ thẻ được sử dụng ưu đãi 1 lần/ngày.
|Chỉ áp dụng cho 63 chủ thẻ hợp lệ đầu tiên trong ngày.
|Để nhận được ưu đãi, ở bước thanh toán, khách hàng vui lòng chọn phương thức thanh toán bằng Thẻ Tín dụng OCB'),

(5, null,0.25, 300000, 1000000 ,N'Thẻ ghi nợ',
N'Giảm trực tiếp 25%, tối đa 300.000đ cho đơn hàng từ 1.000.000đ khi mua hàng tại website hoặc ứng dụng Tiki.
|Thời gian diễn ra chương trình: Từ 9h00 - 23h59 các ngày Black Friday ( 26, 27, 28/11/2020), Noel ( 24, 25, 26/12/2020), Tet ( 1, 2, 3/1/2021)
|Mỗi chủ thẻ được sử dụng ưu đãi 1 lần/ngày.
|Chỉ áp dụng cho 7 chủ thẻ hợp lệ đầu tiên trong ngày.
|Để nhận được ưu đãi, ở bước thanh toán, khách hàng vui lòng chọn phương thức thanh toán bằng Thẻ ghi nợ OCB'),

(4, 150000,NULL, 150000, 1500000 , N'Thẻ tín dụng',
N'Giảm trực tiếp 150.000đ cho đơn hàng từ 1.5 triệu đồng khi mua hàng tại website hoặc ứng dụng Tiki.
|Thời gian diễn ra chương trình: 9h - 23h59 thứ 6 hàng tuần từ 03/07/2020 đến 25/12/2020.
|Mỗi chủ thẻ được sử dụng ưu đãi 1 lần/tháng
|Chỉ áp dụng cho 66 Chủ thẻ hợp lệ đầu tiên trong ngày.
|Để nhận Ưu đãi, ở bước thanh toán, khách hàng vui lòng chọn phương thức thanh toán Thẻ tín dụng Shinhan Bank'),

(6, null,0.2, 200000, 500000 , N'Thẻ tín dụng',N'Giảm trực tiếp 20%, tối đa 120.000đ cho đơn hàng từ 500.000đ khi mua hàng tại website hoặc ứng dụng Tiki.
| Thời gian diễn ra chương trình: Từ 09h00 - 23h59 Thứ 6 hằng tuần 10/11/2020 - 31/01/2021
| Mỗi chủ thẻ được sử dụng ưu đãi 1 lần trong thời gian diễn ra chương trình.
|Chỉ áp dụng cho 100 chủ thẻ có giao dịch hợp lệ đầu tiên trong ngày.
| Để nhận được Ưu Đãi, ở bước thanh toán khách hàng vui long chọn phương thức thanh toán bằng Thẻ tín dụng TPBank')

