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












Example 1: Mahine ka Pehla Din
sql
Copy
Edit
SELECT DATE_TRUNC('month', CURRENT_DATE) AS start_of_month;




📌 Example 2: Saal ka Pehla Din
sql
Copy
Edit
SELECT DATE_TRUNC('year', CURRENT_DATE) AS start_of_year;
📤 Output: 2025-01-01 00:00:00


📌 Example 3: Hafte ka Start (Sunday ya Monday based on config)
sql
Copy
Edit
SELECT DATE_TRUNC('week', CURRENT_DATE) AS start_of_week;




SELECT DATE_TRUNC('day', NOW()) AS start_of_day;


💡 Real-Life Use Case:
🧮 Count of employees joined this month:

select count(*)
from employees
where date_trunc('month',joindate)=date_trunc('month',current_date)


--  Group by Month (Year + Month combo):
-- sql
-- Copy
-- Edit


SELECT DATE_TRUNC('month', joindate) AS join_month,
       COUNT(*) AS total_joins
FROM employees
GROUP BY join_month
ORDER BY join_month;













SELECT DATE_TRUNC('year', CURRENT_DATE) AS start_of_year;

















