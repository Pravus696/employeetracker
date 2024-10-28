-- drop database if employeetracker_db exists --
DROP DATABASE IF EXISTS employeetracker_db;
-- create database employeetracker_db --
CREATE DATABASE employeetracker_db;

-- makes all following code affect the employeetracker_db database --
\c employeetracker_db;

-- drop table for department --
DROP TABLE IF EXISTS department;

--create table for department --
CREATE TABLE department (
    name VARCHAR(30) UNIQUE NOT NULL
);

-- drop table for role --
DROP TABLE IF EXISTS role;

-- create table for role --
CREATE TABLE role (
    title VARCHAR(50) UNIQUE NOT NULL,
    salary INTEGER NOT NULL,
    department VARCHAR(30) NOT NULL
);
-- drop table for employee --
DROP TABLE IF EXISTS employee;

-- create table for employee --
CREATE TABLE employee (
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role VARCHAR(50) NOT NULL,
    manager VARCHAR(30),
    dept VARCHAR(30) NOT NULL
);
