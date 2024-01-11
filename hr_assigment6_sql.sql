use hr_db;
-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES.
select last_name,hire_date from employees where department_id = (select department_id from departments where department_name = "Sales");

-- 2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary.
select employee_id, last_name, salary from employees 
where salary > (select avg(salary) from employees)
order by salary asc;

-- 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u
select employee_id, last_name,department_name from employees join departments on employees.department_id  = departments.department_id where last_name like "%a";

-- 4. Display the last name, department number, and job ID of all employees whose department location is ATLANTA.
select e.last_name, d.department_id, e.job_id,l.city from employees e left join departments d on e.department_id  = d.department_id 
left join locations l on d.location_id =l.location_id where city = "Toronto";

-- 5. Display the last name and salary of every employee who reports to FILLMORE.

-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department.
select d.department_id, e.last_name, e.job_id, d.department_name from employees e left join departments d on e.department_id = d.department_id where department_name = "Operations";

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any
-- employee with a 'u'in their name.
select employee_id as "Employee Number", last_name, salary from employees 
where salary > (select avg(salary) from employees) and last_name like "u%";

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept.
select concat_ws(" ",first_name,last_name)as "full name" from employees 
where department_id=(select department_id from departments where department_name = "sales");

-- 9. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 10 and 30 are given a 5% raise,
-- employees in department 20 are given a 10% raise, employees in departments 40 and 50 are given a 15% raise, and employees in department 60 are not given a raise.
select first_name, employee_id,salary,department_id,
case
when department_id in (10, 30) then salary*0.5+salary
when department_id in (20) then salary*0.10+salary
when department_id in (40,50) then salary*0.15+salary
when department_id in (60) then "no raise"
else "0"
end as "raise percentages"
from employees;

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.
select last_name, salary from employees order by salary desc limit 3;

-- 11. Display the names of all employees with their salary and commission earned. Employee with a null commission should have O in the commission column
select concat_ws(" ", first_name, last_name ) as "Employee Name", salary,
CASE
    WHEN commission_pct IS NULL THEN '0'
    ELSE commission_pct
END AS Commission
FROM employees;

-- 12. Display the Managers (name) with top three salaries along with their salaries and department information.
select E.first_name,M.first_name as "M Name", E.salary,d.department_name from employees E left join employees M on E.manager_id = M.employee_id join departments d on d.department_id = e.department_id
order by salary desc limit 3;