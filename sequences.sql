-- Since all primary key values should be auto increment 
-- We should enforece this by sequences.

-- student_id sequence
	CREATE SEQUENCE student_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
		CACHE 10	-- To store 10 values in memory for faster access

-- instructor_id sequence
	CREATE SEQUENCE instructor_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
-- course_assignment_id sequence
	CREATE SEQUENCE course_assignment_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
		CACHE 5	-- To store 5 values in memory for faster access

-- department_id sequence
	CREATE SEQUENCE department_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
		CACHE 5	-- To store 5 values in memory for faster access
-- stream_id sequence
	CREATE SEQUENCE stream_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
		CACHE 5	-- To store 5 values in memory for faster access
-- dormitory_id sequence
	CREATE SEQUENCE stream_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
-- proctor_id sequence
	CREATE SEQUENCE proctor_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE

-- family_id sequence
	CREATE SEQUENCE family_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
		CACHE 10	-- To store 10 values in memory for faster access
-- course_id sequence
	CREATE SEQUENCE course_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
		CACHE 5	-- To store 5 values in memory for faster access
-- course_prerequisites_id sequence
	CREATE SEQUENCE course_prerequisites_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
		CACHE 5	-- To store 5 values in memory for faster access
-- user_id sequence
	CREATE SEQUENCE user_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
		CACHE 15	-- To store 15 values in memory for faster access
-- student_grade_id sequence
	CREATE SEQUENCE student_grade_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
		CACHE 10	-- To store 10 values in memory for faster access
-- register_course_id sequence
	CREATE SEQUENCE register_course_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
		CACHE 5	-- To store 5 values in memory for faster access
-- with_drawal_id sequence
	CREATE SEQUENCE withdrawal_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE
-- curriculam_id sequence
	CREATE SEQUENCE curriculam_id_sequence 
		START WITH 1 -- ID always start from 1
		INCREMENT BY 1 
		NOMAXVALUE
		NOCYCLE