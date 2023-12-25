SELECT Name, COALESCE(Department_ID, 'Unassigned') AS Department_Name 
FROM Employee;

SELECT Department_ID, COUNT(Employee_ID) AS Total_Employees 
FROM Employee 
GROUP BY Department_ID;

SELECT e.Department_ID 
FROM Employee e 
INNER JOIN Salary s ON e.Employee_ID = s.Employee_ID 
GROUP BY Department_ID 
HAVING AVG(s.Salary) > 5500;

SELECT e.Name, s.Hire_Date 
FROM Employee e 
INNER JOIN Salary s ON e.Employee_ID = s.Employee_ID 
WHERE Hire_Date > '2022-03-01';

SELECT Employee_ID, Salary, Effective_Date, AVG(Salary) OVER (PARTITION BY Employee_ID) AS avg_Salary, 
Salary - AVG(Salary) OVER (PARTITION BY Employee_ID) AS Salary_Difference 
FROM Salary;