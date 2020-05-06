------------------------------------------------------------------------------------------------------------------------------
-- MARKET_QNA
------------------------------------------------------------------------------------------------------------------------------
-- MQCODE      VARCHAR2(20)    NOT NULL,        /* 글번호 */
-- MQTITLE     VARCHAR2(100)   NOT NULL,        /* 제목 */
-- MQCONTENT   CLOB            NOT NULL,        /* 내용 */
-- MQRDATE     DATE            DEFAULT SYSDATE, /* 작성시간 */
-- MQGROUP     NUMBER(7)       NOT NULL,        /* 원글 */
-- MQSTEP      NUMBER(7)       NOT NULL,        /* 글순서 */
-- MQINDENT    NUMBER(7)       NOT NULL,        /* 들여쓰기 */
-- MQHIT       NUMBER(7)       NOT NULL,        /* 조회수 */
-- MID         VARCHAR2(20) ,                   /* 마켓아이디 */
-- AID         VARCHAR2(20)                     /* 관리자ID */


SELECT * FROM MARKET_QNA;

-- 전체 글 목록 갯수 가져오기
SELECT COUNT(*) FROM MARKET_QNA;

-- 글 목록 가져오기 (startrow, endrow)
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM MARKET_QNA ORDER BY MQGROUP DESC, MQSTEP) A)
WHERE RN BETWEEN 1 AND 10;

SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT Q.*, M.MNAME FROM MARKET_QNA Q LEFT OUTER JOIN MARKET M ON ( Q.MID = M.MID) ORDER BY MQGROUP DESC, MQSTEP) A)
WHERE RN BETWEEN 1 AND 10;

-- 상세글 보기 (bID로 dto 가져오기)
SELECT * FROM MARKET_QNA WHERE MQCODE = '1';
SELECT Q.*, M.MNAME FROM MARKET_QNA Q LEFT OUTER JOIN MARKET M ON ( Q.MID = M.MID) WHERE MQCODE='1';

-- 원글 쓰기
INSERT INTO MARKET_QNA(MQCODE, MQTITLE, MQCONTENT, MQRDATE, MQGROUP, MQSTEP, MQINDENT, MQHIT, MID, AID)
    VALUES (MARKET_QNA_SEQ.nextval, '제목1', '본문', SYSDATE, MARKET_QNA_SEQ.CURRVAL, 0, 0, 0, 'aaa', NULL);
    
INSERT INTO MARKET_QNA(MQCODE, MQTITLE, MQCONTENT, MQRDATE, MQGROUP, MQSTEP, MQINDENT, MQHIT, MID, AID)
    VALUES (MARKET_QNA_SEQ.nextval, '제목2', '본문2', SYSDATE, MARKET_QNA_SEQ.CURRVAL, 0, 0, 0, 'bbb', NULL);    

-- 글 수정하기
UPDATE MARKET_QNA SET 
        MQTITLE = '제목수정',
        MQCONTENT = '본문수정'
WHERE MQCODE=1;

-- 조회수 올리기
UPDATE MARKET_QNA SET MQHIT = MQHIT + 1
WHERE MQCODE = 1;

-- 답변글 달기전 stepA
UPDATE MARKET_QNA SET MQSTEP = MQSTEP +1 WHERE MQGROUP=2 AND MQSTEP >0;

-- 답변글 달기(MQCODE=2에 답변글 달기)
INSERT INTO MARKET_QNA(MQCODE, MQTITLE, MQCONTENT, MQRDATE, MQGROUP, MQSTEP, MQINDENT, MQHIT, MID, AID)
    VALUES (MARKET_QNA_SEQ.nextval, '답변', '글2첫답변', SYSDATE, 2, 1, 1, 0, NULL, 'MID');
    
INSERT INTO MARKET_QNA(MQCODE, MQTITLE, MQCONTENT, MQRDATE, MQGROUP, MQSTEP, MQINDENT, MQHIT, MID, AID)
    VALUES (MARKET_QNA_SEQ.nextval, '답변2', '글2첫답변2', SYSDATE, 2, 1, 1, 0, NULL, 'MID');

-- 글 삭제하기
DELETE FROM MARKET_QNA WHERE MQCODE = '';

COMMIT;
