/*-----1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an
		  appropriate label.-----*/
select last_name,CONCAT(UCASE(SUBSTRING(last_name,1,1)),LOWER(SUBSTRING(last_name,2))) as "Capitalized",SUBSTRING(last_name, 2, 4) as "Position" from employees;

/*-----2. Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
          month on which the employee has joined.-----*/
select concat_ws("-",first_name, last_name) as Employee, MONTH(hire_date) as "Join of Month" from employees;

/*-----3. Write a query to display the employee's last name and if half of the salary is greater than
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label.-----*/
select last_name, salary,
case
	when salary/2 > 1000 then salary*10/100 +salary
    else salary * 11.5/100 +1500 +salary
end as Salary
from employees;

/*-----4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name
consists of 'z' replace it with '$!-----*/
select concat_ws("",substr(E.employee_id,1,2),0,0,substr(E.employee_id,3,1),"E") as employee, E.department_id, E.salary, 
replace(concat_ws(" ",upper(M.first_name),upper(M.last_name)), "Z", "$") as "Manager Name"
from employees  E left join  employees M on M.employee_id = E.manager_id ;

/*-----5. Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name
starts with J, A, or M. Give each column an appropriate label. Sort the results by the  employees' last names-----*/
select last_name, CONCAT(UPPER(SUBSTRING(last_name,1,1)),LOWER(SUBSTRING(last_name,2))) as "Capitalized",length(last_name) as "Length" 
from employees 
where last_name like "A%" Or last_name like"M%" OR last_name like "J%" 
order by last_name;

/*-----6. Create a query to display the last name and salary for all employees. Format the salary to
be 15 characters long, left-padded with $. Label the column SALARY-----*/
select last_name, lpad(salary, 15, '$') as "SALARY" from employees;

/*-----7. Display the employee's name if it is a palindrome-----*/
SELECT first_name from employees where first_name = reverse(first_name);

/*-----8. Display First names of all employees with initcaps.-----*/
select upper(first_name) as "First Name" from employees;

/*-----9. From LOCATIONS table, extract the word between first and second space from the
STREET ADDRESS column.-----*/
select SUBSTRING_INDEX(SUBSTRING_INDEX(street_address, " ", 2)," ",-1) as "STRRET ADDRESS" from locations;

/*-----10. Extract first letter from First Name column and append it with the Last Name. Also add
"@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name.-----*/
select first_name,lower(concat_ws("",(substring(first_name,1,1)),last_name,"@systechusa.com")) as "e-mail address" from employees;

/*-----11. Display the names and job titles of all employees with the same job as Trenna.-----*/
select first_name, job_title from employees left join jobs on employees.job_id = jobs.job_id
where job_title = "Stock Clerk";

/*-----12. Display the names and department name of all employees working in the same city as
Trenna.-----*/
select l.city, d.department_name,e.first_name from 
locations l join departments d on l.location_id = d.location_id join employees e on e.department_id = d.department_id
where city = "South San Francisco";

/*-----13. Display the name of the employee whose salary is the lowest.-----*/
select* from employees
where salary =  (select min(salary) as "Minimum Salary" from employees);

/*-----14. Display the names of all employees except the lowest paid. -----*/
select concat_ws(" ",first_name,last_name) as "Name" from employees where salary > (select min(salary) from employees);