CREATE TABLE Review (
    ReviewNo VARCHAR2(50) NOT NULL PRIMARY KEY,
    ReviewTitle VARCHAR2(100),
    UserID VARCHAR2(50) NOT NULL,
    SupID INTEGER NOT NULL,
    Rating VARCHAR2(10),
    ReviewDate DATE,
    Content VARCHAR2(200),
    StartDate DATE,
    EndDate DATE,
    ReviewImg VARCHAR2(30)
);
