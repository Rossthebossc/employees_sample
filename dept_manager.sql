-- Table to which displays Managers per Department that are Active Only

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    d.dept_name,
    CASE
        WHEN YEAR(dm.to_date) = 9999 THEN 'Active'
        ELSE 'Not Active'
    END AS Active
FROM
    employees.employees e
        JOIN
    employees.dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    employees.departments d ON d.dept_no = dm.dept_no
HAVING Active = 'Active'
ORDER BY d.dept_no
; 