
-- TWO-PHASE COMMIT
use External;
-- Create All Tables (Simulated Sites)
CREATE TABLE Coordinator(
    site VARCHAR(10),
    status VARCHAR(20)
);
CREATE TABLE Site1(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE Site2(
    emp_id INT PRIMARY KEY,
    name VARCHAR(50)
);
-- PHASE 1 – PREPARE PHASE
INSERT INTO Coordinator VALUES ('Site1', 'PREPARE');
INSERT INTO Coordinator VALUES ('Site2', 'PREPARE');
-- Participant response (We assume both say YES)
SELECT 'YES' AS Site1_Response;
SELECT 'YES' AS Site2_Response;
-- If a site wants to say NO:
SELECT 'NO' AS Site2_Response;

-- PHASE 2 – COMMIT PHASE
INSERT INTO Site1 VALUES(101, 'Naina');
-- insert same employee record at Site 2
INSERT INTO Site2 VALUES(101, 'Naina');
UPDATE Coordinator 
SET status = 'COMMIT'
WHERE site IN ('Site1','Site2');

ALTER TABLE Coordinator
ADD PRIMARY KEY (site);
-- final output
UPDATE Coordinator
SET status = 'COMMIT'
WHERE site IN ('Site1','Site2');







