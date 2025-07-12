Create table departments(
	dept_id INTEGER PRIMARY KEY,
	dept_name TEXT
);

Create table employees(
	emp_id SERIAL PRIMARY KEY,
	name TEXT,
	dept_id INTEGER,
	salary INTEGER,
	doj DATE,
	FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

Insert into departments(dept_id,dept_name)VALUES
(101,'IT'),
(102,'HR'),
(103,'Finance'),
(104,'Marketing');



Insert into employees(name,dept_id,salary,doj)VALUES
('Anshika',101,90000,'2022-01-10'),
('Ansa',104,87000,'2022-01-10'),
('Pratik',104,99000,'2022-01-10'),
('Sonal', 102, 78000, '2021-12-01'),
('Nikhil', 103, 95000, '2020-05-15'),
('Ravi', NULL, 72000, '2023-04-01'),
('Priya', 104, 80000, '2024-06-20');



-- INNER JOIN

select e.name,e.salary,d.dept_name
From employees e
Inner Join departments d
on e.dept_id=d.dept_id


-- LEFT JOIN



select e.name,e.salary,d.dept_name
From employees e
left Join departments d
on e.dept_id=d.dept_id

-- RIGHT JOIN

SELECT d.dept_name, e.name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;


-- FULL OUTER JOIN
SELECT e.name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;



SELECT e.name, d.dept_name
FROM employees e
CROSS JOIN departments d;

Select e.name ,d.dept_name
from employees e
join departments d
on e.dept_id!=d.dept_id

--  Challenge 1: Show only those departments which have no employees

select d.dept_id,d.dept_name 
from
departments d
left join employees e 
on 
d.dept_id=e.dept_id
where
e.emp_id is NULL;



-- ✅ Challenge 2: Show all employees who do not belong to any valid department
🔍 Logic:



SELECT e.emp_id, e.name, e.dept_id
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;




-- ✅ Challenge 3: Show employees with salary > ₹80,000 and their department name

Select e.name,salary ,d.dept_name
from employees e
join departments d on e.dept_id=d.dept_id
where salary>80000



-- ✅ Challenge 4: Show the number of employees in each department using JOIN + GROUP BY
select  d.dept_name,count(e.emp_id)as emp_count
from departments d
inner join employees e on d.dept_id=e.dept_id
group by d.dept_name;


-- ✅  BONUS: If You Want to Include Even Empty Departments

select d.dept_name,count(e.emp_id)as emp_count
from departments d
left join employees e
on 
d.dept_id=e.dept_id
group by
d.dept_name;


-- SEMI JOIn
select e.name
from employees e
where exists(
select 1
from departments d
where e.dept_id=d.dept_id
)


🧠 SEMI JOIN Summary:
Point	Value
Works Like	INNER JOIN (filtered only)
Returns	Left table data only (e.g., employee)
Right Table Data?	❌ Nahi deta



-- AntiJoin 

select e.name
from
employees e
where not exists(
select 1
from departments d
where 
e.dept_id=d.dept_id
)


🧠 ANTI JOIN Summary:
Point	Value
Returns	Left table only (unmatched)
Right Table Data?	❌ Nahi deta
Usage	Filtering unmatched rows

🔄 SEMI vs ANTI — Ek Line Mein
Join Type	Logic
SEMI	"Jo match hue, woh lao" (EXISTS)
ANTI	"Jo match nahi hue, woh lao" (NOT EXISTS)

🔥 Bonus: When to Use
Use Case	Join Type
Employees with valid departments	SEMI JOIN
Employees with no valid department	ANTI JOIN
Orders that are not delivered	ANTI JOIN
Customers who placed orders	SEMI JOIN




