------------------------------------------------------------------
-- 매출관리
------------------------------------------------------------------
-- dummys
INSERT INTO SP_ORDER VALUES(SP_ORDER_SEQ.nextval,'김김김','010-2017-7619','11111','서울시종로구','206호',15000,SYSDATE,'배송중','환불신청','aaa');

SELECT * FROM SP_ORDER;

-- 일별 판매 숫자
SELECT COUNT(*) FROM (SELECT * FROM SP_ORDER
    WHERE TO_CHAR(OTIME,'YYYYMMDD') = '20200422');
    
SELECT * FROM SP_ORDER
    WHERE TO_CHAR(OTIME,'YYYYMMDD') = TO_CHAR(SYSDATE,'YYYYMMDD');


-- 월별 판매 숫자
SELECT COUNT(*) FROM (SELECT * FROM SP_ORDER WHERE TO_CHAR(OTIME, 'YYYYMM')  = '202004');

SELECT TRUNC(OTIME, 'DD'), TO_CHAR(OTIME, 'YYMM') FROM SP_ORDER;
SELECT * FROM SP_ORDER;
SELECT * FROM ORDER_DETAIL;
SELECT * FROM PRODUCT_OPTION;

SELECT * FROM SP_ORDER SP, ORDER_DETAIL OD, PRODUCT_OPTION PO WHERE SP.OCODE=OD.OCODE AND OD.POCODE=PO.POCODE;

-- 연도별 판매 숫자
SELECT COUNT(*) FROM (SELECT * FROM SP_ORDER WHERE TO_CHAR(OTIME, 'YYYY')  = '2020');

-- 분기별 판매 목록

-- 상품별 판매 목록

-- TEST
SELECT TO_CHAR( TO_DATE('20200428', 'YYYYMMDD') + LEVEL , 'YYYY-MM-DD') DTE,
    TO_CHAR( TO_DATE('20200428', 'YYYYMMDD') + LEVEL , 'DAY') DAY,
    TO_CHAR( TO_DATE('20200428', 'YYYYMMDD') + LEVEL , 'DY') DY,
    TO_CHAR( TO_DATE('20200428', 'YYYYMMDD') + LEVEL , 'D') D
FROM DUAL
CONNECT BY LEVEL <= 7;





------------------------------------------------------------------
-- 배송지 관리
------------------------------------------------------------------
-- 배송지 목록 가져오기
SELECT A.*, C.CNAME FROM ADDRLIST A, CUSTOMER C WHERE A.CID = C.CID AND C.CID = 'aaa';

SELECT * FROM CUSTOMER;

-- 기본 배송지 선택 리스트로 가져오기
SELECT * FROM ADDRLIST WHERE CID = 'aaa' ORDER BY ADDRNUM DESC, ADDRCODE ASC;

-- 기본 배송지로 설정하기
UPDATE ADDRLIST SET ADDRNUM = 1 WHERE ADDRCODE = 2;

-- 기존에 기본 배송지로 선택한게 있다면 기본배송지에서 삭제하기
UPDATE ADDRLIST SET ADDRNUM = 0 WHERE ADDRCODE != 2;

-- 배송지 추가
INSERT INTO ADDRLIST VALUES(ADDRLIST_SEQ.nextval, 0, '33333', '의정부시', '3-33번지', 'aaa');

-- 배송지 제거
DELETE FROM ADDRLIST WHERE ADDRCODE = 3;



WITH T AS (
    SELECT  '1' IDX, '네이버' COMPANY, '2015' YEAR, '04' MON, '김군' NAME FROM DUAL UNION ALL
    SELECT  '2', '다음넷', '2015', '04', '철수' FROM DUAL UNION ALL
    SELECT  '3', '다음넷', '2015', '05', '김군' FROM DUAL UNION ALL
    SELECT  '4', '다음넷', '2015', '05', '철수' FROM DUAL UNION ALL
    SELECT  '5', '구글넷', '2015', '05', '수지' FROM DUAL UNION ALL
    SELECT  '6', '구글넷', '2015', '05', '수지' FROM DUAL UNION ALL
    SELECT  '7', '구글넷', '2015', '06', '김군' FROM DUAL UNION ALL
    SELECT  '8', '네이버', '2015', '06', '김군' FROM DUAL UNION ALL
    SELECT  '9', '네이버', '2015', '06', '수지' FROM DUAL UNION ALL
    SELECT  '10', '구글넷', '2015', '06', '수지' FROM DUAL UNION ALL
    SELECT  '11', '네이버', '2015', '07', '철수' FROM DUAL UNION ALL
    SELECT  '12', '네이버', '2015', '07', '김군' FROM DUAL 
)
SELECT  NAME
        , COMPANY
        , COUNT(DECODE(MON, '01', 1)) AS "1월"
        , COUNT(DECODE(MON, '02', 1)) AS "2월"
        , COUNT(DECODE(MON, '03', 1)) AS "3월"
        , COUNT(DECODE(MON, '04', 1)) AS "4월"
        , COUNT(DECODE(MON, '05', 1)) AS "5월"
        , COUNT(DECODE(MON, '06', 1)) AS "6월"
        , COUNT(DECODE(MON, '07', 1)) AS "7월"
        , COUNT(DECODE(MON, '08', 1)) AS "8월"
        , COUNT(DECODE(MON, '09', 1)) AS "9월"
        , COUNT(DECODE(MON, '10', 1)) AS "10월"
        , COUNT(DECODE(MON, '11', 1)) AS "11월"
        , COUNT(DECODE(MON, '12', 1)) AS "12월"
        , COUNT(COMPANY) AS "누계"
FROM    T
WHERE   NAME='철수'
GROUP BY NAME, COMPANY;

DROP SEQUENCE CTEST_SEQ;
DROP TABLE CTEST;
CREATE SEQUENCE CTEST_SEQ MAXVALUE 99999999999999999999 NOCACHE NOCYCLE;
CREATE TABLE CTEST (
	CID         VARCHAR2(20) NOT NULL,  /* 고객아이디 */
	CPW         VARCHAR2(20) NOT NULL,  /* 고객비번 */
	CNAME       VARCHAR2(20) NOT NULL,  /* 고객이름 */
    CPROVIDER   VARCHAR2(20),           /* 소셜로그인구분 */
    CPROVID     VARCHAR2(50),           /* 소셜로그인아이디 */
	CADDRNUM    VARCHAR2(5)  NOT NULL,  /* 기본주소번호 */
	CEMAIL      VARCHAR2(30) NOT NULL,  /* 메일 */
	CTEL        VARCHAR2(20) NOT NULL,  /* 고객전화 */
	CRDATE      DATE DEFAULT SYSDATE,   /* 가입날짜 */
	CBIRTH      DATE NOT NULL,          /* 고객생일 */
    CPOINT      NUMBER(10),             /* 고객포인트 */
	GCODE       VARCHAR2(1) NOT NULL    /* 등급코드 */
    
);




