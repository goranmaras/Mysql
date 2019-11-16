drop database if exists companydb;
create database companydb;
use companydb;

create table employee(
    emp_id int primary key ,
    first_name varchar(50) ,
    last_name varchar(50) ,
    birth_date date,
    sex varchar(1) ,
    salary int ,
    super_id int ,
    branch_id int 
);

create table branch(
    branch_id int primary key ,
    branch_name varchar(50) ,
    mgr_id int,
    mgr_start_date date,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET null
);

create table client(
    client_id int primary key ,
    client_name varchar(50) ,
    branch_id int,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

create table works_with(
    emp_id int ,
    client_id int ,
    total_sales int,
    PRIMARY KEY(emp_id,client_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

create table branchSupplier(
    branch_id int,
    supplier_name varchar(50),
    supply_type varchar(50),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;
--INSERTING VALUES-----
--CORPORATE BRANCH---
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;
 
INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);
--SCRANTON BRANCH---
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 75000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 75000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 75000, 102, 2);
--STAMFROD BRANCH--
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

--OSTATAK DATABAZE (KOJI NEMA SPAJANJA PK I FK) SAMO PODATCI--
--Bracnsh SUplier--
INSERT INTO branchSupplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branchSupplier VALUES(2, 'Uni-Ball', 'Writing Utentils');
INSERT INTO branchSupplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branchSupplier VALUES(2, 'J. T. Forms and Labels', 'Custom Paper');
INSERT INTO branchSupplier VALUES(3, 'Uni-Ball', 'Writing Utentils');
INSERT INTO branchSupplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branchSupplier VALUES(3, 'Stamford Labels', 'Custom Forms');
--Client--
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);
--Works WIth--
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 225000);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

--TRIGER FUNKCIJA, KUCA SE U CMDu--
create table trigger_test(
    my_trigger varchar(100)
);

DELIMITER $$ --(promena znaka za zavrsavanje naredbe iz ; u $$)
CREATE 
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        IF NEW.sex = 'M' THEN
            INSERT INTO trigger_test VALUES ('added male employee');
        ELSEIF NEW.sex = 'F' THEN
            INSERT INTO trigger_test VALUES ('added female employee');
        ELSE 
            INSERT INTO trigger_test VALUES ('added other employee');
        END IF;
    END $$
DELIMITER ;     
