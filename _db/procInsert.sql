CREATE PROCEDURE procInsert (IN AppNumberId INT,
      IN First_Name VARCHAR(500),
      IN Last_Name VARCHAR(500),
      IN Full_Name_In_Native_Alphabet VARCHAR(500)
	  )

BEGIN

INSERT INTO CustPersonalInfo
(CustAppInfoId, First_Name, Last_Name, Full_Name_In_Native_Alphabet)
VALUES
(AppNumberId, First_Name, Last_Name, Full_Name_In_Native_Alphabet);

END