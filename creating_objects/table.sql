USE database test;

create table employee
(
        EMP_NO int not null,
        EMP_CODE int not null,
        EMP_NM varchar(10) not null,
        CLSF varchar(10) not null,
        SEXDSTN varchar(10) not null,
        ECNY_YY_MT_DE varchar(20) not null,
        DEPT_CODE int not null
);