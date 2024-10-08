CREATE TABLE IngredientInteraction(
	InteractionID VARCHAR2(30) NOT NULL PRIMARY KEY,
	InteractionIngredient1 VARCHAR2(50),
	InteractionIngredient2 VARCHAR2(50),
	InteractionDetail VARCHAR2(500),
	InteractionDosage VARCHAR2(500)
);