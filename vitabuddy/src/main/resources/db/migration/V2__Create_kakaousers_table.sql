CREATE TABLE kakaousers (
    UserID VARCHAR2(100) NOT NULL,
    UserName VARCHAR2(20) NOT NULL,
    UserEmail VARCHAR2(80) UNIQUE NOT NULL,
    PRIMARY KEY (UserID)                   
);

