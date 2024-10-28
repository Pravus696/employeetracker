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

-- Alter the employee table to add the id column --
ALTER TABLE employee
ADD COLUMN id SERIAL PRIMARY KEY;

-- inserting data to employee table --
INSERT INTO employee (first_name, last_name, role, manager, dept) VALUES
('John', 'Doe', 'CEO', NULL, 'Administration'),
('Jane', 'Doe', 'HR Manager', 'John Doe', 'Human Resources'),
('John', 'Smith', 'Production Lead', 'John Doe', 'Production'),
('Jane', 'Smith', 'Quality Lead', 'John Doe', 'Quality Assurance'),
('John', 'Johnson', 'Marketing Lead', 'John Doe', 'Marketing'),
('Jane', 'Johnson', 'HR Associate', 'Jane Smith', 'Human Resources'),
('John', 'Williams', 'Finance Manager', 'John Doe', 'Finance'),
('Jane', 'Williams', 'IT Manager', 'Jane Johnson', 'IT'),
('John', 'Brown', 'Production Associate', 'John Smith', 'Production'),
('Jane', 'Brown', 'Financial Expert', 'Jane Williams', 'Finance'),
('John', 'Jones', 'Marketing Associate', 'John Johnson', 'Marketing'),
('Jane', 'Jones', 'HR Associate', 'Jane Doe', 'Human Resources'),
('John', 'Davis', 'Production Associate', 'John Smith', 'Production'),
('Jane', 'Davis', 'IT Tech', 'Jane Williams', 'IT')
ON CONFLICT (id) DO NOTHING;
