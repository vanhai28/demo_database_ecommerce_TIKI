CREATE PROCEDURE dbo.uspAddUser
    @username VARCHAR(30), 
    @password NVARCHAR(50),
    @email VARCHAR(50), 
    @type CHAR(1),
    @userProfile INT,
	@responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @salt UNIQUEIDENTIFIER=NEWID()
    BEGIN TRY

        INSERT INTO dbo.[User] (userEmail, passwordHass, salt, userName, typeUser, userProfile)
        VALUES(@email, HASHBYTES('SHA2_512', @password+CAST(@salt AS NVARCHAR(36))), @salt, @username, @type, @userProfile)

       SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END

DECLARE @responseMessage NVARCHAR(250)

EXEC dbo.uspAddUser
            @username ='customer1', 
			@password ='123',
			@email ='customer1@gmail.com', 
			@type ='C',
			@userProfile = 1,
			@responseMessage=@responseMessage OUTPUT
			DECLARE @responseMessage NVARCHAR(250)
EXEC dbo.uspAddUser
            @username ='seller1', 
			@password ='123',
			@email ='seller1@gmail.com', 
			@type ='S',
			@userProfile = 2,
			@responseMessage=@responseMessage OUTPUT
EXEC dbo.uspAddUser
            @username ='admin', 
			@password ='123',
			@email ='admin@gmail.com', 
			@type ='A',
			@userProfile = 0,
			@responseMessage=@responseMessage OUTPUT
SELECT *
FROM [dbo].[User]


CREATE PROCEDURE dbo.uspLogin
    @username VARCHAR(30), 
    @password NVARCHAR(50),
    @userType INT = -1 OUTPUT
AS
BEGIN

   
    SET NOCOUNT ON

   
    SET @userID=(SELECT UserID FROM [dbo].[User] WHERE userName=@username AND passwordHass=HASHBYTES('SHA2_512', @password+CAST(Salt AS NVARCHAR(36))))
	IF(@userID IS NULL)
           SET @userID=-1
END

DECLARE	@userID INT
EXEC	dbo.uspLogin
		@username ='sel333ler1', 
		@password ='123',
		@userID = @userID OUTPUT
SELECT @userID

