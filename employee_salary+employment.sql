-- Table to which displays an employees Max Salary, Average Salary, Years of Employment and Employment Status

SELECT 
    COALESCE(e.emp_no, s.emp_no) AS emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) AS max_salary,
    AVG(s.salary) AS avg_salary,
    ROUND(DATEDIFF(a.max_date, s.from_date) / 365,
            2) AS years_employed,
    a.status AS 'Employment Status'
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
        JOIN
    (SELECT 
        s.emp_no,
            CASE
                WHEN YEAR(MAX(s.to_date)) <> 9999 THEN MAX(s.to_date)
                ELSE CURRENT_DATE()
            END AS max_date,
            CASE
                WHEN YEAR(MAX(s.to_date)) = '9999' THEN 'Currently Employed'
                ELSE 'No Longer Employed'
            END AS status
    FROM
        Salaries s
    GROUP BY s.emp_no) AS a ON s.emp_no = a.emp_no
GROUP BY emp_no
ORDER BY emp_no
;