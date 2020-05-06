------------------------------------------------------------------------------------------------------------------------------
-- STORE_QNA
------------------------------------------------------------------------------------------------------------------------------

-- SQCODE      VARCHAR2(20)  NOT NULL,         /* 글번호 */
-- SQTITLE     VARCHAR2(100) NOT NULL,         /* 제목 */
-- SQCONTENT   CLOB          NOT NULL,         /* 내용 */
-- SQRDATE     DATE          DEFAULT SYSDATE,  /* 작성시간 */
-- SQGROUP     NUMBER(7)     NOT NULL,         /* 원글 */
-- SQSTEP      NUMBER(7)     NOT NULL,         /* 글순서 */
-- SQINDENT    NUMBER(7)     NOT NULL,         /* 들여쓰기 */
-- SQHIT       NUMBER(7)     NOT NULL,         /* 조회수 */
-- MID         VARCHAR2(20),                   /* 마켓아이디 */
-- CID         VARCHAR2(20)                    /* 고객아이디 */

SELECT * FROM STORE_QNA;

-- 전체 글 목록 갯수 가져오기
SELECT COUNT(*) FROM STORE_QNA;

-- 글 목록 가져오기 (startrow, endrow)
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM STORE_QNA ORDER BY SQGROUP DESC, SQSTEP) A)
WHERE RN BETWEEN 1 AND 10;

SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT Q.*, C.CNAME, M.MNAME FROM STORE_QNA Q LEFT OUTER JOIN CUSTOMER C ON ( Q.CID = C.CID) LEFT OUTER JOIN MARKET M ON ( Q.MID = M.MID) ORDER BY SQGROUP DESC, SQSTEP) A)
WHERE RN BETWEEN 1 AND 10;

-- 상세글 보기 (bID로 dto 가져오기)
SELECT * FROM STORE_QNA WHERE SQCODE = '1';

SELECT Q.*, C.CNAME, M.MNAME
      FROM STORE_QNA Q
      LEFT OUTER JOIN CUSTOMER C
        ON ( Q.CID = C.CID)
        LEFT OUTER JOIN MARKET M
        ON ( Q.MID = M.MID)
        WHERE SQCODE = '1';

-- 원글 쓰기
INSERT INTO STORE_QNA(SQCODE, SQTITLE, SQCONTENT, MQRDATE, SQGROUP, SQSTEP, SQINDENT, SQHIT, MID, CID)
    VALUES (STORE_QNA_SEQ.nextval, '제목1', '본문', SYSDATE, STORE_QNA_SEQ.CURRVAL, 0, 0, 0, 'aaa', NULL);
    
INSERT INTO STORE_QNA(SQCODE, SQTITLE, SQCONTENT, MQRDATE, SQGROUP, SQSTEP, SQINDENT, SQHIT, MID, CID)
    VALUES (STORE_QNA_SEQ.nextval, '제목2', '본문2', SYSDATE, STORE_QNA_SEQ.CURRVAL, 0, 0, 0, 'bbb', NULL);    

-- 글 수정하기
UPDATE STORE_QNA SET 
        SQTITLE = '제목수정',
        SQCONTENT = '본문수정'
WHERE SQCODE=1;

-- 조회수 올리기
UPDATE STORE_QNA SET SQHIT = SQHIT + 1
WHERE SQCODE = 1;

-- 답변글 달기전 stepA
UPDATE STORE_QNA SET SQSTEP = SQSTEP +1 WHERE SQGROUP=2 AND SQSTEP >0;

-- 답변글 달기(SQCODE=2에 답변글 달기)
INSERT INTO STORE_QNA(SQCODE, SQTITLE, SQCONTENT, MQRDATE, SQGROUP, SQSTEP, SQINDENT, SQHIT, MID, CID)
    VALUES (STORE_QNA_SEQ.nextval, '답변', '글2첫답변', SYSDATE, 2, 1, 1, 0, NULL, 'admin');
    
INSERT INTO STORE_QNA(SQCODE, SQTITLE, SQCONTENT, MQRDATE, SQGROUP, SQSTEP, SQINDENT, SQHIT, MID, CID)
    VALUES (STORE_QNA_SEQ.nextval, '답변2', '글2첫답변2', SYSDATE, 2, 1, 1, 0, NULL, 'admin');

-- 글 삭제하기
DELETE FROM STORE_QNA WHERE SQCODE = '';

COMMIT;


















