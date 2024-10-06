CREATE TABLE Review(
Review_No VARCHAR2(50) NOT NULL PRIMARY KEY,
    User_ID VARCHAR2(50) NOT NULL,
    Sup_ID INTEGER NOT NULL,
    Rating VARCHAR(10),
    Review_date DATE,
    Content VARCHAR(200),
    Intake_Date Date,
    Review_img VARCHAR(30)
);