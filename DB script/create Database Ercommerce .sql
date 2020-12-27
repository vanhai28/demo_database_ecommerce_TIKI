
-- 
--   Nhóm CSDLNC_2020_06
--
CREATE DATABASE Ecommerce
go
use Ecommerce
go 

create table dbo.[Order](
order_code CHAR(12) ,
orderDateCreate DATETIME NOT NULL,
orderMethodPayment INT NOT NULL,
orderStatus VARCHAR(30) NOT NULL,
totalPriceOrderBeforDiscount INT CHECK (totalPriceOrderBeforDiscount >= 0),
totalPriceOrderAfterDiscount INT check(totalPriceOrderAfterDiscount >= 0),
order_note VARCHAR(50),
order_coupon_used INT ,
order_invoice CHAR(12),
orderCustomer INT ,
order_shop int , 
shippingCost INT CHECK(shippingCost >= 0), 
order_Shipper INT ,
estimate_shipping DATE NOT NULL,
CONSTRAINT PK_Order PRIMARY KEY (order_code)
)

CREATE TABLE OrderDetail (
_order_code CHAR(12),
order_product INT ,
var_SKU CHAR(12),
numItemOrder INT CHECK(numItemOrder > 0) NOT NULL,
coupon_Used INT ,
totalPriceBeforDiscount INT CHECK (totalPriceBeforDiscount >=0),
totalPriceAfterDiscount INT CHECK (totalPriceAfterDiscount >=0),
CONSTRAINT PK_OrderDetail 
PRIMARY KEY (_order_code, order_product, var_SKU,coupon_Used)
)

CREATE TABLE Invoice (
invoice_code CHAR(12),
invDateCreate DATE NOT NULL,
invSumCost INT NOT NULL CHECK(invSumCost >=0),
invDateValid DATE NOT NULL,
invCustomer INT ,
invAddressDelivery INT,
CONSTRAINT PK_Invoice PRIMARY KEY (invoice_code)
)

CREATE TABLE Payment(
paymentID INT IDENTITY(1,1),
payName VARCHAR(30) NOT NULL,
payDescription nVARCHAR(50) NOT NULL,
payDateUpdate DATETIME NOT NULL,
Name_of_bank NVARCHAR(50),
Name_of_EWallet CHAR(20) ,
costPayment INT CHECK(costPayment >=0),
CONSTRAINT PK_Payment PRIMARY KEY CLUSTERED (paymentID)
)

CREATE TABLE endow_of_bank
(	
	paymentMethod INT ,
	discount_value INT CHECK(discount_value >=0),
	discount_percent DECIMAL(3,2) CHECK(discount_percent >= 0 AND discount_percent <=1),
	max_discount_value INT CHECK(max_discount_value>=0), 
	min_order_cost_InterCard INT,
	description_InterCard NVARCHAR(2000),
	typeCard NVARCHAR(40),
	CONSTRAINT PK_international_card PRIMARY KEY (paymentMethod,typeCard,min_order_cost_InterCard  )
	)

CREATE TABLE Coupon(
couponID INT CHECK(couponID>0),
coupon_code VARCHAR(40) NOT NULL,
couDescription NVARCHAR(2000),
discountValue INT CHECK(discountValue >= 0),
maxDiscount INT CHECK(maxDiscount > 0),
discountPercent DECIMAL(3,2) CHECK(discountPercent >= 0 AND discountPercent <= 1),
couDateStartUsed DATE NOT NULL,
couDateExpired DATE NOT NULL,
couQuantity INT CHECK(couQuantity >=0),
couType CHAR(6) CHECK(couType = 'order' OR couType = 'single' OR couType = 'group'),
CONSTRAINT PK_Coupon PRIMARY KEY CLUSTERED (couponID)
) 

CREATE TABLE Coupon_Of_Customer (
coupon_customer_has INT ,
customerID INT NOT NULL ,
numCoupon SMALLINT CHECK(numCoupon >=0),
isDelete CHAR(1) CHECK(isDelete = '0' OR isDelete = '1'),
CONSTRAINT PK_Coupon_Of_customer PRIMARY KEY (coupon_customer_has, customerID)
) 

CREATE TABLE Seller(
selID INT CHECK(selID>0),
selName NVARCHAR(50), 
selEmail VARCHAR(50),
selPhoneNumber CHAR(12),
selAddress NVARCHAR(50),
CONSTRAINT PK_Seller PRIMARY KEY CLUSTERED (selID)
)

CREATE TABLE Shop (
shopID INT CHECK(shopID>0), 
shopNameShop NVARCHAR(65) UNIQUE NOT NULL, 
shopLogo VARCHAR(100),
shopRegistrationStatus CHAR(15) NOT NULL,
shopBussinessLine NVARCHAR(60) NOT NULL,
shopOwner INT,
CONSTRAINT PK_Shop PRIMARY KEY (shopID)
)

CREATE TABLE Customer (
cusID INT CHECK(cusID >0),
cusFullname NVARCHAR(50),
cusEmail VARCHAR(50), 
cusPhone CHAR(12),
cusGender CHAR(1) CHECK(cusGender = 'F' OR cusGender = 'M'),
cusDateOfBirth DATE CHECK(YEAR(GETDATE()) - YEAR(cusDateOfBirth) >= 18 ),
cusApartNumber CHAR(5), 
cusStreet NVARCHAR(50), 
cusWard  NVARCHAR(50),
cusDistrict  NVARCHAR(50),
cusCity  NVARCHAR(50),
numItemInCart INT CHECK(numItemInCart >= 0),
cusTikiXu_counter INT NOT NULL,
CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (cusID)
) 

CREATE TABLE Shipper (
shipper_ID INT CHECK (shipper_ID >0),
shipper_Fullname NVARCHAR(50) NOT NULL,
shipper_Email VARCHAR(50), 
shipper_Phone VARCHAR(12),
shipper_Gender CHAR(1) CHECK(shipper_Gender = 'F' OR shipper_Gender ='M') ,
shipper_DateOfBirth DATE CHECK(YEAR(GETDATE()) - YEAR(shipper_DateOfBirth) >= 18 ),
shipper_ApartNumber CHAR(5), 
shipper_Street NVARCHAR(50), 
shipper_Ward  NVARCHAR(50),
shipper_District  NVARCHAR(50),
shipper_City  NVARCHAR(50),
CONSTRAINT PK_Shipper PRIMARY KEY CLUSTERED (shipper_ID)
)

CREATE TABLE ReportShipper(
reShipper INT ,
reCustomer INT,
reOrder CHAR(12),
reportContent NVARCHAR(500),
reRatingForShipper CHAR(1) CHECK(reRatingForShipper >= '1' AND reRatingForShipper <= '5'),
CONSTRAINT PK_Report_Shipper PRIMARY KEY CLUSTERED (reShipper,reCustomer,reOrder)

)

CREATE TABLE AddressDelivery(
addressID INT CHECK(addressID>0),
addressCustomer INT NOT NULL,  
addressDeliver NVARCHAR(100) NOT NULL,
addressType NVARCHAR(20)  NOT NULL,
isDefaultAddress CHAR(1) CHECK (isDefaultAddress = '0' OR isDefaultAddress = '1'),
CONSTRAINT PK_AddressDelivery PRIMARY KEY CLUSTERED (addressID)
)

CREATE TABLE Product_Variant(
varSKU CHAR(12),
variantOfProduct INT,
varPrice INT,
varName NVARCHAR(100),
varDescription NVARCHAR(2000),
varImages VARCHAR(500),
variant_isDelete CHAR(1) CHECK(variant_isDelete = '0' OR variant_isDelete = '1'),
CONSTRAINT PK_Product_Variant PRIMARY KEY CLUSTERED (varSKU, variantOfProduct)
) 

CREATE TABLE Product(
productID INT IDENTITY(1,1),
proName NVARCHAR(50) NOT NULL,
proOrigin NVARCHAR(30),
proMarketPrice INT CHECK(proMarketPrice >=0) NOT NULL,
proDescription NVARCHAR(4000),
proIsDeleted CHAR(1) CHECK(proIsDeleted = '0' OR proIsDeleted = '1'),
proImageCover VARCHAR(100),
proListImage VARCHAR(500), 
proBrand NVARCHAR(30) NOT null,
proCategory INT,
proShop INT,
pro_name_shop NVARCHAR(65) ,
CONSTRAINT PK_Product PRIMARY KEY (productID)
)
 
 CREATE TABLE CouponForProduct 
 (
	coupon_code_id INT,
	product_id INT,
	CONSTRAINT PK_CouponForProduct PRIMARY KEY CLUSTERED (coupon_code_id, product_id)
 )

CREATE TABLE CartDetail(
cart_cusID INT,
productInCart INT,
variantSKU_In_Cart CHAR(12),
numProduct INT CHECK(numProduct>=0),
price_product_int_cart INT CHECK(price_product_int_cart >=0) NOT NULL,
dateAddProduct DATETIME NOT NULL,
CONSTRAINT PK_CartDetail PRIMARY KEY (cart_cusID, productInCart, variantSKU_In_Cart)
)

CREATE TABLE List_Question_Product (
customerAsk INT,
productAsk INT, 
dateTimeAsk DATETIME, 
answerContent  NVARCHAR(500),
CONSTRAINT PK_List_Question_Product PRIMARY KEY (customerAsk,productAsk, dateTimeAsk)
)

CREATE TABLE Reviews(
customerReview INT, 
productReview INT,
reContent NVARCHAR(500), 
reDateCreate DATETIME NOT NULL,
reRating CHAR(1) CHECK (reRating >= '1' AND reRating <= '5') NOT NULL ,
CONSTRAINT PK_Reviews PRIMARY KEY (customerReview, productReview)
)

CREATE TABLE Brand(
brandID INT CHECK(brandID>0),
brandName NVARCHAR(30) UNIQUE NOT NULL,
brandIsActive CHAR(1) CHECK(brandIsActive = '0' OR brandIsActive = '1') NOT NULL, 
isDocumentRequired CHAR(1) CHECK(isDocumentRequired = '0' OR isDocumentRequired = '1'),
CONSTRAINT PK_Brand PRIMARY KEY CLUSTERED (brandID)
)

CREATE TABLE Category (
catID INT CHECK(catID >0), 
catName NVARCHAR(100),
catDescription NVARCHAR(200),
catParent	INT CHECK(catParent >0), 
isPrimary CHAR(1) CHECK(isPrimary = '1' OR isPrimary = '0') NOT NULL,
CONSTRAINT PK_category PRIMARY KEY CLUSTERED (catID)
)

CREATE TABLE Customer_Request(
requestID INT CHECK (requestID > 0), 
customerEmail VARCHAR(40) NOT NULL,
request_title NVARCHAR(100) NOT NULL,
request_content NVARCHAR(500) NOT NULL,
typeProblem INT NOT NULL,
request_File VARCHAR(100),
request_order CHAR(12),
CONSTRAINT PK_Customer_Request PRIMARY KEY (requestID)
)

CREATE TABLE ProblemInCustomerRequest
(
	problemID INT CHECK(problemID>0),
	problemName NVARCHAR(200) UNIQUE NOT NULL ,
	problemParent INT,
	problem_IsPrimary CHAR(1) CHECK (problem_IsPrimary = '0' OR problem_IsPrimary = '1') NOT NULL,
	CONSTRAINT PK_ProblemInCustomerRequest PRIMARY KEY (problemID)
)

CREATE TABLE dbo.[User]
(
	userID INT CHECK(userID>0) ,
	userEmail VARCHAR(50) UNIQUE NOT NULL,
	passwordHass BINARY(64) NOT NULL,
	salt UNIQUEIDENTIFIER,
	userName VARCHAR(30),
	typeUser CHAR(1),
	userProfile INT ,
)
------------------- ADD FOREIGN KEY --------------------------
GO
-- ADD FOREIGN KEY 
ALTER TABLE dbo.endow_of_bank
ADD CONSTRAINT FK_Endow_of_bank_Payment FOREIGN KEY (paymentMethod) 
	REFERENCES dbo.Payment (paymentID)
GO

-- ADD FOREIGN KEY    ORDER --------------------------
ALTER TABLE dbo.[Order] 
ADD CONSTRAINT FK_Order_Payment FOREIGN KEY (orderMethodPayment) REFERENCES dbo.Payment(paymentID),
CONSTRAINT FK_Order_Coupon FOREIGN KEY (order_coupon_used) REFERENCES dbo.Coupon (couponID),
CONSTRAINT FK_Order_Invoice FOREIGN KEY (order_invoice) REFERENCES dbo.Invoice(invoice_code) ,
CONSTRAINT FK_Order_Customer FOREIGN KEY (orderCustomer) REFERENCES dbo.Customer (cusID),
CONSTRAINT FK_Order_Shop FOREIGN KEY (order_shop) REFERENCES  dbo.Shop (shopID),
CONSTRAINT FK_Order_Shipper FOREIGN KEY (order_Shipper) REFERENCES dbo.Shipper(shipper_ID) 
go

-- ADD FOREIGN KEY   ORDER DETAIL  --------------------------
ALTER TABLE dbo.OrderDetail
ADD CONSTRAINT FK_OrderDetail_ORDER FOREIGN KEY (_order_code) REFERENCES dbo.[Order] (order_code),
CONSTRAINT FK_OrderDetail_Product_Variant 
FOREIGN KEY (var_SKU, order_product ) REFERENCES dbo.Product_Variant (varSKU,  variantOfProduct),
CONSTRAINT FK_OrderDetail_Coupon FOREIGN KEY (coupon_Used) REFERENCES dbo.Coupon (couponID)
GO

-- ADD FOREIGN KEY   Invoice --------------------------
GO
ALTER TABLE dbo.Invoice 
ADD CONSTRAINT FK_Invoice_Customer FOREIGN KEY (invCustomer) REFERENCES dbo.Customer (cusID),
	CONSTRAINT FK_Invoice_AddressDelivery FOREIGN KEY(invAddressDelivery)
	REFERENCES dbo.AddressDelivery (addressID)
GO

-- ADD FOREIGN KEY  Coupon_Of_Customer   --------------------------
GO
ALTER TABLE Coupon_Of_Customer 
ADD CONSTRAINT FK_Coupon_Of_Customer_Customer FOREIGN KEY (customerID)
	REFERENCES dbo.Customer (cusID),
	CONSTRAINT FK_Coupon_Of_Customer_Coupon FOREIGN KEY (coupon_customer_has)
	REFERENCES dbo.Coupon (couponID)
GO

-- ADD FOREIGN KEY  AddressDelivery   --------------------------
GO
ALTER TABLE AddressDelivery
ADD CONSTRAINT FK_AddressDelivery_Customer FOREIGN KEY (addressCustomer) 
	REFERENCES dbo.Customer (cusID)
GO
-- ADD FOREIGN KEY  CartDetail   --------------------------
GO
ALTER TABLE dbo.CartDetail
ADD CONSTRAINT FK_CartDetail_Customer FOREIGN KEY (cart_cusID) REFERENCES dbo.Customer (cusID),
	CONSTRAINT FK_CartDetail_Product_Variant FOREIGN KEY ( variantSKU_In_Cart, productInCart)
		REFERENCES dbo.Product_Variant (varSKU, variantOfProduct )
GO
-- ADD FOREIGN KEY  Product_Variant   --------------------------
GO
ALTER TABLE dbo.Product_Variant
ADD CONSTRAINT FK_Product_Variant FOREIGN KEY (variantOfProduct) REFERENCES dbo.Product (productID)
GO

-- ADD FOREIGN KEY  Product    --------------------------
GO
ALTER TABLE Product 
ADD CONSTRAINT FK_Product_Brand FOREIGN KEY (proBrand) REFERENCES dbo.Brand (brandName) ,
	CONSTRAINT FK_Product_Category FOREIGN KEY (proCategory) REFERENCES dbo.Category (catID) ,
	CONSTRAINT FK_Product_Shop FOREIGN KEY (proShop) REFERENCES dbo.Shop (shopID),
	CONSTRAINT FK_Product_Shop_name FOREIGN KEY (pro_name_shop) REFERENCES dbo.Shop (shopNameShop)
GO
 

-- ADD FOREIGN KEY  List_Question_Product    --------------------------
GO
ALTER TABLE List_Question_Product 
ADD CONSTRAINT FK_List_Question_Customer FOREIGN KEY (customerAsk) REFERENCES dbo.Customer (cusID) ,
	CONSTRAINT FK_List_Question_Product FOREIGN KEY (productAsk) REFERENCES dbo.Product (productID) 
GO

-- ADD FOREIGN KEY  Reviews    --------------------------
GO
ALTER TABLE Reviews 
ADD CONSTRAINT FK_Reviews_Customer FOREIGN KEY (customerReview) REFERENCES dbo.Customer (cusID) ,
	CONSTRAINT FK_Reviews FOREIGN KEY (productReview) REFERENCES dbo.Product (productID) 
GO



-- ADD FOREIGN KEY  ReportShipper    --------------------------
GO
ALTER TABLE ReportShipper 
ADD CONSTRAINT FK_ReportShipper_Order FOREIGN KEY (reOrder) 
	REFERENCES dbo.[Order] (order_code),
	CONSTRAINT FK_ReportShipper_Shipper FOREIGN KEY (reShipper) 
	REFERENCES dbo.Shipper (shipper_ID),
	CONSTRAINT FK_ReportShipper_Customer FOREIGN KEY (reCustomer) REFERENCES dbo.Customer (cusID)
GO

-- ADD FOREIGN KEY  Category    --------------------------
GO
ALTER TABLE dbo.Category 
ADD CONSTRAINT FK_Category_category FOREIGN KEY (catParent) REFERENCES dbo.Category (catID) 
GO

-- ADD FOREIGN KEY  Customer_Request
go
ALTER TABLE Customer_Request 
ADD CONSTRAINT FK_Customer_Request_Order FOREIGN KEY (request_order) 
	REFERENCES dbo.[Order] (order_code),
	CONSTRAINT FK_Customer_Request_Problem FOREIGN KEY (typeProblem) 
		REFERENCES dbo.ProblemInCustomerRequest (problemID)

GO

-- ADD FOREIGN KEY Shop
go
ALTER TABLE dbo.Shop 
ADD CONSTRAINT FK_Shop_Seller FOREIGN KEY (shopOwner) 
	REFERENCES dbo.Seller (selID)

GO

-- ADD FOREIGN KEY CouponForProduct
go
ALTER TABLE dbo.CouponForProduct 
ADD CONSTRAINT FK_CouponForProduct_Product FOREIGN KEY (product_id) 
	REFERENCES dbo.Product (productID),
	CONSTRAINT FK_CouponForProduct_Coupon FOREIGN KEY (coupon_code_id)
		REFERENCES dbo.Coupon (couponID)

GO