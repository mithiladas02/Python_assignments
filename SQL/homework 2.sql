select * from data;
-- Query 1: Retrieve all employees whose address is in Elgin,IL--

select F_NAME,L_NAME
from data
where ADDRESS LIKE '%Elgin,IL%';

-- Query 2: Retrieve all employees who were born during the 1970's--
select * from data;
select F_NAME, L_NAME
FROM data
where B_DATE LIKE '197%';

-- Query 3: Retrieve all employees in department 5 whose salary is between
60000 and 70000 .--

select *
from data
where (SALARY BETWEEN 60000 and 70000) and DEP_ID=5;

-- Query 4A: Retrieve a list of employees ordered by department ID.--

select * from data
ORDER BY DEP_ID; 


-- Query 4B: Retrieve a list of employees ordered in descending order by
department ID and within each department ordered alphabetically in
descending order by last name.--

select F_NAME,L_NAME, DEP_ID
from data
ORDER BY DEP_ID DESC, L_NAME DESC;

-- Query 5A: For each department ID retrieve the number of employees in the
-- department.
select COUNT(DEP_ID) 
from data
group by DEP_ID;

-- Query 5B: For each department retrieve the number of employees in the
-- department, and the average employees salary in the department.
select COUNT(DEP_ID), AVG(SALARY)
from data
group by DEP_ID;

-- Query 5C: Label the computed columns in the result set of Query 5B as
-- “NUM_EMPLOYEES” and “AVG_SALARY”.--

select COUNT(DEP_ID) AS "NUM_EMPLOYEES",AVG(SALARY) AS "AVG SALARY"
from data
group by DEP_ID;

-- Query 5D: In Query 5C order the result set by Average Salary.

select COUNT(DEP_ID) AS "NUM_EMPLOYEES",AVG(SALARY) AS "AVG SALARY"
from data
group by DEP_ID
ORDER BY SALARY;

-- Query 5E: In Query 5D limit the result to departments with fewer than 4
-- employees.
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES",AVG(SALARY) AS "AVG SALARY"
from data
group by DEP_ID
HAVING COUNT(*) < 4
ORDER BY SALARY;

-- BONUS Query 6: Similar to 4B but instead of department ID use department
-- name. Retrieve a list of employees ordered by department name, and within
-- each department ordered alphabetically in descending order by last name.

select * from data;
select * from departments;
select D.DEP_NAME,E.F_NAME,E.L_NAME
FROM data as E,DEPARTMENST AS D
WHERE E.DEP_ID=D.DEPT_ID_DEP;



