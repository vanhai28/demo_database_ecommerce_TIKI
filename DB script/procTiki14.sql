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

	SET @ParameterDef = '@product	NVARCHAR(50),
						 @brand			NVARCHAR(30),
						 @category		NVARCHAR(30)'

	SET @SQL = 'SELECT Product.proName, proOrigin, proMarketPrice, proBrand, Category.catName
				FROM Product JOIN Category
								ON Product.proCategory = Category.catID
				WHERE Product.proIsDeleted like ''%0%'''

	IF @product IS NOT NULL AND @product <> ''
	SET @SQL = @SQL + ' AND proName like ''%'' + @product + ''%'''

	IF @brand IS NOT NULL AND @brand <> ''
	SET @SQL = @SQL + ' AND proBrand like ''%'' + @brand + ''%'''

	IF @category IS NOT NULL AND @category <> ''
	SET @SQL = @SQL + ' AND Category.catName like ''%'' + @category + ''%'''

	EXEC sp_Executesql @SQL, @ParameterDef, @product = @product, @brand = @brand, @category = @category

END

--exec SearchProduct 'Truglib','pep',''

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
--exec GetCart 12
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
--EXEC dbo.updateNPinCart @cusID = 1,    -- int
--                      @product = 349,  -- int
--                        @variant = '0002NJNY', -- varchar(12)
--                        @amount = 5    -- int

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

--DECLARE @total INT;
--EXEC dbo.calcCostInCart @cusID = 2,            -- int
--                        @total = @total OUTPUT -- int
