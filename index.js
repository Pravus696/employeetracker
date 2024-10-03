// necessary imports to run application
import pg from 'pg';
import inquirer from 'inquirer';
import figlet from 'figlet';

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
    const maxLength = Math.max(...lines.map(line => line.length));
    const borderTop = '=' + '='.repeat(maxLength + 2) + '=';
    const borderBottom = borderTop;
    
    // Print the banner with border
    console.log(borderTop);
    lines.forEach(line => {
        console.log(`| ${line.padEnd(maxLength)} |`);
    });
    console.log(borderBottom);
});

// initial prompt to user (view all departments, view all roles, view all employees, add a department, add a role, add an employee, and update an employee role)
inquirer.prompt([
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
            'Update an employee role'
        ]
    }
]).then(({ action }) => {
    // switch statement to handle user input
    switch (action) {
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
    }
});

// function to view all departments
function viewDepartments() {
    // query database for all departments
    // display results to user
}
// function to view roles
function viewRoles() {
    // query database for all roles
    // display results to user
}
// function to view employees
function viewEmployees() {
    // query database for all employees
    // display results to user
}
// function to add a department
function addDepartment() {
    // prompt user for department name
    inquirer.prompt([
        {
            type: 'input',
            message: 'What is the name of the department?',
            name: 'name'
        }
    ]).then(({ name }) => {
        // insert department into database
        // display success message to user
    });
}
// function to add a role
function addRole() {
    // prompt user for role title, salary, and department
    inquirer.prompt([
        {
            type: 'input',
            message: 'What is the title of the role?',
            name: 'title'
        },
        {
            type: 'number',
            message: 'What is the salary of the role?',
            name: 'salary'
        },
        {
            type: 'input',
            message: 'What is the department of the role?',
            name: 'department'
        }
    ]).then(({ title, salary, department }) => {
        // insert role into database
        // display success message to user
    });
}
// function to add an employee
function addEmployee() {
    // prompt user for employee first name, last name, role, and manager
    inquirer.prompt([
        {
            type: 'input',
            message: 'What is the first name of the employee?',
            name: 'firstName'
        },
        {
            type: 'input',
            message: 'What is the last name of the employee?',
            name: 'lastName'
        },
        {
            type: 'input',
            message: 'What is the role of the employee?',
            name: 'role'
        },
        {
            type: 'input',
            message: 'Who is the manager of the employee?',
            name: 'manager'
        }
    ]).then(({ firstName, lastName, role, manager }) => {
        // insert employee into database
        // display success message to user
    });
}
// function to update an employee role
function updateEmployeeRole() {
    // prompt user for employee name and new role
    inquirer.prompt([
        {
            type: 'input',
            message: 'What is the name of the employee?',
            name: 'employee'
        },
        {
            type: 'input',
            message: 'What is the new role of the employee?',
            name: 'role'
        }
    ]).then(({ employee, role }) => {
        // update employee role in database
        // display success message to user
    }
}