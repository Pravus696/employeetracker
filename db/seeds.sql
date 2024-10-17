-- inserting data to department table --
INSERT INTO department (id, name) VALUES
(1, 'Production'),
(2, 'Quality Assurance'),
(3, 'Marketing'),
(4, 'Human Resources'),
(5, 'Finance'),
(6, 'IT'),
(7, 'Administration')
ON CONFLICT (name) DO NOTHING;

-- inserting data to role table --
INSERT INTO role (id, title, salary, department) VALUES
(1, 'Production Lead', 100000, 1),
(2, 'Quality Lead', 80000, 2),
(3, 'Marketing Lead', 90000, 3),
(4, 'HR Manager', 70000, 4),
(5, 'Finance Manager', 95000, 5),
(6, 'IT Manager', 110000, 6),
(7, 'CEO', 150000, 7),
(8, 'Production Associate', 50000, 1),
(9, 'Quality Associate', 40000, 2),
(10, 'Marketing Associate', 45000, 3),
(11, 'HR Associate', 60000, 4),
(12, 'Financial Expert', 85000, 5),
(13, 'IT Tech', 70000, 6)
ON CONFLICT (title) DO NOTHING;

-- inserting data to employee table --
INSERT INTO employee (id, first_name, last_name, role, manager, dept) VALUES
(1, 'John', 'Doe', 'CEO', NULL, 'Administration'),
(2, 'Jane', 'Doe', 'HR Manager', 'John Doe', 'Human Resources'),
(3, 'John', 'Smith', 'Production Lead', 'John Doe', 'Production'),
(4, 'Jane', 'Smith', 'Quality Lead', 'John Doe', 'Quality Assurance'),
(5, 'John', 'Johnson', 'Marketing Lead', 'John Doe', 'Marketing'),
(6, 'Jane', 'Johnson', 'HR Associate', 'Jane Smith', 'Human Resources'),
(7, 'John', 'Williams', 'Finance Manager', 'John Doe', 'Finance'),
(8, 'Jane', 'Williams', 'IT Manager', 'Jane Johnson', 'IT'),
(9, 'John', 'Brown', 'Production Associate', 'John Smith', 'Production'),
(10, 'Jane', 'Brown', 'Financial Expert', 'Jane Williams', 'Finance'),
(11, 'John', 'Jones', 'Marketing Associate', 'John Johnson', 'Marketing'),
(12, 'Jane', 'Jones', 'HR Associate', 'Jane Doe', 'Human Resources'),
(13, 'John', 'Davis', 'Production Associate', 'John Smith', 'Production'),
(14, 'Jane', 'Davis', 'IT Tech', 'Jane Williams', 'IT')
ON CONFLICT (id) DO NOTHING;
