-- 1. Write a query to display the last name, department number, department name for all employees.
select e.last_name, e.department_id as "Department number", d.department_name from employees e left join departments d on e.department_id = d.department_id;

-- 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output.

-- 3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.
select e.last_name, e.commission_pct,d.department_name,d.location_id, l.city from employees e join departments d on e.department_id = d.department_id join locations l on d.location_id = l.location_id
where commission_pct is not null;

-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name.
select last_name, department_name from employees left join departments on employees.department_id = departments.department_id where last_name like "%a";

-- 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.


-- 6. Display the employee last name and employee number along with their manager's last name and manager number.
select E.last_name as "Employee Name", E.employee_id as "Employee number" , M.last_name as "Manager Name", M.manager_id as "Manager Number"
from employees  E join  employees M on M.employee_id = E.manager_id;

-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager).
select E.last_name as "Employee Name", E.employee_id as "Employee number" , M.last_name as "Manager Name", M.manager_id as "Manager Number"
from employees  E left join  employees M on M.employee_id = E.manager_id;

-- 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee.
select e.last_name,e.department_id,department_name from employees e left join departments d on e.department_id = d.department_id;

-- 9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)
select concat_ws(" ",first_name, last_name) as Name,job_id, department_name,salary,
case
when salary >=5000 then "A"
when salary >=3000 then "B"
else "C"
end as "grade based on salary"
from employees join departments on employees.department_id = departments.department_id;

-- 10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee
-- name, emp_hire_date,manager name,man_hire_date-- --
SELECT e.first_name as "E Name", e.hire_date as "E Hire_date",m.first_name as "M Name" ,m.hire_date as "M Hire Date"
FROM employees e
INNER JOIN employees m ON e.manager_id = m.employee_id WHERE m.hire_date > e.hire_date ;

