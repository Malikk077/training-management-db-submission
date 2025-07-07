create database academy;
use academy;


create table topic(
topic_id int,
topic_name varchar(25),
course_id int,
primary key(topic_id) );

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL
);

CREATE TABLE Trainers (
    trainer_id INT PRIMARY KEY AUTO_INCREMENT,
    trainer_name VARCHAR(100) NOT NULL
);

CREATE TABLE Batches (
    batch_id INT PRIMARY KEY AUTO_INCREMENT,
    batch_code VARCHAR(50) UNIQUE NOT NULL,
    course_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
alter table topic 
add FOREIGN KEY (course_id) REFERENCES Courses(course_id);

CREATE TABLE Batch_Trainers (
    batch_id INT,
    trainer_id INT,
    PRIMARY KEY (batch_id, trainer_id),
    FOREIGN KEY (batch_id) REFERENCES Batches(batch_id),
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id)
);

create table candidates(
     candidate_id int primary key,
     candidate_name varchar(25) not null,
     candidate_status varchar(25) default("in progress"),
     email varchar(35) not null,
     phone_no varchar(15) not null
);
		


CREATE TABLE Candidate_Batch (
    candidate_id INT,
    batch_id INT,
    candidate_status varchar(25) default("in progress"),
    PRIMARY KEY (candidate_id, batch_id),
    FOREIGN KEY (candidate_id) REFERENCES Candidates(candidate_id),
    FOREIGN KEY (batch_id) REFERENCES Batches(batch_id)
);

CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    batch_id INT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date DATE,
    FOREIGN KEY (batch_id) REFERENCES Batches(batch_id)
);

CREATE TABLE Submissions (
    assignment_id INT,
    candidate_id INT,
    submission_date DATE,
    score DECIMAL(5,2),
    PRIMARY KEY (assignment_id, candidate_id),
    FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id),
    FOREIGN KEY (candidate_id) REFERENCES Candidates(candidate_id)
);

