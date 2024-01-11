/*----- 1. Display the maximum,minimum and avrage salary and commision earned. -----*/
select min(salary) as "Minimum ", max(salary) as "Maximum", avg(salary) , commission_pct from employees ;

/*----- 2. Display the department number, total salary payout and total commison payout for each department.-----*/
select department_id, sum(salary) as "Total salary", sum(commission_pct) as "Total Commission" from employees group by department_id;

/*----- 3. Display the department number and number of employees in each department. -----*/
select department_id as "Department No", count(employee_id) as "no of employees" from employees group by department_id;

/*----- 4) Display the department number and total salary of employees in each department. -----*/
select department_id as "Department No", sum(salary) as "Total Salary" from employees group by department_id;

/*----- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name -----*/
select concat(first_name, " ", last_name) as ""from employees where commission_pct IS NULL;

/*----- 6) Display the employees name, department id and commission. If an Employee doesn't
		earn the commission, then display as 'No commission'. Name the columns appropriately. -----*/
SELECT concat(first_name, " ", last_name) as "Employee Name", department_id,
CASE
    WHEN commission_pct IS NULL THEN 'No commission'
    ELSE commission_pct
END AS Commission
FROM employees;

/*----- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns
appropriately. -----*/
SELECT concat(first_name, " ", last_name) as "Employee Name", salary,
CASE
    WHEN commission_pct IS NULL THEN 'No commission'
    ELSE commission_pct *2
END AS Commission
FROM employees;

/********************----- 8) Display the employee's name, department id who have the first name same as another employee in the same department-----*/
select concat(first_name, " ", last_name) as "Employee Name", department_id from employees where first_name = department_id;

/*----- 9) Display the sum of salaries of the employees working under each Manager.-----*/
select sum(salary), job_title from employees left join jobs on employees.job_id = jobs.job_id 
where job_title like "%Manager%"
group by job_title;

/*----- 10) Select the Managers name, the count of employees working under and the department ID of the manager.-----*/
select M.first_name as "Manager Name", count(E.employee_id) as "Total Employee", E.department_id 
from employees  E left join  employees M on M.employee_id = E.manager_id group by M.first_name;

/*----- 11) Select the employee name, department id, and the salary. Group the result with the manager name and 
the employee last name should have second letter 'a!.-----*/
select E.last_name as "Employee Name", E.department_id, E.salary, M.last_name as "Manager Name"
from employees  E left join  employees M on M.employee_id = E.manager_id 
where E.last_name like "_a%" and M.last_name like "_a%";

/*----- 12) Display the average of sum of the salaries and group the result with the department id Order the result with the department id.-----*/
select sum(salary)/ count(department_id) as "Avg", department_id 
from employees 
group by department_id 
order by department_id;

/*----- 13) Select the maximum salary of each department along with the department id.-----*/
select department_id, max(salary) as "Max Salary" 
from employees 
group by department_id;

/*----- 14) Display the commission, if not null display 10% of salary, if null display a default value 1. -----*/
SELECT commission_pct,
CASE
    WHEN commission_pct IS NULL THEN '1'
    ELSE salary * 10/100
END AS Commission
FROM employees;