CREATE TABLE ingredient_recommend (
    RecommendID1 VARCHAR2(30) NOT NULL,
    RecommendID2 VARCHAR2(30) NOT NULL,
    RecommendID3 VARCHAR2(30),
    InteractionRecommend VARCHAR2(350) NOT NULL,
    IngredientRecommendID NUMBER,
    CONSTRAINT IngredientRecommend_PK PRIMARY KEY(IngredientRecommendID)
);