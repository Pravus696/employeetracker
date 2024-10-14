// necessary imports to run application
import express from 'express';
import { pool, connectToDb } from './connection.js';
import inquirer from 'inquirer';
import figlet from 'figlet';
import 'console.table';

// connect to the database
await connectToDb(pool);

const PORT = process.env.PORT || 3000;
const app = express();

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

//banner for the application
console.clear();

figlet.text('Employee\nTracking System', {
    font: 'Standard',
    horizontalLayout: 'default',
    verticalLayout: 'default',
    width: 80,
    whitespaceBreak: true
}, function(err, data) {
    if (err) {
        console.log('Something went wrong...');
        console.dir(err);
        return;
    }
    
    // Create the border
    const lines = data.split('\n');
    const maxLength = Math.max(...lines.map((line) => line.length));
    const borderTop = '=' + '='.repeat(maxLength + 2) + '=';
    const borderBottom = borderTop;
    
    // Print the banner with border
    console.log(borderTop);
    lines.forEach((line) => {
        console.log(`| ${line.padEnd(maxLength)} |`);
    });
    console.log(borderBottom);
    startApp(pool);
});

async function startApp(pool) {
// initial prompt to user (view all departments, view all roles, view all employees, add a department, add a role, add an employee, and update an employee role)
pool = await inquirer.prompt([
    {
        type: 'list',
        message: 'What would you like to do?',
        name: 'action',
        choices: [
            'View all departments',
            'View all roles',
            'View all employees',
            'Add a department',
            'Add a role',
            'Add an employee',
            'Update an employee role',
            'Exit'
        ]
    }
]);

    // switch statement to handle user input
    switch (pool.action) {
        case 'View all departments':
            viewDepartments();
            break;
        case 'View all roles':
            viewRoles();
            break;
        case 'View all employees':
            viewEmployees();
            break;
        case 'Add a department':
            addDepartment();
            break;
        case 'Add a role':
            addRole();
            break;
        case 'Add an employee':
            addEmployee();
            break;
        case 'Update an employee role':
            updateEmployeeRole();
            break;
        case 'Exit':
            pool.end();
            break;
    }
};

// function to view all departments
async function viewDepartments() {
    const res = await pool.query('SELECT * FROM department');
    console.table(res.rows);
}
// function to view roles
async function viewRoles() {
    const res = await pool.query('SELECT role.id, role.title, role.salary, department.name AS department FROM role JOIN department ON role.department_id = department.id');
    console.table(res.rows);
}
// function to view employees
async function viewEmployees() {
    const res = await client.query('SELECT employee.id, employee.first_name, employee.last_name, role.title, department.name AS department, role.salary, manager.first_name AS manager_first_name, manager.last_name AS manager_last_name FROM employee JOIN role ON employee.role_id = role.id JOIN department ON role.department_id = department.id LEFT JOIN employee AS manager ON employee.manager_id = manager.id');
    console.table(res.rows);
}
// function to add a department
async function addDepartment() {
    const { name } = await inquirer.prompt([
        { type: 'input', name: 'name', message: 'Enter department name:' }
    ]);
    await pool.query('INSERT INTO department (name) VALUES ($1)', [name]);
    console.log('Department added successfully');
}
// function to add a role
async function addRole() {
    const departments = await pool.query('SELECT id, name FROM department');
    const departmentChoices = departments.rows.map((dept) => ({ name: dept.name, value: dept.id }));
    const answers = await inquirer.prompt([
        { type: 'input', name: 'title', message: 'Enter role title:' },
        { type: 'input', name: 'salary', message: 'Enter role salary:' },
        { type: 'list', name: 'department_id', message: 'Select department:', choices: departmentChoices }
    ]);
    await pool.query('INSERT INTO role (title, salary, department_id) VALUES ($1, $2, $3)', [answers.title, answers.salary, answers.department_id]);
    console.log('Role added successfully');
}
// function to add an employee
async function addEmployee() {
    const roles = await pool.query('SELECT id, title FROM role');
    const roleChoices = roles.rows.map((role) => ({ name: role.title, value: role.id }));
    const employees = await pool.query('SELECT id, first_name, last_name FROM employee');
    const managerChoices = employees.rows.map((emp) => ({ name: `${emp.first_name} ${emp.last_name}`, value: emp.id }));
    managerChoices.unshift({ name: 'None', value: null });
    const answers = await inquirer.prompt([
        { type: 'input', name: 'first_name', message: 'Enter first name:' },
        { type: 'input', name: 'last_name', message: 'Enter last name:' },
        { type: 'list', name: 'role_id', message: 'Select role:', choices: roleChoices },
        { type: 'list', name: 'manager_id', message: 'Select manager:', choices: managerChoices }
    ]);
    await pool.query('INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ($1, $2, $3, $4)', [answers.first_name, answers.last_name, answers.role_id, answers.manager_id]);
    console.log('Employee added successfully');
}
// function to update an employee role
async function updateEmployeeRole() {
    const employees = await client.query('SELECT id, first_name, last_name FROM employee');
    const employeeChoices = employees.rows.map((emp) => ({ name: `${emp.first_name} ${emp.last_name}`, value: emp.id }));
    const roles = await client.query('SELECT id, title FROM role');
    const roleChoices = roles.rows.map(role => ({ name: role.title, value: role.id }));
    const answers = await inquirer.prompt([
        { type: 'list', name: 'employee_id', message: 'Select employee:', choices: employeeChoices },
        { type: 'list', name: 'role_id', message: 'Select new role:', choices: roleChoices }
    ]);
    await pool.query('UPDATE employee SET role_id = $1 WHERE id = $2', [answers.role_id, answers.employee_id]);
    console.log('Employee role updated successfully');
}


app.use((req, res) => {
    res.status(404).end();
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});