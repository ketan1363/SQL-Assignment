use hr_db;
drop table customer;
create table customer(
	ID INT auto_increment primary key,
	Hire_Date date,
	Resignation_Date date);
    
insert into customer(Hire_Date,Resignation_Date) values("2000/01/01", "2013/10/07");
insert into customer(Hire_Date,Resignation_Date) values("2003/12/04", "2017/08/03");
insert into customer(Hire_Date,Resignation_Date) values("2012/09/22", "2015/06/21");
insert into customer(Hire_Date) values("2015/04/13");
insert into customer(Hire_Date) values("2016/06/03");
insert into customer(Hire_Date) values("2017/08/08");
    
select * from customer;

-- 1) Find the date difference between the hire date and resignation_date for all the
-- employees. Display in no. of days, months and year(1 year 3 months 5 days).
-- Emp_ID Hire Date Resignation_Date
-- 1 1/1/2000 7/10/2013
-- 2 4/12/2003 3/8/2017
-- 3 22/9/2012 21/6/2015
-- 4 13/4/2015 NULL
-- 5 03/06/2016 NULL
-- 6 08/08/2017 NULL
-- SELECT Floor(DATEDIFF(Resignation_Date,Hire_Date)/365),floor(mod(DATEDIFF(Resignation_Date,Hire_Date),365)/30),mod(floor(mod(DATEDIFF(Resignation_Date,Hire_Date),365)/30),30) AS DateDiff from customer;
-- select DATEDIFF(Resignation_Date, Hire_Date) AS date_diff,EXTRACT(DAY FROM INTERVAL DATEDIFF(Resignation_Date, Hire_Date) DAY) AS days,EXTRACT(MONTH FROM INTERVAL DATEDIFF(Resignation_Date, Hire_Date) DAY) AS months,EXTRACT(YEAR FROM INTERVAL DATEDIFF(Resignation_Date, Hire_Date) DAY) AS years from customer;
select DATEDIFF(Resignation_Date, Hire_Date) ,FLOOR(DATEDIFF(Resignation_Date, Hire_Date) / 365) AS years,
  FLOOR((DATEDIFF(Resignation_Date, Hire_Date) % 365) / 30) AS months,
  (DATEDIFF(Resignation_Date, Hire_Date) % 365) % 30 AS days from customer;
  
-- 2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd,
-- yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)

select date_format( Hire_Date,"%d/%m/%Y") as "Hire date",  IFNULL(date_format(Resignation_Date,"%b %D, %X"), "DEC, 01th 1900")  as "Registration date"
from customer;

-- 3) Calcuate experience of the employee till date in Years and months(example 1 year and 3
-- months)
-- Use Getdate() as input date for the below three questions.
-- 4) Display the count of days in the previous quarter.
SELECT DATEDIFF(LAST_DAY(DATE_SUB(CURDATE(), INTERVAL QUARTER(CURDATE()) - 2 QUARTER)), 
               DATE_ADD(DATE_SUB(CURDATE(), INTERVAL QUARTER(CURDATE()) - 2 QUARTER), INTERVAL 1 DAY)) AS DaysInPreviousQuarter;

-- 5) Fetch the previous Quarter's second week's first day's date
-- 6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)
-- 7) Find out the date that corresponds to the last Saturday of January, 2015 using with