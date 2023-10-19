/****** Script de consultas para teste  ******/

-- 1) Total de Dependentes por funcion�rio
SELECT 
	Ssn as 'ID do Funcion�rio', 
	count(Essn) as 'Total de Dependentes'
FROM employee e, dependent d 
WHERE (e.Ssn = d.Essn) GROUP BY Ssn;

-- 2) Data de Nascimento e Endere�o de John B Smith
SELECT 
	Bdate as 'Data de Nascimento', 
	Address as 'Endere�o'
FROM employee
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

-- 3) Informa��es do departamento Research
SELECT 
	* 
FROM departament 
WHERE Dname = 'Research';

-- 4) Nome Completo e Endere�o do departamento Research 
SELECT 
	concat(Fname, ' ', Minit, ' ', Lname) as Nome, 
	Address as Endere�o
FROM employee, departament
WHERE Dname = 'Research' AND Dnumber = Dno;

-- 5) Informa��es dos departamentos e respectivos gerentes
SELECT 
	Dname as 'Local do Depto', 
	Mgr_ssn as 'Id do Gerente',
	concat(Fname, ' ', Minit, ' ', Lname) as 'Nome do Gerente' 
FROM departament d, dept_locations l, employee e
WHERE d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;

-- 6) Informa��es dos departamentos e projetos localizados em Stafford
SELECT 
	Pnumber as 'ID do Produto', 
	Pname as 'Nome do Produto',
	Mgr_ssn as 'ID do Gerente',
	concat(Fname, ' ', Minit, ' ', Lname) as 'Nome do Gerente',
	Mgr_start_date as 'Admissional do Gerente',
	Dnumber as 'ID do Depto',
	Dname as 'Local do Depto', 
	Dept_create_date as 'Cria��o do Depto'
FROM project, departament, employee
WHERE Dnum = Dnumber AND Mgr_ssn = Ssn AND
Plocation = 'Stafford';

-- 7) Recolhimento do INSS de cada funcion�rio
SELECT 
	concat(Fname, ' ', Minit, ' ', Lname) as Nome, 
	Salary as Salario, 
	Salary * 0.11 as INSS 
FROM employee;