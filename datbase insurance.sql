drop database insurance_db;
CREATE DATABASE insurance_db;
USE insurance_db;



CREATE TABLE PERSON (
    driver_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)
);

CREATE TABLE CAR (
    reg_num VARCHAR(15) PRIMARY KEY,
    model VARCHAR(30),
    year INT
);

CREATE TABLE ACCIDENT (
    report_num INT PRIMARY KEY,
    accident_date DATE,
    location VARCHAR(50)
);

CREATE TABLE OWNS (
    driver_id VARCHAR(10),
    reg_num VARCHAR(15),
    PRIMARY KEY (driver_id, reg_num),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (reg_num) REFERENCES CAR(reg_num)
);

CREATE TABLE PARTICIPATED (
    driver_id VARCHAR(10),
    reg_num VARCHAR(15),
    report_num INT,
    damage_amount INT,
    PRIMARY KEY (driver_id, reg_num, report_num),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (reg_num) REFERENCES CAR(reg_num),
    FOREIGN KEY (report_num) REFERENCES ACCIDENT(report_num)
);
SHOW TABLES;
-- PERSON
INSERT INTO PERSON VALUES
('D001', 'Ravi Kumar', 'Bangalore'),
('D002', 'Anita Sharma', 'Mysore'),
('D003', 'John Paul', 'Mangalore'),
('D004', 'Meena Rao', 'Hubli'),
('D005', 'Arjun Nair', 'Udupi');

-- CAR
INSERT INTO CAR VALUES
('KA01AB1234', 'Honda City', 2020),
('KA02CD5678', 'Hyundai i20', 2019),
('KA03EF9101', 'Maruti Swift', 2021),
('KA04GH1213', 'Tata Nexon', 2022),
('KA05IJ1415', 'Mahindra XUV', 2018);

-- ACCIDENT
INSERT INTO ACCIDENT VALUES
(10, '2023-05-12', 'MG Road'),
(11, '2023-08-21', 'Koramangala'),
(12, '2023-09-10', 'Indiranagar'),
(13, '2023-10-05', 'Whitefield'),
(14, '2023-11-01', 'Electronic City');

-- OWNS
INSERT INTO OWNS VALUES
('D001', 'KA01AB1234'),
('D002', 'KA02CD5678'),
('D003', 'KA03EF9101'),
('D004', 'KA04GH1213'),
('D005', 'KA05IJ1415');

-- PARTICIPATED
INSERT INTO PARTICIPATED VALUES
('D001', 'KA01AB1234', 10, 15000),
('D002', 'KA02CD5678', 11, 28000),
('D003', 'KA03EF9101', 12, 20000),
('D004', 'KA04GH1213', 13, 35000),
('D005', 'KA05IJ1415', 14, 18000);
SHOW TABLES;
USE insurance_db;
SELECT accident_date, location
FROM ACCIDENT;

UPDATE PARTICIPATED 
SET damage_amount = 25000
where reg_num = 'KA03EF9101' AND report_num = 12;

INSERT INTO ACCIDENT VALUES (15, '2024-01-20', 'Rajajinagar');
INSERT INTO PARTICIPATED VALUES ('D001', 'KA01AB1234', 15, 12000);

SELECT accident_date, location
FROM ACCIDENT;
SELECT DISTINCT driver_id
FROM PARTICIPATED
WHERE damage_amount >= 25000;

