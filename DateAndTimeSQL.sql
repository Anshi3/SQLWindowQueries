-- . CURRENT_DATE – Aaj ki tareekh
select  current_date;



-- 2. CURRENT_TIME – Current time (server ka)
SELECT CURRENT_TIME;

-- 3. CURRENT_TIMESTAMP – Date + Time dono
SELECT CURRENT_TIMESTAMP;


-- 🔹 4. AGE() – Do dates ke beech ka difference (in years, months, days)
select  age(current_date,'1997-02-05')


-- 🔹 5. EXTRACT() – Date/time se part nikalna

select extract(year from current_date)as year,
		extract(month from current_date) as month,
		extract(day from current_date)as day;


--  TO_CHAR() – Date ko readable format mein convert karna

select to_char(current_date,'DD/Month/YYYY')


-- 7. NOW() – Same as CURRENT_TIMESTAMP

SELECT NOW();


🔹 8. DATE_TRUNC() – Date/time ka part cut ke round karna

SELECT DATE_TRUNC('month', CURRENT_DATE);


-- 9. Interval Add/Subtract – Days ya months add/subtract karna

select current_date +interval'10 days' 


select current_date - interval '2months';

-- Make Timestamp

select make_timestamp(2023,08,10,7,0,0);

--  1. Last 30 Days mein join huye employees

select name,joindate
from employees
where joindate>=current_date - interval '300 days';


select * from employees;

-- ✅ 2. Employees who joined after 1st Jan 2022

select name,joindate
from employees
where
joindate>'2022-01-01'


✅ 3. Har employee ka joining_age (years, months, days)

select name,joindate,
	age(current_date,joindate)as joining_age
	from employees;


-- Optional: Ek aur column add karke sirf number of days since joining nikalna

select name,joindate,
		current_date - joindate as days_since_joining
		from employees;

-- Frormatted_date


SELECT name, TO_CHAR(joindate, 'DD-Mon-YYYY') AS formatted_doj
FROM employees;


































