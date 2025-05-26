SELECT e.Department, AVG(r.RatingID) AS AverageRating
FROM EmployeeDim e
JOIN PerformanceRatingFact p 
ON e.EmployeeID = p.EmployeeID
JOIN RatingDim r 
ON p.SelfRatingID = r.RatingID
GROUP BY e.Department
ORDER BY AverageRating DESC;
-----------------------------------------------------------------------
SELECT  e.Attrition, s.SatisfactionLevel, COUNT(*) AS EmployeeCount
FROM  EmployeeDim e
JOIN  PerformanceRatingFact p 
ON e.EmployeeID = p.EmployeeID
JOIN SatisfactionDim s 
ON p.JobSatisfactionID = s.SatisfactionID
GROUP BY  e.Attrition, s.SatisfactionLevel
ORDER BY e.Attrition,s.SatisfactionLevel;
-----------------------------------------------------------------------
SELECT 
    p.TrainingOpportunitiesTaken,
    AVG(r.RatingID) AS AverageRating
FROM 
    PerformanceRatingFact p
JOIN 
    RatingDim r ON p.SelfRatingID = r.RatingID
GROUP BY 
    p.TrainingOpportunitiesTaken
ORDER BY 
    p.TrainingOpportunitiesTaken;
----------------------------------------------------
SELECT 
    e.Department,
    e.YearsAtCompany,
    AVG(CASE 
        WHEN s.SatisfactionLevel = 'Low' THEN 1
        WHEN s.SatisfactionLevel = 'Medium' THEN 2
        WHEN s.SatisfactionLevel = 'High' THEN 3
        ELSE 0
    END) AS AverageJobSatisfaction
FROM 
    EmployeeDim e
JOIN 
    PerformanceRatingFact p ON e.EmployeeID = p.EmployeeID
JOIN 
    SatisfactionDim s ON p.JobSatisfactionID = s.SatisfactionID
GROUP BY 
    e.Department,
    e.YearsAtCompany
ORDER BY 
    e.Department,
    e.YearsAtCompany;
------------------------------------------------------------
SELECT 
    e.Education,
    AVG(p.TrainingOpportunitiesTaken) AS AvgTrainingTaken,
    COUNT(DISTINCT e.EmployeeID) AS EmployeeCount
FROM 
    EmployeeDim e
JOIN 
    PerformanceRatingFact p ON e.EmployeeID = p.EmployeeID
GROUP BY 
    e.Education
ORDER BY 
    e.Education;
-------------------------------------------------------------
SELECT 
    e.State,
    COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    (COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS AttritionRate
FROM 
    EmployeeDim e
GROUP BY 
    e.State
ORDER BY 
    AttritionRate DESC;
-----------------------------------------------------------------
SELECT 
    CASE 
        WHEN e.Age < 25 THEN 'Under 25'
        WHEN e.Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN e.Age BETWEEN 35 AND 44 THEN '35-44'
        ELSE '45 and above'
    END AS AgeGroup,
    AVG(p.SelfRatingID) AS AvgSelfRating
FROM 
    EmployeeDim e
JOIN 
    PerformanceRatingFact p ON e.EmployeeID = p.EmployeeID
GROUP BY 
    AgeGroup
ORDER BY 
    AgeGroup;
---------------------------------------------------------------------
SELECT 
    e.JobRole,
    AVG(s.SatisfactionID) AS AvgWorkLifeBalance
FROM 
    EmployeeDim e
JOIN 
    PerformanceRatingFact p ON e.EmployeeID = p.EmployeeID
JOIN 
    SatisfactionDim s ON p.WorkLifeBalanceID = s.SatisfactionID
GROUP BY 
    e.JobRole
ORDER BY 
    AvgWorkLifeBalance DESC;
---------------------------------------------------------------------------
SELECT 
    CASE 
        WHEN e.DistanceFromHome <= 10 THEN '0-10 miles'
        WHEN e.DistanceFromHome <= 20 THEN '11-20 miles'
        WHEN e.DistanceFromHome <= 30 THEN '21-30 miles'
        ELSE 'Over 30 miles'
    END AS DistanceGroup,
    COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    (COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS AttritionRate
FROM 
    EmployeeDim e
GROUP BY 
    DistanceGroup
ORDER BY 
    DistanceGroup;
-------------------------------------------------------------------------------
SELECT 
    CASE 
        WHEN e.Salary < 50000 THEN 'Under 50K'
        WHEN e.Salary BETWEEN 50000 AND 100000 THEN '50K-100K'
        WHEN e.Salary BETWEEN 100001 AND 150000 THEN '100K-150K'
        ELSE 'Over 150K'
    END AS SalaryRange,
    AVG(p.SelfRatingID) AS AvgSelfRating
FROM 
    EmployeeDim e
JOIN 
    PerformanceRatingFact p ON e.EmployeeID = p.EmployeeID
GROUP BY 
    SalaryRange
ORDER BY 
    SalaryRange;
---------------------------------------------------------------------
SELECT 
    e.MaritalStatus,
    AVG(p.TrainingOpportunitiesTaken) AS AvgTrainingTaken,
    COUNT(DISTINCT e.EmployeeID) AS EmployeeCount
FROM 
    EmployeeDim e
JOIN 
    PerformanceRatingFact p ON e.EmployeeID = p.EmployeeID
GROUP BY 
    e.MaritalStatus
ORDER BY 
    AvgTrainingTaken DESC;
-----------------------------------------------------------------------
SELECT 
    e.Ethnicity,
    AVG(p.SelfRatingID) AS AvgSelfRating,
    COUNT(DISTINCT e.EmployeeID) AS EmployeeCount
FROM 
    EmployeeDim e
JOIN 
    PerformanceRatingFact p ON e.EmployeeID = p.EmployeeID
GROUP BY 
    e.Ethnicity
ORDER BY 
    AvgSelfRating DESC;
----------------------------------------------------------------
SELECT 
    CASE 
        WHEN e.YearsSinceLastPromotion = 0 THEN 'promoted this year'
        WHEN e.YearsSinceLastPromotion <= 2 THEN '1-2 years ago'
        ELSE 'more than 2 years'
    END AS PromotionGroup,
    COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(*) AS TotalEmployees,
    (COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS AttritionRate
FROM 
    EmployeeDim e
GROUP BY 
    PromotionGroup
ORDER BY 
    PromotionGroup;
-----------------------------------------------------------
SELECT 
    e.Department,
    AVG(e.Salary) AS AvgSalary,
    AVG(p.SelfRatingID) AS AvgSelfRating
FROM 
    EmployeeDim e
JOIN 
    PerformanceRatingFact p ON e.EmployeeID = p.EmployeeID
GROUP BY 
    e.Department
ORDER BY 
    AvgSalary DESC;
-----------------------------------------------------------------
SELECT 
    e.Education,
    AVG(e.Salary) AS AvgSalary,
    COUNT(*) AS EmployeeCount
FROM 
    EmployeeDim e
GROUP BY 
    e.Education
ORDER BY 
    e.Education;
---------------------------------------------------------------
WITH LatestRating AS (
    SELECT 
        p.EmployeeID,
        p.JobSatisfactionID,
        ROW_NUMBER() OVER (PARTITION BY p.EmployeeID ORDER BY t.Year DESC) AS rn
    FROM 
        PerformanceRatingFact p
    JOIN 
        TimeDim t ON p.TimeID = t.TimeID
)
SELECT 
    CASE 
        WHEN lr.JobSatisfactionID = 1 THEN 'Very Dissatisfied'
        WHEN lr.JobSatisfactionID = 2 THEN 'Dissatisfied'
        WHEN lr.JobSatisfactionID = 3 THEN 'Neutral'
        WHEN lr.JobSatisfactionID = 4 THEN 'Satisfied'
        WHEN lr.JobSatisfactionID = 5 THEN 'Very Satisfied'
    END AS SatisfactionLevel,
    COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(DISTINCT e.EmployeeID) AS TotalEmployees,
    (COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(DISTINCT e.EmployeeID)) AS AttritionRate
FROM 
    EmployeeDim e
JOIN 
    LatestRating lr ON e.EmployeeID = lr.EmployeeID
WHERE 
    lr.rn = 1
GROUP BY 
    lr.JobSatisfactionID
ORDER BY 
    lr.JobSatisfactionID;
-------------------------------------------------------------------------
SELECT 
    e.OverTime,
    COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) AS AttritionCount,
    COUNT(DISTINCT e.EmployeeID) AS TotalEmployees,
    ROUND((COUNT(CASE WHEN e.Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(DISTINCT e.EmployeeID)), 2) AS AttritionRate
FROM 
    EmployeeDim e
JOIN 
    PerformanceRatingFact p ON e.EmployeeID = p.EmployeeID
JOIN 
    TimeDim t ON p.TimeID = t.TimeID
WHERE 
    (p.EmployeeID, t.Year) IN (
        SELECT 
            p2.EmployeeID, 
            MAX(t2.Year)
        FROM 
            PerformanceRatingFact p2
        JOIN 
            TimeDim t2 ON p2.TimeID = t2.TimeID
        GROUP BY 
            p2.EmployeeID
    )
GROUP BY 
    e.OverTime
ORDER BY 
    e.OverTime;