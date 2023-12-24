
-- Создание хабов
CREATE TABLE Students_Hub (
    Student_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Teachers_Hub (
    Teacher_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE PracticalWorks_Hub (
    Work_ID INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Subjects_Hub (
    Subject_ID INT AUTO_INCREMENT PRIMARY KEY
);

-- Создание спутников
CREATE TABLE StudentDetails_Sat (
    StudentDetails_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE,
    Address VARCHAR(255),
    GroupName VARCHAR(50),
    FOREIGN KEY (Student_ID) REFERENCES Students_Hub(Student_ID)
);

CREATE TABLE TeacherDetails_Sat (
    TeacherDetails_ID INT AUTO_INCREMENT PRIMARY KEY,
    Teacher_ID INT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Title VARCHAR(50),
    Department VARCHAR(100),
    FOREIGN KEY (Teacher_ID) REFERENCES Teachers_Hub(Teacher_ID)
);

CREATE TABLE PracticalWorkDetails_Sat (
    PracticalWorkDetails_ID INT AUTO_INCREMENT PRIMARY KEY,
    Work_ID INT,
    Title VARCHAR(255),
    Description TEXT,
    Deadline DATE,
    FOREIGN KEY (Work_ID) REFERENCES PracticalWorks_Hub(Work_ID)
);

CREATE TABLE SubjectDetails_Sat (
    SubjectDetails_ID INT AUTO_INCREMENT PRIMARY KEY,
    Subject_ID INT,
    Title VARCHAR(255),
    Description TEXT,
    FOREIGN KEY (Subject_ID) REFERENCES Subjects_Hub(Subject_ID)
);

-- Создание линков
CREATE TABLE WorkExecution_Link (
    WorkExecution_Link_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT,
    Work_ID INT,
    FOREIGN KEY (Student_ID) REFERENCES Students_Hub(Student_ID),
    FOREIGN KEY (Work_ID) REFERENCES PracticalWorks_Hub(Work_ID)
);

CREATE TABLE WorkAssignment_Link (
    WorkAssignment_Link_ID INT AUTO_INCREMENT PRIMARY KEY,
    Teacher_ID INT,
    Work_ID INT,
    Subject_ID INT,
    FOREIGN KEY (Teacher_ID) REFERENCES Teachers_Hub(Teacher_ID),
    FOREIGN KEY (Work_ID) REFERENCES PracticalWorks_Hub(Work_ID),
    FOREIGN KEY (Subject_ID) REFERENCES Subjects_Hub(Subject_ID)
);
