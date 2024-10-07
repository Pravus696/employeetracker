-- drop database if employeetracker_db exists --
DROP DATABASE IF EXISTS employeetracker_db;
-- create database employeetracker_db --
CREATE DATABASE employeetracker_db;

-- makes all following code affect the employeetracker_db database --
\c employeetracker_db;

--create table for department --
CREATE TABLE department (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL
);

-- create table for role --
CREATE TABLE role (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) UNIQUE NOT NULL,
    salary DECIMAL NOT NULL,
    department_id INTEGER NOT NULL
);

-- create table for employee --
CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    role_id INTEGER NOT NULL,
    manager_id INTEGER
);