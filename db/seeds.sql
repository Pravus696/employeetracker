-- inserting data to department table --
INSERT INTO department (id, name) VALUES
(1, 'Production'),
(2, 'Quality Assurance'),
(3, 'Marketing'),
(4, 'Human Resources'),
(5, 'Finance'),
(6, 'IT'),
(7, 'Administration'),
ON CONFLICT (name) DO NOTHING;

-- inserting data to role table --
INSERT INTO role (id, title, salary, department) VALUES
(1, 'Production Lead', 100000, 1).
(2, 'Quality Lead', 80000, 2),
(3, 'Marketing Lead', 90000, 3),
(4, 'HR Manager', 4),
(5, 'Finance Manager', 5),
(6, 'IT Manager', 6),
(7, 'CEO', 7),
(8, 'Production Associate', 50000, 1),
(9, 'Quality Associate', 40000, 2),
(10, 'Marketing Associate', 45000, 3),
(11, 'HR Associate', 4),
(12, 'Financial Expert', 5),
(13, 'IT Tech', 6)
ON CONFLICT (title) DO NOTHING;

-- inserting data to employee table --
INSERT INTO employee (id, first_name, last_name, role_id, manager) VALUES
(1, 'John', 'Doe', 7)
(2, 'Jane', 'Doe', 4, 'John Doe'),
(3, 'John', 'Smith', 1, 'John Doe'),
(4, 'Jane', 'Smith', 2, 'John Doe'),
(5, 'John', 'Johnson', 3, 'John Doe'),
(6, 'Jane', 'Johnson', 11, 'Jane Smith'),
(7, 'John', 'Williams', 5, 'John Doe'),
(8, 'Jane', 'Williams', 6, 'Jane Johnson'),
(9, 'John', 'Brown', 8, 'John Smith'),
(10, 'Jane', 'Brown', 12, 'Jane Williams'),
(11, 'John', 'Jones', 10, 'John Johnson'),
(12, 'Jane', 'Jones', 11, 'Jane Doe'),
(13, 'John', 'Davis', 8, 'John Smith'),
(14, 'Jane', 'Davis', 13, 'Jane Williams')
ON CONFLICT (id) DO NOTHING;
