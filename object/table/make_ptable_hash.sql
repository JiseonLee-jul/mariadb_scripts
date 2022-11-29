create table test_part_hash
(id int not null,
 email varchar(30),
 job_grade int not null)
 partition by hash (job_grade)
partition 8;