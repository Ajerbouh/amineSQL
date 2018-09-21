select AVG(a.grade) from assessment as a INNER JOIN student as s ON s.id = a.id_student LEFT JOIN enrolment as e on e.id_student = s.id where e.id_year = "2";
