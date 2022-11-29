alter table test_part_range reorganize
partition pmax into 
(
    partition p20200304 values less than (to_days('2020-03-05 00:00:00')),
    partition pmax values less than maxvalue
);