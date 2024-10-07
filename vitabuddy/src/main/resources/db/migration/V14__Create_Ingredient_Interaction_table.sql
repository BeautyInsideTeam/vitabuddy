CREATE TABLE Ingredient_Interaction(
	Interaction_ID VARCHAR2(30) NOT NULL PRIMARY KEY,
	Interaction_Ingredient1 VARCHAR2(50),
	Interaction_Ingredient2 VARCHAR2(50),
	Interaction_Detail VARCHAR2(500),
	Interaction_Dosage VARCHAR2(500)
);