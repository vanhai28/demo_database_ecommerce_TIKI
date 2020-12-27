-------------------------------------------------------------------------------

-------     SET UP Integrity Constraint  ---------------
--sản phẩm trong order là sản phẩm chưa được xoá
CREATE TRIGGER trig_checkProductValidInOrderDetail ON dbo.OrderDetail
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS (SELECT * FROM Inserted i JOIN dbo.Product_Variant va
		on va.varSKU = i.var_SKU
		WHERE va.variant_isDelete != '1'
		)
	BEGIN
		RAISERROR('can not order product deleted!!', 16,1);
		ROLLBACK;
		RETURN;
	END
END
go
--Khách hàng chỉ được phép đánh giá những shipper đã giao đơn hàng mà khách đó đặt
CREATE TRIGGER trig_checkValidReportShipper ON dbo.ReportShipper
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS (SELECT * FROM Inserted i JOIN dbo.[Order] ord
		on ord.order_code = i.reOrder
		WHERE i.reCustomer != ord.orderCustomer
		)
	BEGIN
		RAISERROR('Customer cannot report shipper who don''t shipping customer''s order !!', 16,1);
		ROLLBACK;
		RETURN;
	END
END
GO

--Khách hàng chỉ được phép đánh giá sản phẩm họ đã mua
CREATE TRIGGER trig_checkReviewCustomer ON dbo.Reviews 
FOR INSERT, UPDATE
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Inserted i 
				JOIN dbo.[Order] ord ON i.customerReview = ord.orderCustomer
				JOIN dbo.OrderDetail ordetail ON i.productReview = ordetail.order_product
				)
	BEGIN
		RAISERROR('Customer are not alowed to review product which they don''t buy!! ',16,1);
		ROLLBACK;
		RETURN;
	END
END
go

-- Mỗi sản phẩm chỉ được phép áp dụng tối đa 2 mã giảm giá
CREATE TRIGGER trig_checkNumberCouponUsed ON dbo.OrderDetail 
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS (SELECT * FROM dbo.OrderDetail orde JOIN Inserted i
				on i._order_code = orde._order_code 
					AND orde.order_product = i.order_product
					AND orde.var_SKU = i.var_SKU
					GROUP BY orde._order_code, orde.order_product, orde.var_SKU 
					HAVING COUNT(*) = 2
				) 
	BEGIN
		RAISERROR('Every product is allowed to used maximum of 2 coupon !! ',16,1);
		ROLLBACK;
		RETURN;
	END
END
GO

-- Khách hàng không được phép xoá địa chỉ giao hàng mặc định
CREATE TRIGGER trig_checkRemoveAddressDelivery ON dbo.AddressDelivery
FOR DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM Deleted d WHERE d.addressType = '1')
	BEGIN
	    RAISERROR('Customer is not alowed remove default address delivery ',16,1);
		ROLLBACK;
		RETURN;
	END
END



-- Tên shop và proShop phải tương ứng với shopName và ID của shop trong bảng shop
CREATE TRIGGER trig_nameShopInProductTable ON dbo.Product
FOR INSERT , UPDATE
AS
BEGIN
    IF NOT EXISTS(SELECT * FROM Inserted i JOIN dbo.Shop on i.proShop = shop.shopID
	AND i.pro_name_shop = shop.shopName)
	BEGIN
	    RAISERROR('name shop and shop ID is not match ',16,1);
		ROLLBACK;
		RETURN;
	END
END

