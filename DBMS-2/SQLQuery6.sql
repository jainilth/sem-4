CREATE TABLE Products (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);
-- Insert data into the Products table
INSERT INTO Products (Product_id, Product_Name, Price) VALUES
(1, 'Smartphone', 35000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);


--Part - A
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
declare 
	@Product_id int,
	@Product_Name varchar(250),
	@Price DECIMAL(10, 2)
declare Product_cursor cursor
for
	select Product_id,Product_Name,Price 
	from Products
open Product_cursor
fetch next from Product_cursor
into @Product_id,@Product_Name,@Price
while @@FETCH_STATUS=0
begin
	print cast(@Product_id as varchar)+' '+@Product_Name+' '+cast(@Price as varchar)
	fetch next from Product_cursor
	into @Product_id,@Product_Name,@Price
end
close Product_cursor
deallocate Product_cursor

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.
declare 
	@Product_id int,
	@Product_Name varchar(250)
declare Product_Cursor_Fetch cursor
for
	select Product_id,Product_Name
	from Products
open Product_Cursor_Fetch
fetch next from Product_Cursor_Fetch
into @Product_id,@Product_Name
while @@FETCH_STATUS=0
begin
	print cast(@Product_id as varchar)+'_'+@Product_Name
	fetch next from Product_Cursor_Fetch
	into @Product_id,@Product_Name
end
close Product_Cursor_Fetch
deallocate Product_Cursor_Fetch

--3. Create a Cursor to Find and Display Products Above Price 30,000.
declare 
	@Product_id int,
	@Product_Name varchar(250),
	@Price DECIMAL(10, 2)
declare Product_cursor_find cursor
for
	select Product_id,Product_Name,Price 
	from Products
	where Price>30000
open Product_cursor_find
fetch next from Product_cursor_find
into @Product_id,@Product_Name,@Price
while @@FETCH_STATUS=0
begin
	print cast(@Product_id as varchar)+' '+@Product_Name+' '+cast(@Price as varchar)
	fetch next from Product_cursor_find
	into @Product_id,@Product_Name,@Price
end
close Product_cursor_find
deallocate Product_cursor_find

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
declare 
	@Product_id int
declare Product_cursor_delete cursor
for
	select Product_id 
	from Products
open Product_cursor_delete
fetch next from Product_cursor_delete
into @Product_id
while @@FETCH_STATUS=0
begin
	delete from Products
	where Product_id=@Product_id
	fetch next from Product_cursor_delete
	into @Product_id
end
close Product_cursor_delete
deallocate Product_cursor_delete

--Part – B
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the price by 10%.
declare 
	@Product_id int,
	@Price DECIMAL(10, 2)
declare Product_CursorUpdate cursor
for
	select Price,Product_id
	from Products
open Product_CursorUpdate
fetch next from Product_CursorUpdate
into @Price,@Product_id
while @@FETCH_STATUS=0
begin
	update Products
	set Price=@price+@price*0.10
	where Product_id=@Product_id
	fetch next from Product_CursorUpdate
	into @Price,@Product_id
end
close Product_CursorUpdate
deallocate Product_CursorUpdate

select * from Products

DECLARE @Product_id INT,
		@Price DECIMAL(10, 2)
DECLARE Product_CursorRounds CURSOR 
FOR SELECT Product_id,Price
	FROM Products
OPEN  Product_CursorRounds
FETCH NEXT FROM  Product_CursorRounds INTO 
	@Product_id,
	@Price
WHILE @@FETCH_STATUS = 0
	BEGIN 
		Update products
		set price = round(price,4)
		where Product_id = @Product_id

		FETCH NEXT FROM  Product_CursorRounds INTO 
	@Product_id,
	@Price
	END
CLOSE  Product_CursorRounds
DEALLOCATE  Product_CursorRounds

--Part – C
 --Create a Cursor to Archive High-Price Products in a New Table (ArchivedProducts), Moves products 
--with a price above 50000 to an archive table, removing them from the original Products table
create table ArchivedProducts(
Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL)
DECLARE @Product_id INT,
		@Product_Name VARCHAR(250),
		@Price DECIMAL(10, 2)

DECLARE Product_Cursor_INSERT_NEW CURSOR 
FOR SELECT Product_id,Product_Name,Price 
	FROM Products
	WHERE Price >= 50000
OPEN  Product_Cursor_INSERT_NEW
FETCH NEXT FROM Product_Cursor_INSERT_NEW INTO 
	@Product_id,
	@Product_Name,
	@Price
WHILE @@FETCH_STATUS = 0
	BEGIN 
		INSERT INTO ArchivedProducts(Product_id,Product_Name,Price)
		VALUES
		(@Product_id,@Product_Name,@Price)
		DELETE FROM Products
		WHERE Product_id = @Product_id
		FETCH NEXT FROM Product_Cursor_INSERT_NEW INTO 
			@Product_id,
			@Product_Name,
			@Price
	END
CLOSE Product_Cursor_INSERT_NEW
DEALLOCATE Product_Cursor_INSERT_NEW

--Create a cursor to insert details of Products into the NewProducts table if the product is “Laptop” 
--(Note: Create NewProducts table first with same fields as Products table)
create table newProduct(
Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL)
declare 
	@Product_id INT,
	@Product_Name VARCHAR(250),
	@Price DECIMAL(10, 2)
declare Product_Cursorinsert cursor
for select
		Product_id , 
		Product_Name, 
		Price
	from
		Products;
	open Product_Cursorinsert;
fetch next from Product_Cursorinsert into
		@Product_id, 
		@Product_Name, 
		@Price ;
while @@FETCH_STATUS = 0
	begin
		if @Product_Name='laptop'
		insert into newProduct values (@Product_id, @Product_Name, @Price);
		fetch next from Product_Cursorinsert into
		@Product_id, 
		@Product_Name, 
		@Price
	end;
close Product_Cursorinsert;
deallocate Product_Cursorinsert;
