CREATE TABLE MARKET (
	MID     VARCHAR2(20) NOT NULL, /* 마켓아이디 */
	MPW     VARCHAR2(20) NOT NULL, /* 마켓비번 */
	MNAME   VARCHAR2(20) NOT NULL, /* 마켓명 */
	MTEL    VARCHAR2(20) NOT NULL, /* 마켓전번 */
	MPOST   VARCHAR2(10) NOT NULL, /* 마켓우편번호 */
	MADDR1  VARCHAR2(60) NOT NULL, /* 마켓주소1 */
	MADDR2  VARCHAR2(60) NOT NULL  /* 마켓주소2 */
);
SELECT * FROM MARKET;
INSERT INTO MARKET VALUES ('aaa','111','마켓컬리','010-8888-8888','18981','대구 달서구','서울 종로구');
INSERT INTO MARKET VALUES ('bbb','111','역전할맥','010-8888-8888','18981','대구 달서구','서울 종로구');
INSERT INTO MARKET VALUES ('ccc','111','어사출또','010-8888-8888','18981','대구 달서구','서울 종로구');
INSERT INTO MARKET VALUES ('ddd','111','하이포크','010-8888-8888','18981','대구 달서구','서울 종로구');
INSERT INTO MARKET VALUES ('eee','111','롯데리아','010-8888-8888','18981','대구 달서구','서울 종로구');
CREATE TABLE PRODUCT (
	PCODE VARCHAR2(20) NOT NULL, /* 상품코드 */
	PTITLE VARCHAR2(30) NOT NULL, /* 상품제목 */
	PCONTENT CLOB NOT NULL, /* 상품 내용 */
	PIMAGE1 VARCHAR2(30) NOT NULL, /* 대표이미지1 */
	PIMAGE2 VARCHAR2(30), /* 대표이미지2 */
	PIMAGE3 VARCHAR2(30), /* 대표이미지3 */
	MID VARCHAR2(20) NOT NULL /* 마켓아이디 */
);
SELECT * FROM PRODUCT;
INSERT INTO PRODUCT (pcode,ptitle,pcontent,pimage1,pimage2,pimage3,mid) 
    VALUES (PRODUCT_SEQ.NEXTVAL,'베이킹 소다','상품내용','1111.jpg','1111.jpg','1111.jpg','aaa');
INSERT INTO PRODUCT (pcode,ptitle,pcontent,pimage1,pimage2,mid) 
    VALUES (PRODUCT_SEQ.NEXTVAL,'아이폰11','상품내용','1111.jpg','1111.jpg','bbb');
INSERT INTO PRODUCT (pcode,ptitle,pcontent,pimage1,mid) 
    VALUES (PRODUCT_SEQ.NEXTVAL,'마가린','상품내용','1111.jpg','ccc');
INSERT INTO PRODUCT (pcode,ptitle,pcontent,pimage1,pimage2,pimage3,mid) 
    VALUES (PRODUCT_SEQ.NEXTVAL,'원목옷장','상품내용','1111.jpg','1111.jpg','1111.jpg','ddd');
INSERT INTO PRODUCT (pcode,ptitle,pcontent,pimage1,pimage2,pimage3,mid) 
    VALUES (PRODUCT_SEQ.NEXTVAL,'아웃도어 신발','상품내용','1111.jpg','1111.jpg','1111.jpg','eee');
--찜관련 쿼리-----------------------------------------------------------------------------------------------------------------
SELECT * FROM FAVORITE;
SELECT * FROM CUSTOMER;
--찜하기
INSERT INTO FAVORITE (FCODE,CID,PCODE) VALUES (FAVORITE_SEQ.NEXTVAL,'bbb','3');
--찜취소
DELETE FROM FAVORITE WHERE FCODE='1';
--찜목록
SELECT PIMAGE1,PTITLE FROM PRODUCT P, FAVORITE F WHERE P.PCODE=F.PCODE;
--찜갯수
SELECT COUNT(*) FROM FAVORITE WHERE CID='aaa';
UPDATE FAVORITE SET FHIT= FHIT+1 WHERE PCODE='1';
SELECT COUNT(*) FROM FAVORITE WHERE PCODE='1';
commit;
--메인에서 검색하는 쿼리---------------------------------------------------------------------------------------------------
--all인경우
SELECT * FROM 
    (SELECT ROWNUM RN ,A.* FROM 
        (SELECT P.*,MNAME,(SELECT COUNT(*) FROM FAVORITE F,PRODUCT P WHERE F.PCODE=P.PCODE)FAV FROM PRODUCT P, MARKET M         
            WHERE (PTITLE LIKE '%'||'폰'||'%' OR MNAME LIKE '%'||'롯'||'%') AND P.MID = M.MID ORDER BY FAV DESC)A)
    WHERE RN BETWEEN 1 AND 3;
--상품만검색
SELECT * FROM 
    (SELECT ROWNUM RN ,A.* FROM 
        (SELECT P.*,MNAME,(SELECT COUNT(*) FROM FAVORITE F,PRODUCT P WHERE F.PCODE=P.PCODE)FAV FROM PRODUCT P, MARKET M         
            WHERE PTITLE LIKE '%'||'폰'||'%' AND P.MID = M.MID ORDER BY FAV DESC)A)
    WHERE RN BETWEEN 1 AND 3;
--마켓만 검색
SELECT * FROM 
    (SELECT ROWNUM RN ,A.* FROM 
        (SELECT P.*,MNAME,(SELECT COUNT(*) FROM FAVORITE F,PRODUCT P WHERE F.PCODE=P.PCODE)FAV FROM PRODUCT P, MARKET M         
            WHERE MNAME LIKE '%'||'롯'||'%' AND P.MID = M.MID ORDER BY FAV DESC)A)
    WHERE RN BETWEEN 1 AND 3;
--------------------------------------------------------------------------------------------------------------------------

--PRODUCT_QNA 관련 쿼리------------------------------------------------------------------------------------------------------
SELECT * FROM PRODUCT_QNA;
--P_QNA 등록
INSERT INTO PRODUCT_QNA (pqcode,pqtitle,pqcontent,pqanswer,pqsecret,pqcomplete,pcode,cid)
    VALUES(PRODUCT_QNA_SEQ.nextval,'제품질문','이거 찐인가요','답변입니다.','1','1',1,'aaa');
--P_QNA 목록
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM PRODUCT_QNA ORDER BY PQDATE DESC)A)
    WHERE RN BETWEEN 1 AND 10;
--P_QNA 수정
UPDATE PRODUCT_QNA SET PQTITLE='제품질문',
                       PQCONTENT='이거 찐인가요',
                       PQANSWER='답변입니다.',
                       PQSECRET='0',
                       PQCOMPLETE='1'
            WHERE PqCODE='2' AND CID='aaa';
--P_QNA 삭제
DELETE FROM PRODUCT_QNA WHERE PCODE='4' AND CID='aaa';
------------------------------------------------------------------------------------------------------------------------------  
--회원별 ,품목별 주문목록 보기
SELECT * FROM SP_ORDER;
SELECT * FROM PRODUCT_OPTION;
SELECT * FROM ORDER_DETAIL;
SELECT * FROM COUPON;
SELECT * FROM PRODUCT_TYPE;
INSERT INTO ORDER_DETAIL VALUES(ORDER_DETAIL_SEQ.nextval,1,1,1,3,4000);
INSERT INTO SP_ORDER VALUES(SP_ORDER_SEQ.nextval,'PARK','010-2017-7619','11111','서울시종로구','206호',15000,SYSDATE,'배송중','환불신청','aaa');
--전체리스트
SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT SP.*,PO.*,ODCODE,CUID,ODCOUNT,ODUNIT FROM SP_ORDER SP, ORDER_DETAIL OD, PRODUCT_OPTION PO
             WHERE SP.OCODE=OD.OCODE AND OD.ODCODE=PO.POCODE 
                ORDER BY SP.OCODE)A)
    WHERE RN BETWEEN 1 AND 3;
--회원별
SELECT SP.*,PO.*,ODCODE,CUID,ODCOUNT,ODUNIT
    FROM SP_ORDER SP, ORDER_DETAIL OD, PRODUCT_OPTION PO
        WHERE SP.OCODE=OD.OCODE AND OD.ODCODE=PO.POCODE AND ONAME LIKE '%'||'p'||'%' ORDER BY ONAME;

SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT SP.*,PO.*,ODCODE,CUID,ODCOUNT,ODUNIT FROM SP_ORDER SP, ORDER_DETAIL OD, PRODUCT_OPTION PO
             WHERE SP.OCODE=OD.OCODE AND OD.ODCODE=PO.POCODE AND ONAME LIKE '%'||'p'||'%'
                ORDER BY ONAME)A)
    WHERE RN BETWEEN 1 AND 3;
--품목별
SELECT SP.*,PO.*,ODCODE,CUID,ODCOUNT,ODUNIT
    FROM SP_ORDER SP, ORDER_DETAIL OD, PRODUCT_OPTION PO
        WHERE SP.OCODE=OD.OCODE AND OD.ODCODE=PO.POCODE AND PONAME LIKE '%'||'쌀'||'%' ORDER BY ONAME;


SELECT * FROM 
    (SELECT ROWNUM RN, A.* FROM 
        (SELECT SP.*,PO.*,ODCODE,CUID,ODCOUNT,ODUNIT FROM SP_ORDER SP, ORDER_DETAIL OD, PRODUCT_OPTION PO
             WHERE SP.OCODE=OD.OCODE AND OD.ODCODE=PO.POCODE AND PONAME LIKE '%'||'쌀'||'%'
                ORDER BY ONAME)A)
    WHERE RN BETWEEN 1 AND 3; 
--마켓별
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM
        (SELECT MNAME, P.*,PO.POCODE,PONAME,PONET,POPRICE,TYPECODE,ODCODE,OCODE,CUID,ODCOUNT,ODUNIT 
            FROM MARKET M, PRODUCT P, PRODUCT_OPTION PO,ORDER_DETAIL OD
                WHERE M.MID = P.MID AND P.PCODE=PO.PCODE AND M.MNAME LIKE '%'||'롯'||'%' ORDER BY MNAME)A)
    WHERE RN BETWEEN 1 AND 3;
----공지사항 관련 쿼리----------------------------------------------------------------------------------------------------
SELECT * FROM NOTICE;
SELECT * FROM CUSTOMER;
SELECT * FROM ADMIN;
--공지사항 쓰기
--원글
INSERT INTO NOTICE (NCODE,NTITLE,NCONTENT,NRDATE,NGROUP,NSTEP,NINDENT,NHIT,AID)
    VALUES(NOTICE_SEQ.nextval,'공지사항입니다.','비밀번호를 분실했습니다.',SYSDATE,NOTICE_SEQ.CURRVAL,0,0,0,'aaa');
--답변글
INSERT INTO NOTICE VALUES(NOTICE_SEQ.nextval,'공지사항입니다.','비밀번호를 분실했습니다.',SYSDATE,12,1,1,0,'aaa','aaa');
--공지사항 목록
SELECT * FROM (SELECT ROWNUM RN ,A.* FROM
    (SELECT NCODE, CID||AID  WRITER, NTITLE, NCONTENT, NRDATE,NHIT 
            FROM NOTICE ORDER BY NRDATE DESC)A)
    WHERE RN BETWEEN 1 AND 3;
--공지사항 수정
UPDATE NOTICE SET NTITLE = '공지사항입니다.',
                NCONTENT='비번을 분실 했습니다',
                NRDATE = SYSDATE
        WHERE NCODE=1;
--공지사항 삭제
DELETE FROM NOTICE WHERE NCODE=1;
--공지사항 조회수 올리기
UPDATE NOTICE SET NHIT=NHIT+1 WHERE NCODE=1;
--공지사항 상세보기
SELECT * FROM NOTICE 
    WHERE NCODE=1;
--공지사항 글 갯수
SELECT COUNT(*) FROM NOTICE;

--REVIEW 출력
SELECT * FROM REVIEW;
SELECT * FROM (SELECT ROWNUM RN, A.* FROM 
                    (SELECT * FROM REVIEW ORDER BY RRDATE DESC)A)
WHERE RN BETWEEN 1 AND 3;
--PRODUCT_QNA 출력
SELECT * FROM PRODUCT_QNA;
SELECT * FROM PRODUCT_QNA ORDER BY PQDATE DESC;
--
COMMIT;
