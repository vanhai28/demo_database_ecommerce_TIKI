use Ecommerce

GO

--xem tinh trang don hang
CREATE PROC GetOrderStatus
@order_ID CHAR(12)
AS
BEGIN
	SELECT orderStatus
	FROM dbo.[Order]
	WHERE order_code LIKE @order_ID
END

GO

--cap nhat tinh trang don hang
CREATE PROC UpdateOrderStatus
@order_ID CHAR(12),
@order_Status VARCHAR(30)
AS
BEGIN
	UPDATE dbo.[Order]
	SET orderStatus = @order_Status
	WHERE order_code LIKE @order_ID
END

EXEC dbo.UpdateOrderStatus @order_ID = '002KOU',    -- char(12)
                           @order_Status = 'Queueing ' -- varchar(30)

--Th�m xem status
GO 
CREATE PROC GetOrderStatus
@order_ID CHAR(12)
AS
BEGIN
	SELECT order_code, orderStatus
	FROM dbo.[Order]
	WHERE order_code = @order_ID
END


GO

--Xoa san pham trong gio hang
CREATE PROC DeleteProductInCart
@cart_cus_id INT,
@pro_id INT,
@var_sku VARCHAR(12)
AS
BEGIN 
	DELETE FROM CartDetail
	WHERE cart_cusID = @cart_cus_id AND
			productInCart = @pro_id AND
			variantSKU_In_Cart LIKE @var_sku
END

GO

--Xem san pham ban chay nhat
CREATE PROC ViewBestsellersInMonth
@month date
AS
BEGIN
	SELECT TOP(5) order_product, proName, SUM(numItemOrder) AS SLUONG
	FROM dbo.[Order]
	INNER JOIN OrderDetail ON _order_code = order_code
	INNER JOIN dbo.Product ON order_product = productID
	GROUP BY order_product, proName, numItemOrder, orderStatus, orderDateCreate
	HAVING orderStatus LIKE '%successful delivery%' AND
		   MONTH(orderDateCreate) = MONTH(@month) AND
		   YEAR(orderDateCreate) = YEAR(@month)
	ORDER BY SLUONG DESC
END
--EXEC ViewBestsellersInMonth @month = '2019-12-01'

GO
SELECT * FROM dbo.Customer
--xem doanh thu tung thang
CREATE PROC ViewProceedsInMonth
AS
BEGIN
	SELECT FORMAT(invDateCreate, 'yyyy-MM') AS  Month, SUM(invSumCost) AS Proceeds
	FROM dbo.Invoice 
	INNER JOIN dbo.[Order] ON [Order].order_invoice = Invoice.invoice_code
	GROUP BY FORMAT(invDateCreate, 'yyyy-MM'), orderStatus
	HAVING orderStatus LIKE '%successful delivery%'
	ORDER BY FORMAT(invDateCreate, 'yyyy-MM') DESC
END
--EXEC ViewProceedsInMonth
