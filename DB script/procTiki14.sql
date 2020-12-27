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

--exec SearchProduct 'xe máy','',''

-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
--DANG SAN PHAM
GO
CREATE PROC PostProduct 
(
	@proName NVARCHAR(50),
	@proOrigin NVARCHAR(30),
	@proMarketPrice INT,
	@proDescription NVARCHAR(500),
	@proImageCover VARCHAR(100),
	@proBrand NVARCHAR(30),
	@proCategory VARCHAR(50),
	@user INT
)
AS
BEGIN

	DECLARE @sellerId INT
	SET @sellerId = (SELECT userProfile
					FROM dbo.[User]
					WHERE userID = @user)
	
	DECLARE @proShop INT
	SET @proShop = (SELECT shopID
					FROM dbo.Seller JOIN dbo.Shop
					ON selID =shopOwner
					WHERE selID = @sellerId)
	
	DECLARE @pro_name_shop VARCHAR(50)
	SET @pro_name_shop = (SELECT shopNameShop
					FROM dbo.Shop
					WHERE shopID = @proShop)

	DECLARE @categoryID INT
	SET @categoryID = (SELECT catID
					FROM dbo.Category
					WHERE catName = @proCategory)
	INSERT INTO Product values (
									@proName,
									@proOrigin,
									@proMarketPrice,
									@proDescription,
									0,
									@proImageCover,
									'', 
									@proBrand,
									@categoryID,
									@proShop,
									@pro_name_shop)
END

EXEC dbo.PostProduct @proName = N'sss',        -- nvarchar(50)
                     @proOrigin = N'ssss',      -- nvarchar(30)
                     @proMarketPrice = 0,   -- int
                     @proDescription = N'ssss', -- nvarchar(500)
                     @proImageCover = 'ssss',   -- varchar(100)
                     @proBrand = N'Viettel',       -- nvarchar(30)
                     @proCategory = '',     -- varchar(50)
                     @user = 2              -- int


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


--------------------------------------------------------------------------------

--Lay danh sach sản phẩm của shop
GO
CREATE PROC getProductOfShop 
(
	@userID INT
)
AS
BEGIN
	SELECT productID, proName, proMarketPrice, proIsDeleted
	FROM Seller JOIN Shop
					ON Seller.selID = Shop.shopOwner
					JOIN Product ON Shop.shopID = Product.proShop
	WHERE Seller.selID = @userID
END

--EXEC dbo.getProductOfShop @userID = 2 -- int

INSERT INTO dbo.Shop
(	shopID,
    shopNameShop,
    shopLogo,
    shopRegistrationStatus,
    shopBussinessLine,
    shopOwner
)
VALUES
(  
	100000,
    N'Ngdzdep', -- shopNameShop - nvarchar(50)
    '',  -- shopLogo - varchar(100)
    '',  -- shopRegistrationStatus - char(15)
    N'', -- shopBussinessLine - nvarchar(30)
    2    -- shopOwner - int
    )

--------------------------------------------------------------------------------
--Lay valirant
CREATE PROC getVariant 
(
	@product INT
)
AS
BEGIN
	SELECT varSKU,variantOfProduct
      ,varPrice
      ,[varName]
      ,[varDescription]
      ,[variant_isDelete]
	FROM Product_Variant
	WHERE Product_Variant.variantOfProduct = @product
END

EXEC dbo.getVariant @product = 413 -- int
