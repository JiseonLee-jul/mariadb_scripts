create table test_part_list
(id int not null,
 email varchar(30),
 job_grade int not null)
 partition by list (job_grade)
(partition p_list_a values in (0),
 partition p_list_a values in (1,2),
 partition p_list_a values in (3,4,5),
 partition p_list_a values in (6,7,8,9));