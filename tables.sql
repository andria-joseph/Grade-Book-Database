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
    course_id INT PRIMARY KEY,
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
    distribution_id INT PRIMARY KEY IDENTITY,
    course_id INT NOT NULL,
    category VARCHAR(30) NOT NULL,
    percentage INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

--Create Assignment table
CREATE TABLE Assignment (
    assignment_id INT PRIMARY KEY IDENTITY,
    distribution_id INT NOT NULL,
    instance INT NOT NULL,
    points_possible INT DEFAULT 0 NOT NULL,
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
(3191, 'Chandler', 'Bing', 'Information Technology'),
(4211, 'Rachel', 'Green', 'Fashion Design'),
(1934, 'Joey', 'Tribbiani', 'Film Studies '),
(8109, 'Phoebe', 'Buffay', 'Biology'),
(3395, 'Anu', 'Chaudhary', 'Computer Science'),
(5437, 'Keisha', 'Richards', 'Computer Engineering'),
(1498, 'Fatima', 'Mohammed', 'Computer Science');

--Insert values into Course table
INSERT INTO Course (course_id, department, course_number, course_name, semester, year) VALUES
(101, 'Computer Science', 101, 'Introduction to Computer Science', 'Fall', 2023),
(201, 'Computer Engineering', 201, 'Operating Systems', 'Fall', 2023),
(102, 'Computer Science', 102, 'Software Engineering', 'Spring', 2024),
(203, 'Computer Engineering', 203, 'Introduction to Digital Systems', 'Spring', 2024),
(304, 'Mathematics', 304, 'Data Science', 'Spring', 2024);

--Insert values into Enrollment table
INSERT INTO Enrollment (student_id, course_id) VALUES
(1234, 101), (3395, 101), (8765, 101), (4211, 101), (1934, 101), (8109, 101), 
(3191, 201), (4321, 201), (5566, 201), (3395, 201), (1498, 201),
(1234, 102), (4321, 102), (5566, 102), (3191, 102), (3395, 102), (1498, 102), (5437, 102),
(4321, 203), (5566, 203), (5437, 203), (1934, 203),
(5678, 304), (1234, 304), (3395, 304), (5437, 304), (1498, 304)


--Insert values into Distribution table
INSERT INTO Distribution (course_id, category, percentage) VALUES
-- Introduction to Computer Science
(1, 'Participation', 10),
(1, 'Homework', 20),
(1, 'Tests', 50),
(1, 'Projects', 20),
-- Operating Systems
(2, 'Participation', 5),
(2, 'Homework', 25),
(2, 'Tests', 60),
(2, 'Projects', 10),
-- Software Engineering
(3, 'Participation', 15),
(3, 'Homework', 30),
(3, 'Tests', 40),
(3, 'Projects', 15),
-- Introduction to Digital Systems
(4, 'Participation', 20),
(4, 'Homework', 25),
(4, 'Tests', 45),
(4, 'Projects', 10),
-- Data Science
(5, 'Participation', 10),
(5, 'Homework', 30),
(5, 'Tests', 50),
(5, 'Projects', 10);

--Insert values into Assignment table
-- Introduction to Computer Science
INSERT INTO Assignment (distribution_id, instance, points_possible) VALUES
(1, 1, 20), (2, 1, 20), (3, 1, 100), (4, 1, 50),
(1, 2, 20), (2, 2, 20), (3, 2, 100), (4, 2, 50),
(1, 3, 20), (2, 3, 20), (3, 3, 100), (4, 3, 50),
(1, 4, 20), (2, 4, 20), (3, 4, 100), (4, 4, 50),
(1, 5, 20), (2, 5, 20), (3, 5, 100), (4, 5, 50);

-- Operating Systems
INSERT INTO Assignment (distribution_id, instance, points_possible) VALUES
(5, 1, 10), (6, 1, 20), (7, 1, 100), (8, 1, 50),
(5, 2, 10), (6, 2, 20), (7, 2, 100), (8, 2, 50),
(5, 3, 10), (6, 3, 20), (7, 3, 100), (8, 3, 50),
(5, 4, 10), (6, 4, 20), (7, 4, 100), (8, 4, 50),
(5, 5, 10), (6, 5, 20), (7, 5, 100), (8, 5, 50);

-- Software Engineering
INSERT INTO Assignment (distribution_id, instance, points_possible) VALUES
(9, 1, 15), (10, 1, 20), (11, 1, 100), (12, 1, 50),
(9, 2, 15), (10, 2, 20), (11, 2, 100), (12, 2, 50),
(9, 3, 15), (10, 3, 20), (11, 3, 100), (12, 3, 50),
(9, 4, 15), (10, 4, 20), (11, 4, 100), (12, 4, 50),
(9, 5, 15), (10, 5, 20), (11, 5, 100), (12, 5, 50);

-- Introduction to Digital Systems
INSERT INTO Assignment (distribution_id, instance, points_possible) VALUES
(13, 1, 20), (14, 1, 20), (15, 1, 100), (16, 1, 50),
(13, 2, 20), (14, 2, 20), (15, 2, 100), (16, 2, 50),
(13, 3, 20), (14, 3, 20), (15, 3, 100), (16, 3, 50),
(13, 4, 20), (14, 4, 20), (15, 4, 100), (16, 4, 50),
(13, 5, 20), (14, 5, 20), (15, 5, 100), (16, 5, 50);

-- Data Science
INSERT INTO Assignment (distribution_id, instance, points_possible) VALUES
(17, 1, 10), (18, 1, 20), (19, 1, 100), (20, 1, 50),
(17, 2, 10), (18, 2, 20), (19, 2, 100), (20, 2, 50),
(17, 3, 10), (18, 3, 20), (19, 3, 100), (20, 3, 50),
(17, 4, 10), (18, 4, 20), (19, 4, 100), (20, 4, 50),
(17, 5, 10), (18, 5, 20), (19, 5, 100), (20, 5, 50);


-- Insert values into Grade table
INSERT INTO Grade (student_id, assignment_id, points_earned) VALUES
-- Johnathon Matthews
(1234, 1, 85), (1234, 2, 81), (1234, 18, 87), (1234, 16, 80), (1234, 30, 85), (1234, 40, 95), (1234, 3, 81), (1234, 4, 81), (1234, 5, 81), (1234, 6, 81), (1234, 7, 81), (1234, 8, 81), (1234, 9, 81), (1234, 10, 81), (1234, 12, 87), (1234, 13, 87),
-- Gabriel Smith
(5678, 1, 80), (5678, 2, 84), (5678, 18, 94), (5678, 3, 84), (5678, 4, 84), (5678, 5, 84), (5678, 6, 84), (5678, 7, 84), (5678, 8, 84), (5678, 9, 84), (5678, 10, 84), (5678, 12, 94), (5678, 13, 94),
-- Aaliyah Johnson
(4321, 1, 95), (4321, 2, 95), (4321, 18, 55), (4321, 3, 95), (4321, 4, 95),
-- Monica Geller
(8765, 1, 65),
-- Ross Geller
(5566, 1, 100), (5566, 2, 90), (5566, 18, 0), (5566, 3, 90), (5566, 4, 90),
-- Chandler Bing
(3191, 1, 100), (3191, 2, 100), (3191, 18, 72), (3191, 3, 100), (3191, 4, 100), (3191, 5, 100), (3191, 6, 100), (3191, 7, 100), (3191, 8, 100), (3191, 9, 100), (3191, 10, 100),
-- Rachel Green
(4211, 1, 100),
-- Joey Tribbiani
(1934, 1, 93), (1934, 18, 0), (1934, 3, 93), (1934, 4, 93),
-- Phoebe Buffay
(8109, 1, 99),
-- Anu Chaudhary
(3395, 1, 100), (3395, 2, 90), (3395, 3, 90), (3395, 4, 90), (3395, 5, 90), (3395, 6, 90), (3395, 7, 90), (3395, 8, 90), (3395, 9, 90), (3395, 10, 90), (3395, 26, 78), (3395, 28, 78),
-- Keisha Richards
(5437, 1, 93), (5437, 2, 93), (5437, 18, 99), (5437, 3, 93), (5437, 4, 93), (5437, 5, 93), (5437, 6, 93), (5437, 7, 93), (5437, 8, 93), (5437, 9, 93), (5437, 10, 93),
-- Fatima Mohammed
(1498, 1, 100), (1498, 2, 93), (1498, 18, 99), (1498, 3, 93), (1498, 4, 93), (1498, 5, 93);


--TASK4 4: 
-- --Compute average score of an assignment
-- SELECT AVG(points_earned) AS average_score
-- FROM Grade
-- WHERE assignment_id = <assignment_id>;

-- -- Compute highest score of an assignment
-- SELECT MAX(points_earned) AS highest_score
-- FROM Grade
-- WHERE assignment_id = <assignment_id>;

-- -- Compute lowest score of an assignment
-- SELECT MIN(points_earned) AS lowest_score
-- FROM Grade
-- WHERE assignment_id = <assignment_id>;


--TASK5: List all of the students in a given course
-- SELECT s.student_id, s.first_name, s.last_name
-- FROM Student s
-- INNER JOIN Enrollment e ON s.student_id = e.student_id
-- WHERE e.course_id = <course_id>;


--TASK6: LList all of the students in a course and all of their scores on every assignment;
-- SELECT s.student_id, s.first_name, s.last_name, g.assignment_id, g.points_earned
-- FROM Student s
-- INNER JOIN Grade g ON s.student_id = g.student_id
-- INNER JOIN Assignment a ON g.assignment_id = a.assignment_id
-- WHERE a.distribution_id IN (
--     SELECT distribution_id
--     FROM Distribution
--     WHERE course_id = <course_id>
-- );

--TASK7: Add an assignment to a course;
-- INSERT INTO Assignment (distribution_id, instance, points_possible)
-- VALUES (<distribution_id>, <instance>, <points_possible>);

--TASK8: Add a student to a course: Change the percentages of the categories for a course;
-- UPDATE Distribution
-- SET percentage = <new_percentage>
-- WHERE course_id = <course_id> AND category = '<category>';

--TASK9: Add 2 points to the score of each student on an assignment;
-- UPDATE Grade
-- SET points_earned = points_earned + 2
-- WHERE assignment_id = 1; 

