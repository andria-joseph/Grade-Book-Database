--Task 2: Creating the tables

--Create Student table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
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

--Create Assignment table
CREATE TABLE Assignment (
    assignment_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    distribution_id INT NOT NULL,
    instance INT NOT NULL,
    points_possoible INT DEFAULT 0 NOT NULL,
    FOREIGN KEY (distribution_id) REFERENCES Distribution(distribution_id)
);

--Create Grade table
CREATE TABLE Grade (
    student_id INT NOT NULL,
    assignment_id INT NOT NULL,
    points_earned INT DEFAULT 0 NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id)
);

--Task2:Inserting the values into the tables

--Insert values into Student table
INSERT INTO Student (student_id, first_name, last_name, major) VALUES
(1234, 'Johnathon', 'Matthews', 'Computer Science'),
(5678, 'Gabriel', 'Smith', 'Mathematics'),
(4321, 'Aaliyah', 'Johnson', 'Computer Engineering'),
(8765, 'Monica', 'Geller', 'Biology'),
(5566, 'Ross', 'Geller', 'Information Technology'),
(0191, 'Chandler', 'Bing', 'Information Technology'),
(4211, 'Rachel', 'Green', 'Fashion Design'),
(1934, 'Joey', 'Tribbiani', 'Film Studies '),
(8109, 'Phoebe', 'Buffay', 'Biology'),
(0395, 'Anu', 'Chaudhary', 'Computer Science'),
(5437, 'Keisha', 'Richards', 'Computer Engineering'),
(1498, 'Fatima', 'Mohammed', 'Computer Science');

--Insert values into Course table
INSERT INTO Course (department, course_number, course_name, semester, year) VALUES
('Computer Science', 101, 'Introduction to Computer Science', 'Fall', 2023),
('Computer Engineering', 201, 'Operating Systems', 'Fall', 2023),
('Computer Science', 102, 'Software Engineering', 'Spring', 2024),
('Computer Engineering', 203, 'Introduction to Digital Systems', 'Spring', 2024),
('Mathematics', 304, 'Data Science', 'Spring', 2024);

--Insert values into Enrollment table
INSERT INTO Enrollment (student_id, course_id) VALUES
(1234, 101), (0395, 101), (8765, 101), (4211, 101), (1934, 101), (8109, 101), 
(0191, 201), (4321, 201), (5566, 201), (0395, 201), (1498, 201),
(1234, 102), (4321, 102), (5566, 102), (0191, 102), (0395, 102), (1498, 102), (5437, 102),
(4321, 203), (5566, 203), (5437, 203), (1934, 203),
(5678, 304), (1234, 304), (0395, 304), (5437, 304), (1498, 304);
