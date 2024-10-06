-- inserting data to department table --
INSERT INTO department (id, name) VALUES
(1, 'Engineering'),
(2, 'Finance'),
(3, 'Legal'),
(4, 'Sales'),
(5, 'IT'),
(6, 'Marketing'),
(7, 'Human Resources'),
(8, 'Customer Service'),
(9, 'Research and Development'),
(10, 'Quality Assurance')
ON CONFLICT (id, name) DO NOTHING;

-- inserting data to role table --
INSERT INTO role (id, title, salary, department_id) VALUES
(1, 'Software Engineer', 100000, 1),
(2, 'Data Analyst', 80000, 2),
(3, 'Lawyer', 120000, 3),
(4, 'Sales Manager', 150000, 4),
(5, 'IT Manager', 130000, 5),
(6, 'Marketing Manager', 140000, 6),
(7, 'HR Manager', 110000, 7),
(8, 'Customer Service Manager', 100000, 8),
(9, 'Research and Development Manager', 120000, 9),
(10, 'Quality Assurance Manager', 110000, 10),
(12, 'Sales Associate', 120000, 4),
(13, 'IT Associate', 90000, 5),
(14, 'Marketing Associate', 125000, 6),
(15, 'HR Associate', 100000, 7),
(16, 'Customer Service Associate', 80000, 8),
(17, 'Research and Development Associate', 90000, 9),
(18, 'Quality Assurance Associate', 90000, 10)
ON CONFLICT (id, title, salary, department_id) DO NOTHING;

-- inserting data to employee table --
INSERT INTO employee (id, first_name, last_name, role_id, manager_id) VALUES
(1, 'John', 'Doe', 1, 5),
(2, 'Jane', 'Doe', 2, 6),
(3, 'Jack', 'Doe', 3, 7),
(4, 'Jill', 'Doe', 4, 8),
(5, 'James', 'Doe', 5, 9),
(6, 'Jenny', 'Doe', 6, 10),
(7, 'Jared', 'Doe', 7, 11),
(8, 'Jasmine', 'Doe', 8, 12),
(9, 'Jasper', 'Doe', 9, 13),
(10, 'Jade', 'Doe', 10, 14),
(11, 'Jax', 'Doe', 12, 15),
(12, 'Jade', 'Doe', 13, 16),
(13, 'Jax', 'Doe', 14, 17),
(14, 'Jade', 'Doe', 15, 18),
(15, 'Jax', 'Doe', 16, 19),
(16, 'Jade', 'Doe', 17, 20),
(17, 'Jax', 'Doe', 18, 21)
ON CONFLICT (id, first_name, last_name, role_id, manager_id) DO NOTHING;

