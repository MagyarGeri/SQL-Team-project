CREATE DATABASE codecool;

SET CLIENT_ENCODING TO LATIN10;

CREATE TABLE course 
(course_id SERIAL PRIMARY KEY,
course_name VARCHAR(50),
starting_date DATE);

CREATE TABLE students
 (student_id SERIAL PRIMARY KEY,
  course_id INT NOT NULL, CONSTRAINT FK_course_id FOREIGN KEY (course_id) REFERENCES course(course_id),
  "name" VARCHAR(50),
  nickname VARCHAR(50),
  email VARCHAR(50),
  starting_date DATE,
  city VARCHAR(50),
  hobby VARCHAR(50));

CREATE TABLE projects 
(project_id SERIAL PRIMARY KEY,
 project_name VARCHAR(100), 
 "description" VARCHAR(200), 
 task VARCHAR(200), 
 form_type VARCHAR(30), 
 background_mat VARCHAR(250),
 course_id INT NOT NULL, CONSTRAINT FK_course_id FOREIGN KEY (course_id) REFERENCES course(course_id));


CREATE TABLE review 
(projects_id INT NOT NULL, CONSTRAINT FK_projects_id FOREIGN KEY (projects_id) REFERENCES projects(project_id),
students_id INT NOT NULL, CONSTRAINT FK_students_id FOREIGN KEY (students_id) REFERENCES students(student_id),
reviewer_id INT NOT NULL, CONSTRAINT FK_reviewer_id FOREIGN KEY (students_id) REFERENCES students(student_id),
score INT,
"date" DATE,
comment VARCHAR(100));



INSERT INTO course (course_name, starting_date)
VALUES 
('Mágus bot készítő képzés', '3001-11-10'),
('Tünde íj készítő képzés', '3001-12-11'),
('Hobbit serfőző/pipakészítő képzés','3001-10-25'),
('Törp fejsze készítő képzés','3001-09-30');



INSERT INTO projects (project_name, "description", task, form_type, background_mat, course_id)
VALUES
('Kristály keresés', 'A cél egy erős és kisdarab kristály megtalálása és  megmunkálása,hogy a botot ékesítse és felruházza erővel.','1. Keress egy kristályt 2. Törd megfelelő méretűre','Solo','Egy haszontalan hasznos link helye', 1),
('Fa keresés és megmunkálás', 'Keresned kell egy Entet, aki szívesen ad neked egy szép  fadarabot,hogy elkészíthesd a botot.','1. Keress egy Entet 2. A kapott fát munkáld meg', 'Solo','Hagyjál békén Tomi!', 1),
('Az íj megmunkálása', 'Egy nemes fából kell kifaragni a tündék legveszélyesebb fegyverét, az íjat.','1.Keresned kell egy nemes tündefát 2.Faragd ki az íj törzsét', 'Solo', 'Különböző linkek, amik hasznos weboldalakra mutatnak', 2),
('Íj ideg keresése','A tündék nagyon tisztelik és óvják a természetet, így mindig csoportosan vadásznak le egy arra méltó szarvast, hogy elkészíthessék belőle az íj ideget','1.Együtt vadásszatok le egy szarvast 2.Nyerjétek ki az inakat az állatból','Csapat','Hagyjál békén Tomi baszki!', 2),
('Sör készítése ','A hobbitok nem túl ügyesek vagy okosak,de a sör készítéséhez és annak elfogyasztásához értenek,készítsetek ti is egyet','1.Keressétek meg a legjobb alapanyagokat a megyéből 2.Főzzétek meg a sört és igyátok meg','Csapat','Még mindig egy haszontalan hasznos link helye', 3),
('Pipa készítés','Minden jóravaló hobbitnak van egy kis lápatoroki dohánya a szekrényben,amit csak saját készítésű pipával illik szívni','1.Keressetek és csináljatok egy pipát 2.Szívjatok közösen egy kis lápatoroki dohányt','Csapat','Rengeteg különböző link, amik hasznos weboldalakra mutatnak', 3),
('Fejsze markolat készítés','Mindenki tudja,hogy a törpök a legjobb kovácsok az egész földkerekségen a kíváló anyaghasználat és precíz munkavégzés miatt','1.Fa keresése a markolathoz 2.Fa megmunkálása','Solo','Tomi...', 4),
('A fejsze fejének készítése','Mindenki tudja,hogy a törpök a legjobb kovácsok az egész földkerekségen a kíváló anyaghasználat és precíz munkavégzés miatt','1.Jó minőségű fém bányászása 2.A fém megmunkálása','Solo','Rengeteg haszontalan baszki!', 4);



INSERT INTO students (course_id, "name",  nickname,  email,  starting_date,  city,  hobby)
VALUES 
(1,'Szürke Gandalf', 'Gandalf', 'gandalf@ittugysejosszat.hu', '3001-11-10', 'Valinor', 'gondolkodás'),
(1,'Barna Radagast', 'Radagast', 'radagast@barna.hu', '3001-11-10', 'Bakacsinerdő', 'természetjárás'),
(1,'Fehér Saruman', 'Saruman', 'saruman@szandalember.hu', '3001-11-10', 'Vasudvard', 'hadsereg építése'),
(2,'Zöldlomb Legolas', 'Legolas', 'legolas@zold.hu', '3001-12-11', 'Bakacsinerdő', 'vadászat'),
(2,'Arwen Undómiel', 'Arwen', 'arwen@aragorn.hu', '3001-12-11', 'Völgyzugoly', 'lovaglás'),
(2,'Elrond Earendiel és Elwing fia', 'Elrond úr', 'elrond@zuglo@.hu', '3001-12-11', 'Völgyzugoly', 'olvasás'),
(3,'Zsákos Frodó', 'Frodó', 'frodo@gyuru.hu', '3001-10-25', 'Hobbitfalva', 'kirándulás'),
(3,'Csavardi Samu', 'Samu', 'samu@kerteszet.hu', '3001-10-25', 'Hobbitfalva', 'kertészkedés'),
(3,'Tuk Peregrin', 'Pippin', 'pippin@pipa.hu', '3001-10-25', 'Tukföld', 'pipázás'),
(4,'Glóin fia Gimli', 'Gimli', 'gimli@favago.hu', '3001-09-30', 'Imladris', 'vadászat'),
(4,'Fundin fia Balin', 'Balin', 'balin@moria.hu', '3001-09-30', 'Mória', 'bányászat'),
(4,'Fundin második fia Dwalin', 'Dwalin', 'dwalin@amasodik.hu', '3001-09-30', 'Erebor', 'mesélés');



INSERT INTO review (projects_id, students_id, reviewer_id, score, "date", comment)
VALUES 
(1,1,2,5,'3001-12-10','kimagasló eredmény'),
(1,2,3,4,'3001-12-10','csak így tovább'),
(1,3,1,3,'3001-12-10','no comment'),
(2,1,3,4,'3001-12-10','csak így tovább'),
(2,2,1,4,'3001-12-10','csak így tovább'),
(2,3,2,5,'3001-12-10','kimagasló eredmény'),

(3,4,5,3,'3002-01-01','no comment'),
(3,5,6,4,'3002-01-01','csak így tovább'),
(3,6,4,3,'3002-01-01','no comment'),
(4,4,6,3,'3002-01-01','no comment'),
(4,5,4,3,'3002-01-01','no comment'),
(4,6,5,3,'3002-01-01','no comment'),

(5,7,9,5,'3002-01-15','kimagasló eredmény'),
(5,8,7,5,'3002-01-15','kimagasló eredmény'),
(5,9,8,4,'3002-01-15','csak így tovább'),
(6,7,8,4,'3002-01-15','csak így tovább'),
(6,8,9,5,'3002-01-15','kimagasló eredmény'),
(6,9,7,5,'3002-01-15','kimagasló eredmény'),

(7,10,12,4,'3002-01-30','csak így tovább'),
(7,11,10,3,'3002-01-30','no comment'),
(7,12,11,4,'3002-01-30','csak így tovább'),
(8,10,11,3,'3002-01-30','no comment'),
(8,11,12,3,'3002-01-30','no comment'),
(8,12,10,2,'3002-01-30','legalább görbül');

#####

SELECT * FROM course;
SELECT * FROM projects;
SELECT * FROM students;
SELECT * FROM review;

#####4


UPDATE review
SET score = NULL
WHERE projects_id = 1 AND students_id = 1;







#####5a


SELECT course_name AS kurzus, project_name AS tananyag
FROM projects
INNER JOIN course ON projects.course_id = course.course_id;



#####5b

SELECT project_name AS projektek, "description" AS "rövid leírás", task AS feladat, form_type AS típus, background_mat AS "hasznos linkek" FROM projects;






#####5c

SELECT course_name AS kurzus, "name" AS diák, nickname AS becenév, email, to_char(students.starting_date, 'MON-DD-YYYY') AS "beiratkozási dátum", city AS város, hobby AS hobbi
FROM course
INNER JOIN students
ON course.course_id = students.course_id; 






#####5d 



SELECT project_name AS projekt, "name" AS diák, (SELECT "name" FROM students WHERE student_id = reviewer_id) AS értékelő,  score AS eredmény, to_char("date", 'Mon-dd-YYYY') AS dátum, comment AS megjegyzés 
FROM review
INNER JOIN students ON review.students_id = students.student_id
INNER JOIN projects ON review.projects_id = projects.project_id;




#####5e



SELECT "name" AS diák, ROUND(AVG(score),2) AS "átlag eredmény",
CASE 
WHEN AVG(score) > 3 THEN 'haladó'
ELSE 'mérsékelten haladó' END 
AS teljesítés
FROM review
INNER JOIN students ON review.students_id = students.student_id
GROUP BY students.name;



#####5f

SELECT "name" AS diák, SUM(score) AS "összesített eredmény"
FROM review
INNER JOIN students ON review.students_id = students.student_id
GROUP BY students.name
ORDER BY "összesített eredmény" DESC
LIMIT 3;






