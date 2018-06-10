--More String functions
--1. Replicate
SELECT REPLICATE ('Pragim ', 3)

--2. Space
SELECT 'Hey' + Space(10) + 'You'

--3. PATINDEX: Find the pattern of a string and return the first place
SELECT PATINDEX('%E%', 'HELLO')

SELECT	PATINDEX('%m.com', Email) AS FIRSTOCCURENCE
FROM	tblPerson

--4. REPLACE
SELECT	REPLACE(Email, '.com', '.net') AS Newemail
FROM	tblPerson

--5. STUFF
SELECT STUFF('abc@def.com', 2, 5, '**') --Delete 2 to 5 characters and add the '**'