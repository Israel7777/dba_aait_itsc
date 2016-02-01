-- Views are used for performance and security reasons
	-- View for users profile (Users need to access only their own profile)
	-- View
		CREATE VIEW user_profile AS 
			SELECT * FROM users
			WHERE username=$uname and password=$passwrd;
-- How many female/male students have gpa > 3.0?
-- To answer this and similar  questions we have to 
	-- join Student table and student_grade table
	-- SQL without View
		-- SELECT student.student_id,first_name,last_name,gpa,gender FROM student NATURAL JOIN student_grade
		--	WHERE student.gender = "FEMALE";
	-- View
		CREATE VIEW male_students_gpa AS
			SELECT student.student_id,first_name,last_name,gpa,gender 
			FROM student NATURAL JOIN student_grade
			WHERE student.gender = "MALE";

		CREATE VIEW female_students_gpa AS
			SELECT student.student_id,first_name,last_name,gpa,gender 
			FROM student NATURAL JOIN student_grade
			WHERE student.gender = "FEMALE";
	-- Using view 
		-- SELECT * FROM male_students_gpa where gpa>3.0;
	