--Selecting student profile
-- Student Id index
	-- This index is required because most often we search for
		-- student using the student's Id
		-- Query 
			SELECT * FROM Student where student_id=$studentId;
		-- Index
			CREATE INDEX  studentIdIndex on Student(student_id) USING BTREE;
			-- Used BTREE because  student_id is unique.
-- Student GPA
	-- Most of the time student are listed using students_gpa
	-- Query 
		SELECT sudentId,GPA from student_grade where GPA > 3.0;
		SELECT sudentId,GPA from student_grade where GPA =4.0;
	-- Index
		CREATE INDEX  studentGPAIndex on student_grade(student_id,GPA) USING BTREE;
		-- BTREE becuase student_id, gpa is unique

-- How may female or male students?
	-- We want to know how many male/female student  are there in school
	-- Query 
		SELECT * FROM student where gender = 'MALE';
	-- Index 
		CREATE INDEX genderIndex on student(gender) using BitMap;
		-- we created Bit Map index because gender column has only 2 distinictive values


-- Course Name
	-- We Query for course by its name
	-- Query 
		SELECT * FROM course WHERE course_name=$cname;
		-- OR
		SELECT * FROM course WHERE course_name like ="%$name";
	-- Index
		CREATE INDEX courseNameIndex on course(course_name) using BTREE;
			-- As we know course_name will not be duplicated often for given school

-- Instructor assigned for agiven course or a course assigned to a given instructor
	-- Users often query for instructor that is assigned for specfic course

	-- 	Query
		SELECT instructor_id,course_id FROM course_assignment WHERE course_id=$cId;
	-- OR courses assigned for specific instructor
		-- Query
			SELECT instructor_id,course_id FROM course_assignment WHERE instructor_id=$iId;
	-- Index
		CREATE INDEX instructorCourseIndex on course_assignment(instructor_id,course_id) Using BTREE;

-- Department With name

	-- There is always a need for searching  Departement by it name
		-- Query
			SELECT * FROM Departement where departement_name=$dname;
			-- OR
			SELECT * FROM Department where departement_name like "%$dname";
		-- Index
			CREATE INDEX departementNameIndex on Department(departement_name) using BTREE;
-- Stream with name
	-- Like departement there is always a need for searching  stream by it name
		-- Query
			SELECT * FROM Stream where stream_name=$sname;
			-- OR
			SELECT * FROM Stream where stream_name like "%$sname";
		-- Index
			CREATE INDEX streamNameIndex on Stream(stream_name) using BTREE;
-- Streams of a departement
	-- We always want to know streams for particular departement;
	-- Query
		SELECT stream_id,department_id,FROM stream where department_id = $did;
	-- Index
		CREATE INDEX streamDepartmentIndex on stream(stream_id,department_id) using BTREE;
-- Students of a dormitory
	-- Which students are assigned for a given dorm
	-- Query 
		SELECT student_id,dormitory_id FROM dormitory WHERE dormitory_id =$did;
	-- Index
		CREATE INDEX studnentDormitoryIndex on Student(dormitory_id) using BTREE;
-- Users username password
	-- When users login usually we check the validity of username password combination
	-- Query
		SELECT user_id FROM user where username= $uname and password =$passwd;
	-- Index
		CREATE INDEX usernamePasswordIndex on user(username, password) using  BTREE;

-- Grade for specific course
	-- Students often query for grade of specific registered course
	-- Query
		SELECT student_id,course_id,course_grade FROM register_courses where student_id=$sId and course_id=$cId;
	-- Index
		CREATE INDEX courseGradeIndex on register_courses(student_id, course_id) using  BTREE;





