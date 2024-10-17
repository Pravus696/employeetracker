-- inserting data to department table --
INSERT INTO department (name) VALUES
('Production'),
('Quality Assurance'),
('Marketing'),
('Human Resources'),
('Finance'),
('IT'),
('Administration')
ON CONFLICT (name) DO NOTHING;

-- inserting data to role table --
INSERT INTO role (title, salary, department) VALUES
('Production Lead', 100000, 'Production'),
('Quality Lead', 80000, 'Quality Assurance'),
('Marketing Lead', 90000, 'Marketing'),
('HR Manager', 70000, 'Human Resources'),
('Finance Manager', 95000, 'Finance'),
('IT Manager', 110000, 'IT'),
('CEO', 150000, 'Administration'),
('Production Associate', 50000, 'Production'),
('Quality Associate', 40000, 'Quality Assurance'),
('Marketing Associate', 45000, 'Marketing'),
('HR Associate', 60000, 'Human Resources'),
('Financial Expert', 85000, 'Finance'),
('IT Tech', 70000, 'IT')
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
