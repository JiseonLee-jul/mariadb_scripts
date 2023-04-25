-- 테이블 생성하기
CREATE TABLE lookup (valnum INT, valtext VARCHAR(10));

INSERT INTO lookup
VALUES(0, ''),(1, '일'),(2, '이'),(3, '삼'),(4, '사'),(5, '오'),(6, '육'),(7, '칠'),(8, '팔'),(9, '구'),(10, '십'),
(11, '십일'),(12, '십이'),(13, '십삼'),(14, '십사'),(15, '십오'),(16, '십육'),(17, '십칠'),(18, '십팔'),(19, '십구'),(20, '이십'),
(21, '이십일'),(22, '이십이'),(23, '이십삼'),(24, '이십사'),(25, '이십오'),(26, '이십육'),(27, '이십칠'),(28, '이십팔'),(29, '이십구'),(30, '삼십'),
(31, '삼십일'),(32, '삼십이'),(33, '삼십삼'),(34, '삼십사'),(35, '삼십오'),(36, '삼십육'),(37, '삼십칠'),(38, '삼십팔'),(39, '삼십구'),(40, '사십'),
(41, '사십일'),(42, '사십이'),(43, '사십삼'),(44, '사십사'),(45, '사십오'),(46, '사십육'),(47, '사십칠'),(48, '사십팔'),(49, '사십구'),(50, '오십'),
(51, '오십일'),(52, '오십이'),(53, '오십삼'),(54, '오십사'),(55, '오십오'),(56, '오십육'),(57, '오십칠'),(58, '오십팔'),(59, '오십구'),(60, '오십'),
(61, '육십일'),(62, '육십이'),(63, '육십삼'),(64, '육십사'),(65, '육십오'),(66, '육십육'),(67, '육십칠'),(68, '육십팔'),(69, '육십구'),(70, '칠십'),
(71, '칠십일'),(72, '칠십이'),(73, '칠십삼'),(74, '칠십사'),(75, '칠십오'),(76, '칠십육'),(77, '칠십칠'),(78, '칠십팔'),(79, '칠십구'),(80, '팔십'),
(81, '팔십일'),(82, '팔십이'),(83, '팔십삼'),(84, '팔십사'),(85, '팔십오'),(86, '팔십육'),(87, '팔십칠'),(88, '팔십팔'),(89, '팔십구'),(90, '구십'),
(91, '구십일'),(92, '구십이'),(93, '구십삼'),(94, '구십사'),(95, '구십오'),(96, '구십육'),(97, '구십칠'),(98, '구십팔'),(99, '구십구'),(100, '백'),
(1000, '천'),(10000, '만');


-- 
SELECT d.dept_id "부서코드", i.valtext "부서코드 한글화"
FROM departments3 d INNER JOIN lookup i
ON d.dept_id = i.valnum;

SELECT d.dept_id "부서코드", i.valtext "부서코드 한글화"
FROM departments3 d INNER JOIN lookup i
ON MOD(d.dept_id, 100) = i.valnum;

SELECT 
    d.loc_id, 
    TRUNCATE(d.loc_id/100, 0) "백의 자리 숫자", 
    MOD(d.loc_id, 100) "일의 자리 숫자"
FROM departments3 d;



SELECT 
    d.loc_id, 
    i.valnum "백의 자리 숫자", 
    i.valtext "백의 자리 숫자 한글화"
FROM departments3 d INNER JOIN lookup i
ON TRUNCATE(d.loc_id/100, 0) = i.valnum;

SELECT 
    d.loc_id, 
    i.valtext "백의 자리 숫자 한글화", 
    j.valtext "일의 자리 숫자 한글화"
FROM departments3 d INNER JOIN lookup i INNER JOIN lookup j
ON TRUNCATE(d.loc_id/100, 0) = i.valnum
AND TRUNCATE(MOD(d.loc_id, 100),0) = j.valnum;

SELECT 
    d.loc_id "지역코드", 
    CONCAT(i.valtext, CASE WHEN i.valnum = 0 THEN '' ELSE '백' END, j.valtext) "지역코드 한글화"
FROM departments3 d INNER JOIN lookup i INNER JOIN lookup j
ON TRUNCATE(d.loc_id/100, 0) = i.valnum
AND MOD(d.loc_id, 100) = j.valnum;

