SELECT * FROM dbo.Product
WHERE proName like 'Điện thoại Ciptin'
EXEC SearchProduct 'Xe đạp', 'Cao su Đà Nẵng', 56
--TIM KIEM MAT HANG
GO
alter PROC SearchProduct 
(
	@product NVARCHAR(50) = NULL,
	@brand NVARCHAR(30) = NULL,
	@category NVARCHAR(30) = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @SQL			NVARCHAR(MAX) 
	DECLARE @ParameterDef	NVARCHAR(500)

	SELECT Product.proName, proOrigin, proMarketPrice, proBrand, Category.catName
				FROM Product JOIN Category
								ON Product.proCategory = Category.catID
				WHERE Product.proIsDeleted = '0'
				AND (@product IS NULL OR proName like CONCAT('%',@product,'%'))
				AND (@brand IS NULL OR proBrand like CONCAT('%' , @brand , '%'))
				AND (@category IS NULL OR Category.catName like CONCAT('%', @category,'%'))

END

--exec SearchProduct 'Xe máy','','Xe máy'

-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
--DANG SAN PHAM
GO
CREATE PROC PostProduct 
(
	@productID INT,
	@proName NVARCHAR(50),
	@proOrigin NVARCHAR(30),
	@proMarketPrice INT,
	@proDescription NVARCHAR(500),
	@proIsDeleted CHAR(1),
	@proImageCover VARCHAR(100),
	@proListImage VARCHAR(500), 
	@proBrand NVARCHAR(30),
	@proCategory INT,
	@proShop INT,
	@pro_name_shop NVARCHAR(50)
)
AS
BEGIN
	INSERT INTO Product values (	@productID,
									@proName,
									@proOrigin,
									@proMarketPrice,
									@proDescription,
									@proIsDeleted,
									@proImageCover,
									@proListImage, 
									@proBrand,
									@proCategory,
									@proShop,
									@pro_name_shop)
END


-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
--Lay gio hang
GO
CREATE PROC GetCart 
(
	@cusID INT
)
AS
BEGIN
	SELECT Product_Variant.varName, CartDetail.numProduct, Product_Variant.varPrice
	FROM CartDetail JOIN Product_Variant 
					ON CartDetail.variantSKU_In_Cart = Product_Variant.varSKU
	WHERE CartDetail.cart_cusID = @cusID
END
exec GetCart 12
--cap nhat so luong
GO
CREATE PROC updateNPinCart 
(
	@cusID INT,
	@product INT,
	@variant VARCHAR(12),
	@amount INT
)
AS
BEGIN
	UPDATE CartDetail
	SET numProduct = @amount
	WHERE CartDetail.cart_cusID = @cusID AND productInCart = @product AND variantSKU_In_Cart LIKE @variant;
END
--SELECT * FROM dbo.CartDetail
EXEC dbo.updateNPinCart @cusID = 1,    -- int
                      @product = 349,  -- int
                       @variant = '0002NJNY', -- varchar(12)
                    @amount = 5    -- int

--tinh tien gio hang
GO
CREATE PROC calcCostInCart 
(
	@cusID INT,
	@total INT output
)
AS
BEGIN
	SELECT SUM(CartDetail.numProduct * Product_Variant.varPrice)
	FROM CartDetail JOIN Product_Variant 
					ON CartDetail.variantSKU_In_Cart = Product_Variant.varSKU
	WHERE CartDetail.cart_cusID = @cusID
END

GO

CREATE PROC calcTotalPriceProductDiscount
(
	@productID INT,
	@productSKU VARCHAR(12),
	@numProduct INT,
	@currentPrice INT,
	@couponUsed INT,
	@customer INT
)
AS
DECLARE @sum INT = 0,
@maxDiscount INT = 0,
@discountPercent DECIMAL(3,2),
@discountValue INT = 0
BEGIN
    SET @sum = @currentPrice * @numProduct;

	IF NOT EXISTS (SELECT * FROM dbo.Coupon_Of_Customer c
	WHERE c.coupon_customer_has = @couponUsed AND c.customerID = @customer
	AND c.isDelete = '0') -- ma khong hop le
	BEGIN
	    RETURN @sum;
	END

	-- Lấy các thuộc tính cần
	SELECT @discountValue = c.discountValue, 
	@discountPercent = ISNULL(c.discountPercent,0),
	@maxDiscount = c.maxDiscount
	FROM dbo.Coupon c
	WHERE c.couponID = @couponUsed AND c.couDateStartUsed <= GETDATE()
	AND c.couDateExpired >= GETDATE();

	IF(@discountPercent > 0)-- neu giam theo ti le
	BEGIN
	    IF (@discountPercent * @sum > @maxDiscount ) RETURN @sum - @maxDiscount;
		
		RETURN @sum*(1-@discountPercent);
	END

	--Giảm theo giá tiền
	RETURN @sum - @discountValue;
END
go
CREATE PROC calcTotalOrder_BeforeDiscount 
(
	@orderCode CHAR(12)
)
AS
DECLARE @sum INT = 0
BEGIN
    SELECT  @sum = SUM(o.totalPriceBeforDiscount) 
	FROM dbo.OrderDetail o 
	WHERE o._order_code =@orderCode 
	GROUP BY o._order_code

	RETURN ISNULL(@sum, 0)
END
GO

CREATE PROC calcTotalOrder_AfterDiscount 
(
	@orderCode CHAR(12)
)
AS
DECLARE @sum INT = 0
BEGIN
    SELECT  @sum = SUM(o.totalPriceAfterDiscount) 
	FROM dbo.OrderDetail o 
	WHERE o._order_code =@orderCode 
	GROUP BY o._order_code

	RETURN ISNULL(@sum, 0)
END
go