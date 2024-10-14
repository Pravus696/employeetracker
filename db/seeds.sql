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
ON CONFLICT (name) DO NOTHING;

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
(9, 'Research & Development Manager', 120000, 9),
(10, 'Quality Assurance Manager', 110000, 10),
(12, 'Sales Associate', 120000, 4),
(13, 'IT Associate', 90000, 5),
(14, 'Marketing Associate', 125000, 6),
(15, 'HR Associate', 100000, 7),
(16, 'Customer Service Associate', 80000, 8),
(17, 'Research & Development Associate', 90000, 9),
(18, 'Quality Assurance Associate', 90000, 10)
ON CONFLICT (title) DO NOTHING;

-- inserting data to employee table --
INSERT INTO employee (id, first_name, last_name, role_id, manager_id) VALUES
(1, 'John', 'Doe', 1, 5),
(2, 'Jane', 'Doe', 2, 5),
(3, 'Jack', 'Doe', 3, 7),
(4, 'Jill', 'Doe', 4, 6),
(5, 'James', 'Doe', 5, 9),
(6, 'Jenny', 'Doe', 6, 10),
(7, 'Jared', 'Doe', 7, 11),
(8, 'Jasmine', 'Doe', 8, 6),
(9, 'Jasper', 'Doe', 9, 13),
(10, 'Jade', 'Doe', 14, 6),
(11, 'Jax', 'Doe', 12, 4),
(12, 'Jade', 'Doe', 13, 5),
(13, 'Jax', 'Doe', 14, 6),
(14, 'Jade', 'Doe', 15, 7),
(15, 'Jax', 'Doe', 16, 8),
(16, 'Jade', 'Doe', 17, 9),
(17, 'Jax', 'Doe', 18, 10)
ON CONFLICT (id) DO NOTHING;

-- inserting data to manager table --
INSERT INTO manager (id, first_name, last_name, manager_id) VALUES
(4, 'Jill', 'Doe', 4),
(5, 'James', 'Doe', 5),
(6, 'Jenny', 'Doe', 6),
(7, 'Jared', 'Doe', 7),
(8, 'Jasmine', 'Doe', 8),
(9, 'Jasper', 'Doe', 9),
(10, 'Jade', 'Doe', 14)
ON CONFLICT (id) DO NOTHING;