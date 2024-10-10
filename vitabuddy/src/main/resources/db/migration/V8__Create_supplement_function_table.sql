CREATE TABLE supplement_function (
    SupID INTEGER NOT NULL,
    FunctionID VARCHAR2(20) NOT NULL,
    CONSTRAINT FunctionID_FK FOREIGN KEY(FunctionID) REFERENCES function(FunctionID)
    
    
);