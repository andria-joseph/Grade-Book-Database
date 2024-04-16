--Create Course table
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    department VARCHAR(255) NOT NULL,
    course_number INT NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    semester VARCHAR(255) NOT NULL,
    year INT NOT NULL
);

--CREATE Category table
CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    weight_percentage DECIMAL(5, 2),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)

);

--Create Assignment table
CREATE TABLE Assignment (
    assignment_id INT PRIMARY KEY IDENTITY,
    points Decimal(5, 2),
    course_id INT,
    course_name VARCHAR(255) NOT NULL,
    category_id INT,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);


-- Create Enrollment table
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY IDENTITY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    student_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);


--Create Grade table
CREATE TABLE Grade (
    grade_id INT PRIMARY KEY IDENTITY,
    student_id INT NOT NULL,
    assignment_id INT NOT NULL,
    points_earned DECIMAL(5, 2),
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
(3191, 'Chandler', 'Quincy', 'Information Technology'),
(4211, 'Rachel', 'Green', 'Fashion Design'),
(1934, 'Joey', 'Tribbiani', 'Film Studies '),
(8109, 'Phoebe', 'Buffay', 'Biology'),
(3395, 'Anu', 'Chaudhary', 'Computer Science'),
(5437, 'Keisha', 'Richards', 'Computer Engineering'),
(1498, 'Fatima', 'Mohammed', 'Computer Science');

--Insert values into Course table
INSERT INTO Course (course_id, department, course_number, course_name, semester, year) VALUES
(1, 'Computer Science', 101, 'Introduction to Computer Science', 'Fall', 2023),
(2, 'Computer Engineering', 201, 'Operating Systems', 'Fall', 2023),
(3, 'Computer Science', 102, 'Software Engineering', 'Spring', 2024),
(4, 'Computer Engineering', 203, 'Introduction to Digital Systems', 'Spring', 2024),
(5, 'Mathematics', 304, 'Data Science', 'Spring', 2024);

--Insert values into Category table
-- Introduction to Computer Science
INSERT INTO Category (category_id, category_name, weight_percentage, course_id) VALUES
(1, 'Participation', 10.00, 1),
(2, 'Homework', 20.00, 1),
(3, 'Tests', 50.00, 1),
(4, 'Projects', 20.00, 1),
(5, 'Quizzes', 10.00, 1);

