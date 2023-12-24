
-- Создание таблицы Студенты
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    GroupName VARCHAR(50)
);

-- Создание таблицы Практические работы
CREATE TABLE PracticalWorks (
    WorkID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    Description TEXT
);

-- Создание таблицы Дисциплины
CREATE TABLE Subjects (
    SubjectID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255)
);

-- Создание таблицы Преподаватели
CREATE TABLE Teachers (
    TeacherID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Department VARCHAR(100)
);

-- Создание таблицы Выполнение работ
CREATE TABLE WorkExecution (
    ExecutionID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    WorkID INT,
    SubmissionDate DATE,
    Grade INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (WorkID) REFERENCES PracticalWorks(WorkID)
);

-- Создание таблицы Назначение работ
CREATE TABLE WorkAssignment (
    AssignmentID INT AUTO_INCREMENT PRIMARY KEY,
    TeacherID INT,
    WorkID INT,
    SubjectID INT,
    Deadline DATE,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    FOREIGN KEY (WorkID) REFERENCES PracticalWorks(WorkID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);
