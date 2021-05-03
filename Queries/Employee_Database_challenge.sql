--Retrieve the emp_no, first_name, and last_name columns from the Employees table

SELECT emp_no, first_name, last_name
FROM employees

--Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date 
from titles 


--retirement title
SELECT emp.emp_no, emp.first_name, emp.last_name, t.title, t.from_date, t.to_date
INTO retirement_title
FROM employees emp inner join titles t
on emp.emp_no = t.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp.emp_no asc


-- Unique Titles
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name, 
last_name, 
title
INTO unique_titles
FROM retirement_title
ORDER BY emp_no, from_date DESC;


--Retiring Titles
select title, count(*)
into retiring_titles
from unique_titles
group by title
order by 2 desc

 -- Mentorship eligibility
 
 SELECT distinct on (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name, emp.birth_date,
        dep.from_date, dep.to_date, t.title
--INTO membership_eligibility
FROM employees emp
  inner join dept_emp dep on emp.emp_no = dep.emp_no
  inner join titles t on emp.emp_no = t.emp_no
where  dep.to_date = '9999-01-01' -- current employees 
and (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by emp.emp_no, t.from_date desc




  

  
  
  
  