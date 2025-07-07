


insert into courses 
values(1,'python'),(2,'java'),(3,'html'),(4,'css');


INSERT INTO Topic VALUES
(1,'HTML Basics', 3),
(2,'CSS Layouts', 4),
(3,'JavaScript Intro', 2),
(4,'python fundamentals', 1),
(5,'android development', 2),
(6,'frontend basics', 3),
(7,'dynamic web', 4);

INSERT INTO Trainers (trainer_name) VALUES
('Anna Roy'),
('Ben Carter'),
('Chitra Das');

INSERT INTO Batches (batch_code, course_id, start_date, end_date) VALUES
('py101', 1, '2025-07-01', '2025-08-15'),
('web102', 3, '2025-07-10', '2025-08-25'),
('AND103', 2, '2025-07-20', '2025-09-15');

INSERT INTO Batch_Trainers (batch_id, trainer_id) VALUES
(1, 1), (2, 2), (3, 2),(3, 3);

INSERT INTO Candidates  VALUES
(1,'Tom Hardy', 'tom@example.com','' ,'9876543000'),
(2,'Lisa Ray', 'lisa@example.com', '','9876543001'),
(3,'Aryan Nair', 'aryan@example.com','' ,'9876543002'),
(4,'Sara Ali', 'sara@example.com','' ,'9876543003');

alter table candidates
modify phone_no varchar(15);



INSERT INTO Candidate_Batch (candidate_id, batch_id, candidate_status) VALUES
(1, 1, 'In Progress'),
(2, 2, 'In Progress'),
(3, 3, 'In Progress'),
(4, 3, 'Completed'),
(2, 3, 'In Progress');

INSERT INTO Assignments VALUES 
(1, 1, 'Landing Page Design', 'Use HTML and CSS to design a static page', '2025-07-20'), 
(2, 2, 'JavaScript Clock', 'Build a live digital clock using JavaScript', '2025-07-25'), 
(3, 2, 'Excel python', 'Write clean code using python', '2025-07-22'), 
(4, 3, 'Web Page Basics', 'Web page starting', '2025-08-10');

INSERT INTO Submissions (assignment_id, candidate_id, submission_date, score) VALUES
(1, 1, '2025-07-19', 80.0),
(2, 1, '2025-07-24', 78.0),
(3, 2, '2025-07-21', 85.0),
(4, 3, '2025-08-09', 90.0),
(4, 4, '2025-08-08', 88.5),
(4, 2, '2025-08-09', 84.0);





