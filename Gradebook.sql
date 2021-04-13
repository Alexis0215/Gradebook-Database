/* DROP DATABASE IF EXISTS `sql_ctest`;
CREATE DATABASE `sql_ctest`; 
USE `sql_ctest`; */


/* creating COURSES table*/
DROP TABLE IF EXISTS `COURSES`;
CREATE TABLE `COURSES` (
    `CourseID` int(11) NOT NULL AUTO_INCREMENT,
    `CourseName` varchar(255) DEFAULT NULL,
    `Department` varchar(255) DEFAULT NULL,
    `CRN` varchar(255) DEFAULT NULL,
    `Semester` varchar(255) DEFAULT NULL,
    `AcademicYear` int(4) DEFAULT NULL,
    PRIMARY KEY (`CourseID`)
 );

 /* inserting COURSE info */
INSERT INTO `COURSES` (CourseID, CourseName, Department, CRN, Semester, AcademicYear)
VALUES (CourseID, 'Chemistry I', 'CHEM', '001', 'Spring', 2021),
(CourseID, 'Technical Writing', 'ENGL', '009', 'Spring', 2021),
(CourseID, 'Database Systems', 'CSCI', '421', 'Fall', 2020),
(CourseID, 'Intro to Linear Algebra', 'MATH', '174', 'Spring', 2021),
(CourseID, 'Elemtary Judo', 'HHPL', '014', 'Fall', 2020);

/* creating ENROLLMENT table*/
DROP TABLE IF EXISTS `ENROLLMENT`;
CREATE TABLE `ENROLLMENT` (
  `SSID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  PRIMARY KEY (SSID, CourseID)
);

/* inserting ENROLLMENT info */
INSERT INTO `ENROLLMENT` (SSID, CourseID)
VALUES (1,2),(1,4),(1,3),(2,2),(2,3),(2,1),(3,1),(3,4),(3,2),
(4,4),(4,5),(4,1),(5,1),(5,3),(5,2),(6,5),(6,4),(6,1),
(7,3),(7,4),(7,5),(8,2),(8,3),(8,5),(9,5),(9,1),(9,2),
(10,3),(10,4),(10,5);

/* creating STUDENT table*/
DROP TABLE IF EXISTS `STUDENTS`;
CREATE TABLE `STUDENTS` (
    `SSID` int(11) NOT NULL AUTO_INCREMENT,
    `FName` varchar(255) DEFAULT NULL,
    `LName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`SSID`)
);

/* inserting STUDENT info*/
INSERT INTO `STUDENTS` (FName, LName, Major)
VALUES ('Mackenzie', 'Lynch', 'Computer Science'),
('Imaani', 'Stanton', 'Computer Science'),
('Aarav', 'Beaumont', 'Computer Science'),
('Husnain', 'Conrad', 'Computer Science'),
('Janet', 'Conrad', 'Computer Science'),
('Saara', 'Gonzales', 'Computer Science'),
('Roger', 'Kaufman', 'Computer Science'),
('Zoya', 'Flower', 'Computer Science'),
('Mekhi', 'Watson', 'Computer Science'),
('Abdul', 'Quaker', 'Computer Science');



/* creating DISTRIBUTION table */
DROP TABLE IF EXISTS `DISTRIBUTION`;
CREATE TABLE `DISTRIBUTION` (
  `DistID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Percent` int(3) DEFAULT NULL,
  PRIMARY KEY (`DistID`),
  FOREIGN KEY (`CourseID`) REFERENCES COURSES(CourseID)
);

/* inserting DISTRIBUTION table */
INSERT INTO `DISTRIBUTION` (DistID, CourseID, Type, Percent)
VALUES (DistID, 1, 'Participation', 10),(DistID, 1, 'Homework', 30),(DistID, 1, 'Tests', 30),(DistID, 1, 'Projects', 30),
(DistID, 2, 'Participation', 30),(DistID, 2, 'Homework', 40),(DistID, 2, 'Tests', 10),(DistID, 2, 'Projects', 20),
(DistID, 3, 'Participation', 10),(DistID, 3, 'Homework', 30),(DistID, 3, 'Tests', 40),(DistID, 3, 'Projects', 20),
(DistID, 4, 'Participation', 15),(DistID, 4, 'Homework', 35),(DistID, 4, 'Tests', 30),(DistID, 4, 'Projects', 20),
(DistID, 5, 'Participation', 50),(DistID, 5, 'Homework', 10),(DistID, 5, 'Tests', 20),(DistID, 5, 'Projects', 20);

/* creating ASSUGNMENT table */
DROP TABLE IF EXISTS `ASSIGNMENTS`;
CREATE TABLE `ASSIGNMENTS` (
  `AssignID` int(11) NOT NULL AUTO_INCREMENT,
  `DistID` int(11) DEFAULT NULL,
  `Instance` int(11) DEFAULT NULL,
  `TotalPoints` int(3) DEFAULT NULL,
  PRIMARY KEY (`AssignID`),
  FOREIGN KEY (`DistID`) REFERENCES DISTRIBUTION(DistID)
);
/* inserting ASSIGNMENT info*/
INSERT INTO `ASSIGNMENTS` (AssignID, DistID, Instance, TotalPoints)
VALUES (AssignID, 1, 1, 100),(AssignID, 2, 3, 100),(AssignID, 3, 2, 100),(AssignID, 4, 1, 100),
(AssignID, 5, 1, 100),(AssignID, 6, 5, 100),(AssignID, 7, 2, 100),(AssignID, 8, 2, 100),
(AssignID, 9, 1, 100),(AssignID, 10, 2, 100),(AssignID, 11, 1, 100),(AssignID, 12, 1, 100),
(AssignID, 13, 1, 100),(AssignID, 14, 1, 100),(AssignID, 15, 1, 100),(AssignID, 16, 2, 100),
(AssignID, 17, 1, 100),(AssignID, 18, 1, 100),(AssignID, 19, 1, 100),(AssignID, 20, 1, 100);

/* creating SCORE table */
DROP TABLE IF EXISTS `SCORE`;
CREATE TABLE `SCORE` (
    `SSID` int(11) NOT NULL,
    `AssignID` int(11) NOT NULL,
  	`Points` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (SSID, AssignID),
    FOREIGN KEY (`SSID`) REFERENCES STUDENTS(SSID),
    FOREIGN KEY (`AssignID`) REFERENCES ASSIGNMENTS(AssignID)
);

INSERT INTO `SCORE` (SSID, AssignID, Points)
VALUES (1, 6, 92), (1, 7, 92), (1, 8, 92),(1, 9, 71), (1, 10, 87), (1, 11, 65), (1, 12, 97), (1, 13, 68), (1, 14, 87), (1, 15, 97), (1, 16, 65),
(2, 1, 87), (2, 2, 78), (2, 3, 75), (2, 4, 92), (2, 5, 94), (2, 6, 74), (2, 7, 93), (2, 8, 83), (2, 9, 93), (2, 10, 74), (2, 11, 92), (2, 12, 92),
(3, 1, 94), (3, 2, 92), (3, 3, 91), (3, 4, 92), (3, 5, 93), (3, 6, 45), (3, 7, 65), (3, 8, 83), (3, 13, 89), (3, 14, 92), (3, 15, 92), (3, 16, 92),
(4, 1, 74), (4, 2, 83), (4, 3, 92), (4, 4, 96), (4, 13, 78), (4, 14, 74), (4, 15, 97), (4, 16, 50), (4, 17, 97), (4, 18, 97), (4, 19, 98), (4, 20, 94),
(5, 1, 89), (5, 2, 92), (5, 3, 94), (5, 4, 86), (5, 5, 83), (5, 6, 92), (5, 7, 92), (5, 8, 97), (5, 9, 94), (5, 10, 83), (5, 11, 83), (5, 12, 74),
(6, 1, 77), (6, 2, 87), (6, 3, 65), (6, 4, 93), (6, 13, 93), (6, 14, 97), (6, 15, 92), (6, 16, 87), (6, 17, 86), (6, 18, 85), (6, 19, 93), (6, 20, 94),
(7, 9, 87), (7, 10, 94), (7, 11, 97), (7, 12, 74), (7, 13, 93), (7, 14, 92), (7, 15, 84), (7, 16, 89), (7, 17, 98), (7, 18, 74), (7, 19, 93), (7, 20, 74), (8, 5, 74), (8, 6, 93), (8, 7, 83), (8, 8, 92), (8, 9, 45), (8, 10, 67), (8, 11, 93), (8, 12, 93), (8, 17, 85), (8, 18, 74), (8, 19, 83), (8, 20, 74),
(9, 1, 74), (9, 2, 83), (9, 3, 84), (9, 4, 93), (9, 5, 89), (9, 6, 72), (9, 7, 74), (9, 8, 84), (9, 17, 72), (9, 18, 93), (9, 19, 87), (9, 20, 83), (10, 9, 45), (10, 10, 92), (10, 11, 74), (10, 12, 84), (10, 13, 98), (10, 14, 97), (10, 15, 81), (10, 16, 89), (10, 17, 99), (10, 18, 81), (10, 19, 97), (10, 20, 85);

-- #3 Show the tables with the contents that you have inserted;
select * from STUDENTS;
select * from COURSES;
select * from DISTRIBUTION;
select * from ENROLLMENT;
select * from ASSIGNMENTS;
select * from SCORE;

-- #4. Compute the average/highest/lowest score of an assignment
select a.AssignID, a.TotalPoints, avg(s.POINTS) AS AverageScore, max(s.POINTS) AS HighestScore, min(s.POINTS) AS LowestScore
from ASSIGNMENTS a, SCORE s
where a.AssignID=2 AND s.AssignID=a.AssignID; 

-- #5. List all of the students in a given course
select LName, FName, CourseName from `ENROLLMENT`
inner join `STUDENTS` on (STUDENTS.SSID = ENROLLMENT.SSID)
inner join `COURSES` on (COURSES.CourseID = ENROLLMENT.CourseID) where (COURSES.CourseID = 2)
order by LName asc; 

-- #6. List all of the students in a course and all of their scores on every assignment
select LName, FName, CourseName, ASSIGNMENTS.AssignID, Points, TotalPoints from `ENROLLMENT`
inner join `STUDENTS` on (STUDENTS.SSID = ENROLLMENT.SSID)
inner join `SCORE` on (SCORE.SSID = ENROLLMENT.SSID)
inner join `ASSIGNMENTS` on (ASSIGNMENTS.AssignID = SCORE.AssignID)
inner join `COURSES` on (COURSES.CourseID = ENROLLMENT.CourseID) where (COURSES.CourseID = 1)
order by AssignID, LName asc; 

-- #7. Add an assignment to a course
insert into ASSIGNMENTS(DistID, Instance, TotalPoints)
VALUES (1, 3, 100);
SELECT * FROM ASSIGNMENTS;
 
-- #8. Change the percentages of the categories for a course
update DISTRIBUTION set Percent = 30
where DistID = 1;
update DISTRIBUTION set Percent = 40
where DistID = 3;
SELECT * FROM DISTRIBUTION; 

-- #9 Add 2 points to the score of each student on an assignment;
UPDATE SCORE SET Points = Points + 2
WHERE AssignID = 4;
SELECT * FROM `SCORE`
LEFT JOIN `ASSIGNMENTS` ON (SCORE.AssignID = ASSIGNMENTS.AssignID) WHERE (SCORE.AssignID = 4)
order by SSID; 

-- #10 Add 2 points just to those students whose last name contains a ‘Q’
SELECT * FROM `SCORE`
LEFT JOIN `ASSIGNMENTS` ON (SCORE.AssignID = ASSIGNMENTS.AssignID) 
WHERE (SCORE.SSID = 6)
order by SSID;

update `SCORE`
left join `STUDENTS` 
on (SCORE.SSID = STUDENTS.SSID)
set Points = Points + 2
where (STUDENTS.LName LIKE '%q%')
or (STUDENTS.LName LIKE '%Q%')
and (STUDENTS.SSID = 6);

SELECT * FROM `SCORE`
LEFT JOIN `ASSIGNMENTS` ON (SCORE.AssignID = ASSIGNMENTS.AssignID) 
WHERE (SCORE.SSID = 6)
order by SSID; 

-- #11.  Compute the grade for a student
Select SUM(((sg.Points * 100) / a.TotalPoints) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, SCORE sg
WHERE d.DistID = a.DistID
AND sg.AssignID = a.AssignID
AND d.CourseID = 3
AND SSID = 1; 

Select SUM(((sg.Points * 100) / a.TotalPoints) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, SCORE sg
WHERE d.DistID = a.DistID
AND sg.AssignID = a.AssignID
AND d.CourseID = 3
AND SSID = 1;                

-- #12. Compute the grade for a student, where the lowest score for a given category is dropped.
SELECT min(s.Points) as LowestGrade FROM SCORE s
left join `ASSIGNMENTS` a on (s.AssignID = a.AssignID)
left join `DISTRIBUTION` d on (d.DistID = a.DistID)
left join `COURSES` c on (c.CourseID = d.courseID)
WHERE  s.SSID = 1
and d.CourseID = 3
order by s.SSID asc;
SELECT * FROM SCORE where SSID = 1;

Delete from `SCORE` 
where SSID = 1 and AssignID = 9;

Select SUM(((sg.Points * 100) / a.TotalPoints) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, SCORE sg
WHERE d.DistID = a.DistID
AND sg.AssignID = a.AssignID
AND d.CourseID = 3
AND SSID = 1;
                                                
SELECT s.AssignID, s.SSID,d.CourseID, s.Points  FROM SCORE s
left join `ASSIGNMENTS` a on (s.AssignID = a.AssignID)
left join `DISTRIBUTION` d on (d.DistID = a.DistID)
left join `COURSES` c on (c.CourseID = d.courseID)
WHERE  s.SSID = 1
and d.CourseID = 3
order by s.SSID asc; 