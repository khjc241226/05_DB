-- 11번
-- 학과 별 휴학생 수를 파악하고자 한다.
-- 학과 번호와 휴학생 수를 조회하는 SQL을 작성하시오.
SELECT 
	DEPARTMENT_NO AS "학과코드명",
	-- COUNT(컬럼명|함수식) : 컬럼에 값에 몇개 있는가 카운트(NULL 제외)
	COUNT(DECODE(ABSENCE_YN,'Y','휴학생')) AS "휴학생 수",
	SUM(DECODE(ABSENCE_YN,'Y',1, 'N', 0)) AS "휴학생 수"
FROM
	TB_STUDENT 
GROUP BY
	DEPARTMENT_NO 
ORDER BY
	DEPARTMENT_NO ASC;


-- 13번
-- 학번이 A112113인 김고운 학생의 학점을 조회하려고 한다.
-- 년도, 학기 별 평점과 년도 별 누적 평점, 총 평점을 구하는 SQL을 작성하시오.
-- (단, 평점은 소수점 1자리까지만 반올림하여 표시한다.)
SELECT
	NVL(SUBSTR(TERM_NO,1,4), ' ') AS "년도",
	NVL(SUBSTR(TERM_NO,5),   ' ') AS "학기",
	ROUND(AVG(POINT), 1) AS "평점"
FROM
	TB_GRADE 
WHERE 
	STUDENT_NO = 'A112113'
GROUP BY
	ROLLUP(SUBSTR(TERM_NO,1,4), SUBSTR(TERM_NO,5))
ORDER BY 
	SUBSTR(TERM_NO,1,4) ASC;








