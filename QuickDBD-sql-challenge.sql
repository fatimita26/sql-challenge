
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yvGiEA
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Department" (
    "dept_no" VARCHAR(10)   NOT NULL,
    "dept_name" VARCHAR(250)   NOT NULL,
    "last_updated" timestamp default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Department_employee" (
    "ID" SERIAL   NOT NULL,
	"emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    "last_updated" TIMESTAMP  default localtimestamp    NOT NULL,
    CONSTRAINT "pk_Department_employee" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR(10)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(250)   NOT NULL,
    "last_name" VARCHAR(250)   NOT NULL,
    "sex" VARCHAR(20)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    "last_updated" TIMESTAMP  default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Managers" (
    "ID" SERIAL   NOT NULL,
    "dept_no" VARCHAR(10)   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "last_updated" TIMESTAMP   default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Managers" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Salaries" (
    "ID" SERIAL   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    "salary" FLOAT   NOT NULL,
    "last_updated" TIMESTAMP   default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(100)   NOT NULL,
    "last_updated" TIMESTAMP   default localtimestamp  NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "Department_employee" ADD CONSTRAINT "fk_Department_employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Department_employee" ADD CONSTRAINT "fk_Department_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");


