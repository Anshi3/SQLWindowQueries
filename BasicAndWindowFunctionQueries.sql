Create table employees(
	emp_id SERIAL PRIMARY KEY,
	name TEXT,
	department TEXT,
	salary INTEGER,
	doj DATE
);

Insert Into employees(name,department,salary,doj)VALUES
('Anshika','IT',85000,'2019-06-24'),
('Anchal','IT',115000,'2019-06-14'),
('Ravi', 'IT', 72000, '2021-04-01'),
('Meena', 'HR', 60000, '2020-01-10'),
('Aman', 'HR', 58000, '2022-06-18'),
('Sonal', 'Finance', 90000, '2018-11-23'),
('Nikhil', 'Finance', 95000, '2017-07-12'),
('Pooja', 'Sales', 67000, '2023-01-01'),
('Aditya', 'Sales', 65000, '2022-09-15'),
('Neha', 'IT', 88000, '2020-05-20'),
('Manoj', 'HR', 61000, '2019-08-05');



select * from employees


select department,round(avg(salary),2) as avg_salary
from employees
group by department;


-- CTE  WHICH is known as common table expression

With HighSalaryEmp AS
(select * from employees where salary >80000)

select name,department,salary from HighSalaryEmp


With DeptAvg AS(
	select department,round(avg(salary)) as avg_sal
	from employees
	group by department
)
select * from DeptAvg where avg_sal>75000;


-- Window Functions

select name,department,salary,
	RANK() OVER(PARTITION BY department ORDER BY  salary DESC)AS dept_rank
from employees


-- LEAD AND LAG

select name,salary,
		LAG(salary) OVER(ORDER BY doj)AS prev_salary,
		LEAD(salary) OVER(ORDER BY doj )AS next_salary
from employees



With RankedEmp AS(
select *,
	rank() OVER(PARTITION BY department ORDER BY salary DESC )AS rnk
	FROM employees
)
Select name,department,salary,rnk 
from RankedEmp
where rnk<=2;



-- DENSE RANK


SELECT name,
	department,
	salary,
	DENSE_RANK() OVER(PARTITION BY department ORDER BY SALARY desc) AS salary_rank
	from employees;




INSERT INTO employees (name, department, salary, doj)
VALUES ('Utkarsh', 'Finance', 95000, '2023-04-01');


-- ILIKE OPERATOR

select * from employees where name  ILIKE 'A%';

-- WINDOW FUNCTIONS PRACTCE

-- 1.
select name,department,doj,
		ROW_NUMBER() OVER(ORDER BY doj) AS row_num
from employees;

-- 2.RANK Employees

select name,department,salary,
	RANK() OVER(PARTITION BY department  ORDER BY salary DESC )AS dept_rank
	from employees;

-- 3.DENSE RANK
select name,department,salary,
	DENSE_RANK() OVER(PARTITION BY department  ORDER BY salary DESC )AS dept_rank
	from employees;

-- 4.SHOW Previous salary using LAG

select name,salary,
			LAG(salary)OVER(ORDER BY salary DESC)AS previous_salary
from employees;

-- 5.SHOW NEXT  SALARY USING LEAD

select name,salary,
		LEAD(salary)OVER(ORDER BY salary asc)AS next_salary
from employees;

-- 6.Total number of employees in each dept using COUNT(),OVER()
select name,department,
count(*) over (partition by department )as dept_count
from employees;


-- 7.CALCULATE RUNNING TOTAL OF SALARIES

select name,salary,
		sum(salary) over(order by salary desc)as running_salary from employees;


-- 8.Show first employee (based on joining date )oin each department

select name,department,doj,
	first_value(name) over(partition by department order by doj) as first_emp
	from employees;


-- 9.Last Employee to Join

select name,department,doj,
	last_value(name) over(
	partition by department
	order by doj
	rows between unbounded preceding and unbounded following)
	as last_emp
	from employees;

-- 10.NTILE(4) ="OUARTILE DISTRIBUTION"

 SELECT name,salary,
	NTILE(4)over(order by salary desc)as salary_quartile
	from employees;



	





