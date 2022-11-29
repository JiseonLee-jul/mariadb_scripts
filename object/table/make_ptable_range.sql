use test

create table test_part_range
(id varchar(50) not null,
 email varchar(50) not null,
 createdt datetime default current_timestamp,
 primary key(id, createdt))
 engine=innodb charset=utf8
 partition by range (to_days(createdt))
(partition p20200301 values less than
          (to_days('2020-03-02 00:00:00')),
 partition p20200302 values less than
          (to_days('2020-03-03 00:00:00')),
 partition p20200303 values less than
          (to_days('2020-03-04 00:00:00')),
 partition pmax values less than maxvalue);
