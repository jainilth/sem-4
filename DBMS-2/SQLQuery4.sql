--Part – A 
--1. Write a function to print "hello world". 
create or alter function Fn_helloworld()
returns varchar(50)
as
begin
	return 'hello world'
end

select dbo.Fn_helloworld()

--2. Write a function which returns addition of two numbers. 
create or alter function Fn_add_two_numbers
(@num1 int,@num2 int)
returns int
as
begin
	return @num1+@num2
end

select dbo.Fn_add_two_numbers(2,8)

--3. Write a function to check whether the given number is ODD or EVEN. 
create or alter function Fn_odd_even
(@num int)
returns varchar(100)
as
begin
	declare @ans varchar(100)
	if @num%2=0
		set @ans='even'
	else
		set @ans='odd'
	return @ans
end

select dbo.Fn_odd_even(10)

--4. Write a function which returns a table with details of a person whose first name starts with B. 
create or alter function Fn_Person()
returns table
as
	return (select * from Person where FirstName like 'b%')

select * from Fn_Person()

--5. Write a function which returns a table with unique first names from the person table. 
create or alter function Fn_Person_unique()
returns table
as
	return (select distinct * from Person)

select * from Fn_Person_unique()

--6. Write a function to print number from 1 to N. (Using while loop) 
create or alter function Fn_1ton(@num int)
returns varchar(max)
as
begin
	declare @ans varchar(max),@i int
	set @ans=''
	set @i=1
	while @i<=@num
	begin
		set @ans=@ans+cast(@i as varchar)+','
		set @i=@i+1
	end
	return @ans
end

select dbo.Fn_1ton(8)

--7. Write a function to find the factorial of a given integer. 
create or alter function Fn_factorial(@num int)
returns int
as
begin
	declare @i int,@ans int
	set @i=1
	set @ans=1
	while @i<=@num
	begin
		set @ans=@ans*@i
		set @i=@i+1
	end
	return @ans
end

select dbo.Fn_factorial(5)

--Part – B 
--PART-B
--8 Write a function to compare two integers and return the comparison result. (Using Case statement)
CREATE OR ALTER FUNCTION FN_COMPARE_TWO(@a INT,@b INT)
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN (
		CASE
			WHEN @a>@b THEN 'First is greater than second'
			WHEN @a<@b THEN 'First is less than second'
			ELSE 'Both are equal'
		END
	)
END
SELECT dbo.FN_COMPARE_TWO(4,6)

--9 Write a function to print the sum of even numbers between 1 to 20
CREATE OR ALTER FUNCTION FN_SUM_EVEN()
RETURNS INT
AS
BEGIN
	DECLARE @i INT=2,@ANS INT=0
	WHILE @i<20
	BEGIN
		SET @ANS=@ANS+@i
		SET @i=@i+2
	END
	RETURN @ANS
END
SELECT dbo.FN_SUM_EVEN()

--10 Write a function that checks if a given string is a palindrome
CREATE OR ALTER FUNCTION FN_PALINDROME(@str VARCHAR(100))
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @MSG VARCHAR(50)=''
	IF @str=REVERSE(@str)
		SET @MSG='PALINDROME'
	ELSE
		SET @MSG='NOT A PALINDROME'
	RETURN @MSG
END
SELECT dbo.FN_PALINDROME('Ayush')


--Part – C 
--11.  Write a function to check whether a given number is prime or not. 


--12.  Write a function which accepts two parameters start date & end date, and returns a difference in days. 


--13.  Write a function which accepts two parameters year & month in integer and returns total days  each year. 


--14.  Write a function which accepts departmentID as a parameter & returns a detail of the persons. 


--15.  Write a function that returns a table with details of all persons who joined after 1-1-1991.