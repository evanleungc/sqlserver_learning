--String function in SQL
--1.ASCII
Select ASCII('A')
Select ASCII('ABC') --Only return the first character

--2.CHAR: Opposite operand of ASCII
Select CHAR(65)
--**A loop to print A-Z
Declare @Start int
Set @Start = 65
While (@Start <= 90)
BEGIN
	Print CHAR(@Start)
	Set @Start = @Start + 1
End

--3. LTRIM/RTRIM
Select LTRIM('   Hello')
Select RTRIM('Hello  ')
Select LTRIM(RTRIM('  Hello  '))

--4. UPPER/LOWER
Select UPPER('hello')
Select LOWER('HELLO')

--5. REVERSE
Select REVERSE('HELLO')

--6. LEN£ºIt will not count the space in the end
Select LEN('HELLO')
Select LEN('HELLO  ')