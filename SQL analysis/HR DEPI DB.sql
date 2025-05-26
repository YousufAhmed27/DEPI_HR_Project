CREATE TABLE EmployeeDim (
    EmployeeID VARCHAR(50) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(50),
    Age INT,
    BusinessTravel VARCHAR(50),
    DistanceFromHome INT,
    State VARCHAR(50),
    Ethnicity VARCHAR(50),
    Education INT,
    MaritalStatus VARCHAR(20),
    Salary FLOAT,
    StockOptionLevel INT,
    OverTime VARCHAR(10),
    HireDate DATE,
    Attrition VARCHAR(10),
    YearsAtCompany INT,
    YearsInMostRecentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    Department VARCHAR(50),
    JobRole VARCHAR(50)
);

-- جدول SatisfactionDim
CREATE TABLE SatisfactionDim (
    SatisfactionID VARCHAR(50) PRIMARY KEY,
    SatisfactionLevel VARCHAR(50)
);

-- جدول RatingDim
CREATE TABLE RatingDim (
    RatingID VARCHAR(50) PRIMARY KEY,
    RatingLevel VARCHAR(50)
);

-- جدول TimeDim
CREATE TABLE TimeDim (
    TimeID VARCHAR(50) PRIMARY KEY,
    Date DATE,
    Day INT,
    Month INT,
    Quarter INT,
    Year INT
);

-- جدول PerformanceRatingFact
CREATE TABLE PerformanceRatingFact (
    PerformanceID VARCHAR(50) PRIMARY KEY,
    EmployeeID VARCHAR(50) NOT NULL,
    TimeID VARCHAR(50),
    EnvironmentSatisfactionID VARCHAR(50),
    JobSatisfactionID VARCHAR(50),
    RelationshipSatisfactionID VARCHAR(50),
    WorkLifeBalanceID VARCHAR(50),
    SelfRatingID VARCHAR(50),
    TrainingOpportunitiesWithinYear INT,
    TrainingOpportunitiesTaken INT,
    FOREIGN KEY (EmployeeID) REFERENCES EmployeeDim(EmployeeID),
    FOREIGN KEY (TimeID) REFERENCES TimeDim(TimeID),
    FOREIGN KEY (EnvironmentSatisfactionID) REFERENCES SatisfactionDim(SatisfactionID),
    FOREIGN KEY (JobSatisfactionID) REFERENCES SatisfactionDim(SatisfactionID),
    FOREIGN KEY (RelationshipSatisfactionID) REFERENCES SatisfactionDim(SatisfactionID),
    FOREIGN KEY (WorkLifeBalanceID) REFERENCES SatisfactionDim(SatisfactionID),
    FOREIGN KEY (SelfRatingID) REFERENCES RatingDim(RatingID)
);

show tables;

SHOW VARIABLES LIKE 'secure_file_priv';

USE DEPI;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/employee_dim.csv'
INTO TABLE EmployeeDim
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(EmployeeID, FirstName, LastName, Gender, Age, BusinessTravel, DistanceFromHome, State, Ethnicity,
Education, MaritalStatus, Salary, StockOptionLevel, OverTime, HireDate, Attrition,
YearsAtCompany, YearsInMostRecentRole, YearsSinceLastPromotion, YearsWithCurrManager, Department, JobRole);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/satisfaction_dim.csv'
INTO TABLE SatisfactionDim
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(SatisfactionID, SatisfactionLevel);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/rating_dim.csv'
INTO TABLE RatingDim
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(RatingID, RatingLevel);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/time_dim.csv'
INTO TABLE TimeDim
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(TimeID, Date, Day, Month, Quarter, Year);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.2/Uploads/performance_rating_fact.csv'
INTO TABLE PerformanceRatingFact
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(PerformanceID, EmployeeID, TimeID, EnvironmentSatisfactionID, JobSatisfactionID, RelationshipSatisfactionID,
WorkLifeBalanceID, SelfRatingID, TrainingOpportunitiesWithinYear, TrainingOpportunitiesTaken);















