--Create Student table
CREATE TABLE Student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) DEFAULT NULL,
    last_name VARCHAR(255) DEFAULT NULL,
    major VARCHAR(255) DEFAULT NULL
);

--Create Course table
CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    department VARCHAR(255) NOT NULL,
    course_number INT NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    semester VARCHAR(255) NOT NULL,
    year INT NOT NULL
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

--Create Distribution table
CREATE TABLE Distribution (
    distribution_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    course_id INT NOT NULL,
    category VARCHAR(30) NOT NULL,
    percent INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);





