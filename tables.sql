CREATE TABLE student(
	student_id VARCHAR2(20),
	user_id NUMBER ,
	first_name VARCHAR2(20) NOT NULL,
	last_name VARCHAR2(20) NOT NULL,
	middle_name VARCHAR2(20) NOT NULL,
	date_of_birth DATE,
	department_id NUMBER NOT NULL,
	academic_year NUMBER(1) NOT NULL,
	academic_semester NUMBER(1) NOT NULL,
	gender VARCHAR2(10) NOT NULL,
	dormitory_id NUMBER,
	region VARCHAR2(20),
	zone VARCHAR2(20),
	woreda VARCHAR2,
	kebele VARCHAR2,
	avatar BLOB NOT NULL,
	family_id NUMBER ,
	eheee_result NUMBER(3) NOT NULL,
	
	CONSTRAINT stu_pk PRIMARY KEY (student_id),
	CONSTRAINT stu_user_fk FOREIGN KEY (user_id) REFERENCES user(user_id) ON DELETE SET NULL,
	CONSTRAINT stu_dorm_fk FOREIGN KEY (dormitory_id) REFERENCES dormitory(dormitory_id) ON DELETE SET NULL,
	CONSTRAINT stu_fami_fk FOREIGN KEY (family_id) REFERENCES family(family_id) ON DELETE SET NULL,
	CONSTRAINT ch_gen CHECK(gender IN('MALE','FEMALE','UNKNOWN')),
	CONSTRAINT ch_eheee CHECK(eheee_result <= 700),
);

CREATE TABLE instructor(
	instructor_id NUMBER,
	instructor_first_name VARCHAR2(20) NOT NULL,
	instructor_last_name VARCHAR2(20) NOT NULL,
	department_id NUMBER NOT NULL,
	instructor_office VARCHAR2(20),
	
	CONSTRAINT inst_pk PRIMARY KEY (instructor_id),
	CONSTRAINT inst_dep_fk FOREIGN KEY (department_id) REFERENCES department(department_id),

);

CREATE TABLE course_assignment(
	course_assignment_id NUMBER,
	instructor_id NUMBER NOT NULL,
	course_id NUMBER NOT NULL,
	course_assignment_year NUMBER(4) NOT NULL,
	semester NUMBER(1) NOT NULL,
	
	CONSTRAINT cou_assi_pk PRIMARY KEY (course_assignment_id),
	CONSTRAINT cou_assi_inst_fk FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id) ON DELETE CASCADE,
	CONSTRAINT cou_assi_cou_fk FOREIGN KEY (course_id) REFERENCES course(course_id) ON DELETE CASCADE,
);

CREATE TABLE department(
	department_id NUMBER,
	department_name VARCHAR2(20) NOT NULL,
	department_head_first_name VARCHAR2(20) NOT NULL,
	department_head_last_name VARCHAR2(20) NOT NULL,
	department_office VARCHAR2(20) NOT NULL,
	
	CONSTRAINT dep_pf PRIMARY KEY(department_id),
);

CREATE TABLE stream(
	stream_id NUMBER,
	stream_name VARCHAR2(20) NOT NULL,
	department_id NUMBER NOT NULL,
	
	CONSTRAINT str_pk PRIMARY KEY(stream_id),
	CONSTRAINT str_dep_fk FOREIGN KEY (department_id) REFERENCES department(department_id) ON DELETE CASCADE,
);

CREATE TABLE dormitory(
	dormitory_id NUMBER,
	proctor_id NUMBER,
	dormitory_room_number NUMBER,
	
	CONSTRAINT dorm_pk PRIMARY KEY (dormitory_id),
	CONSTRAINT dorm_proc_fk FOREIGN KEY (proctor_id) REFERENCES proctor(proctor_id) ON DELETE SET NULL,
	
);

CREATE TABLE proctor(
	proctor_id NUMBER,
	proctor_first_name VARCHAR2(20),
	proctor_last_name VARCHAR2(20),
	proctor_phone_number VARCHAR2(14),
	building VARCHAR2(20),
	proctor_office VARCHAR2(20),
	
	CONSTRAINT proc_pk PRIMARY KEY(proctor_id),
);

CREATE TABLE family(
	family_id NUMBER,
	fathers_first_name VARCHAR2(20),
	fathers_last_name VARCHAR2(20),
	mothers_first_name VARCHAR2(20),
	mothers_last_name VARCHAR2(20),
	family_region VARCHAR2(20),
	family_zone VARCHAR2(20),
	family_woreda VARCHAR2(20),
	family_kebele VARCHAR2(20),
	
	CONSTRAINT fam_pk PRIMARY KEY(family_id),
	
);

CREATE TABLE course(
	course_id NUMBER,
	course_name VARCHAR2(20),
	course_number VARCHAR2(20) NOT NULL,
	department_id NUMBER,
	credit_hour NUMBER(1),
	course_prerequisites_id NUMBER,
	
	CONSTRAINT cour_pk PRIMARY KEY(course_id),
	CONSTRAINT cour_dep_fk FOREIGN KEY(department_id)REFERENCES department(department_id),
	CONSTRAINT cour_cour_prereq_fk FOREIGN KEY(course_prerequisites_id)REFERENCES course_prerequisites(course_prerequisites_id) ON DELETE SET NULL,
	
);

CREATE TABLE course_prerequisites(
	course_prerequisites_id NUMBER,
	dependent_course_id NUMBER,
	subject_course_id NUMBER CONSTRAINT sub_ref REFERENCES course_prerequisites(dependent_course_id),
	
	CONSTRAINT cour_pre_pk PRIMARY KEY(course_prerequisites_id),
	
);

CREATE TABLE user(
	user_id NUMBER,
	user_name VARCHAR2(20) NOT NULL,
	password VARCHAR2(20) NOT NULL,
	date_created DATE,
	role VARCHAR2 NOT NULL,
	
	CONSTRAINT user_pk PRIMARY KEY(user_id),
	
);

CREATE TABLE student_grade(
	student_grade_id NUMBER,
	student_id NUMBER,
	grade_year NUMBER(1),
	semester NUMBER(1),
	GPA NUMBER(3,2) DEFAULT 0,
	
	CONSTRAINT stu_gr_pk PRIMARY KEY(student_grade_id),
	CONSTRAINT stu_gr_stu_fk FOREIGN KEY(student_id)REFERENCES student(student_id) ON DELETE CASCADE,
);

CREATE TABLE register_courses(
	register_courses_id NUMBER,
	student_id NUMBER,
	number_of_register NUMBER DEFAULT 0,
	course_id NUMBER,
	register_year NUMBER(1),
	register_semester NUMBER(1),
	registretion_date DATE,
	course_grade NUMBER(3,2),
	
	CONSTRAINT reg_cour_pk PRIMARY KEY(register_courses_id),
	CONSTRAINT reg_cour_stu_fk FOREIGN KEY (student_id)REFERENCES student(student_id) ON DELETE CASCADE,
	CONSTRAINT reg_cour_cour_fk FOREIGN KEY (course_id)REFERENCES course(course_id) ON DELETE CASCADE,
);

CREATE TABLE withdrawal(
	withdrawal_id NUMBER,
	student_id NUMBER NOT NULL,
	withdrawal_date DATE,
	withdrawal_year NUMBER(1) NOT NULL,
	withdrawal_semester NUMBER(1) NOT NULL,
	reason_of_withdrawal VARCHAR2(50) NOT NULL,
	
	CONSTRAINT with_pk PRIMARY KEY(withdrawal_id),
	CONSTRAINT with_stu_fk FOREIGN KEY(student_id)REFERENCES student(student_id) ON DELETE CASCADE,
);

CREATE TABLE curriculum(
	curriculum_id NUMBER,
	curriculum_date DATE,
	department_id NUMBER,
	stream_id NUMBER,
	
	CONSTRAINT curr_pk PRIMARY KEY(curriculum_id),
	CONSTRAINT curr_dep_fk FOREIGN KEY(department_id)REFERENCES department(department_id) ON DELETE CASCADE,
	CONSTRAINT curr_str_fk FOREIGN KEY (stream_id)REFERENCES stream(stream_id) ON DELETE CASCADE,
);

CREATE OR REPLACE TRIGGER gpa_trigger
	AFTER INSERT OR UPDATE OR DELETE ON register_courses
	FOR EACH ROW
BEGIN
	IF(INSERTING)
	THEN
		UPDATE student_grade SET GPA=(GPA*register_courses.number_of_register+register_courses.course_grade)/(register_courses.number_of_register+1);
		UPDATE register_courses SET number_of_register = NVL(number_of_register,0)+1;
	END IF;
END;