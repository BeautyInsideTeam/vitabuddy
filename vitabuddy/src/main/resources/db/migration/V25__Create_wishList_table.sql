CREATE TABLE wishList (
    UserID VARCHAR2(50) NOT NULL,  
    SupID NUMBER NOT NULL,         
    PRIMARY KEY (UserID, SupID),  
    FOREIGN KEY (UserID) REFERENCES users(UserID), 
    FOREIGN KEY (SupID) REFERENCES supplement(SupID) 
);