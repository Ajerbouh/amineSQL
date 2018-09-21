select student.firstname, student.lastname, year.label from student, year LEFT JOIN enrolment as e ON e.id_year = year.id where DATEDIFF(`to`, '2017-07-01') > 0 ORDER BY student.lastname ASC;
