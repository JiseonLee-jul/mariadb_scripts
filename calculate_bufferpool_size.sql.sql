SELECT
CEILING(Total_InnoDB_Bytes*1.6/POWER(1024,1)) AS "BUFFER_SIZE(KB)"
FROM
(
        SELECT SUM(data_length+index_length) Total_InnoDB_Bytes
        FROM information_schema.tables
                WHERE engine='InnoDB'
) AS T;