------------------------------------------------------------------------------------------------------------------------------
-- CUSTOMER_QNA
------------------------------------------------------------------------------------------------------------------------------
-- CQCODE      VARCHAR2(20)    NOT NULL,        /* 글번호 */
-- CQTITLE     VARCHAR2(100)   NOT NULL,        /* 제목 */
-- CQCONTENT   CLOB            NOT NULL,        /* 내용 */
-- CQRDATE     DATE            DEFAULT SYSDATE, /* 작성시간 */
-- CQGROUP     NUMBER(7)       NOT NULL,        /* 원글 */
-- CQSTEP      NUMBER(7)       NOT NULL,        /* 글순서 */
-- CQINDENT    NUMBER(7)       NOT NULL,        /* 들여쓰기 */
-- CQHIT       NUMBER(7)       NOT NULL,        /* 조회수 */
-- CID         VARCHAR2(20),                    /* 고객아이디 */
-- AID         VARCHAR2(20)                     /* 관리자ID */

SELECT * FROM CUSTOMER_QNA;

-- 전체 글 목록 갯수 가져오기
SELECT COUNT(*) FROM CUSTOMER_QNA;

-- 글 목록 가져오기 (startrow, endrow)
SELECT * FROM (SELECT ROWNUM RN, A.* 
    FROM (SELECT * FROM CUSTOMER_QNA ORDER BY CQGROUP DESC, CQSTEP) A)
WHERE RN BETWEEN 1 AND 10;

SELECT * FROM (SELECT ROWNUM RN, A.* 
    		FROM (SELECT Q.*, C.CNAME FROM CUSTOMER_QNA Q 
    				LEFT OUTER JOIN CUSTOMER C ON ( Q.CID = C.CID) 
    			ORDER BY CQGROUP DESC, CQSTEP) A)
		WHERE RN BETWEEN 1 AND 10;

-- 상세글 보기 (bID로 dto 가져오기)
SELECT * FROM CUSTOMER_QNA WHERE CQCODE = '1';

SELECT Q.*, C.CNAME FROM CUSTOMER_QNA Q LEFT OUTER JOIN CUSTOMER C ON ( Q.CID = C.CID) WHERE CQCODE = '1';

-- 원글 쓰기
INSERT INTO CUSTOMER_QNA(CQCODE, CQTITLE, CQCONTENT, CQRDATE, CQGROUP, CQSTEP, CQINDENT, CQHIT, CID, AID)
    VALUES (CUSTOMER_QNA_SEQ.nextval, '제목1', '본문', SYSDATE, CUSTOMER_QNA_SEQ.CURRVAL, 0, 0, 0, 'aaa', NULL);
    
INSERT INTO CUSTOMER_QNA(CQCODE, CQTITLE, CQCONTENT, CQRDATE, CQGROUP, CQSTEP, CQINDENT, CQHIT, CID, AID)
    VALUES (CUSTOMER_QNA_SEQ.nextval, '제목2', '본문2', SYSDATE, CUSTOMER_QNA_SEQ.CURRVAL, 0, 0, 0, 'bbb', NULL);    

-- 글 수정하기
UPDATE CUSTOMER_QNA SET 
        CQTITLE = '제목수정',
        CQCONTENT = '본문수정'
WHERE CQCODE=1;

-- 조회수 올리기
UPDATE CUSTOMER_QNA SET CQHIT = CQHIT + 1
WHERE CQCODE = 1;

-- 답변글 달기전 stepA
UPDATE CUSTOMER_QNA SET CQSTEP = CQSTEP +1 WHERE CQGROUP=2 AND CQSTEP >0;

-- 답변글 달기(CQCODE=2에 답변글 달기)
INSERT INTO CUSTOMER_QNA(CQCODE, CQTITLE, CQCONTENT, CQRDATE, CQGROUP, CQSTEP, CQINDENT, CQHIT, CID, AID)
    VALUES (CUSTOMER_QNA_SEQ.nextval, '답변', '글2첫답변', SYSDATE, 2, 1, 1, 0, NULL, 'admin');
    
INSERT INTO CUSTOMER_QNA(CQCODE, CQTITLE, CQCONTENT, CQRDATE, CQGROUP, CQSTEP, CQINDENT, CQHIT, CID, AID)
    VALUES (CUSTOMER_QNA_SEQ.nextval, '답변2', '글2첫답변2', SYSDATE, 2, 1, 1, 0, NULL, 'admin');

-- 글 삭제하기
DELETE FROM CUSTOMER_QNA WHERE CQCODE = '';

COMMIT;



