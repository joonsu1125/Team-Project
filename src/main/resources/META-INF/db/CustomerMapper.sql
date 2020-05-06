------------------------------------------------------------------------------------------------------------------------------
-- CUSTOMER
------------------------------------------------------------------------------------------------------------------------------
-- 전체 회원 목록 가져오기
SELECT * FROM CUSTOMER;

-- 회원가입시 아이디 중복 검색
SELECT COUNT(*) FROM CUSTOMER WHERE CID='aaa';

-- 로그인시 해당 회원 검색
SELECT * FROM CUSTOMER WHERE CID='aaa';

-- SNS로 로그인시 해당 SNS명과 SNSID가 있는지 검색
SELECT COUNT(*) FROM CUSTOMER WHERE CPROVIDER = '' AND CSNSID = '';

-- SNSid로 해당 회원 정보 가져오기
SELECT * FROM CUSTOMER WHERE CSNSID='aaa';


-- 회원가입하기
-- ( 일반회원 가입)
INSERT INTO CUSTOMER VALUES('aaa','111','hong',null,null,'1','jeenpark@mail.com','010-2017-7619',SYSDATE, 0,'1');

-- ( SNS로그인 회원 가입)
INSERT INTO CUSTOMER VALUES('bbb','111','bang', '1234567890', 'google', '1', 'jeenpark@mail.com', '010-2017-7619', SYSDATE, 0, '1');

INSERT INTO CUSTOMER VALUES('ccc','111','wang', '987654321', 'kakao', ADDRLIST_SEQ.nextval , 'ccc@mail.com', '010-2017-7619', SYSDATE, 0, '1');


-- 회원정보 수정
UPDATE CUSTOMER SET
    CPW = '111',
    CNAME = 'kang',
    ADDRCODE = '2',
    CEMAIL = 'kang@mail.com'
WHERE CID = 'bbb';

-- 회원주소코드 수정
UPDATE CUSTOMER SET
    ADDRCODE = ''
WHERE CID = '';
	

-- 회원정보 수정시 이메일 중복 체크
SELECT COUNT(*) FROM CUSTOMER WHERE CEMAIL = 'kang@mail.com';

-- 회원 탈퇴
DELETE FROM CUSTOMER WHERE CID = 'ccc';

COMMIT;
------------------------------------------------------------------------------------------------------------------------------
-- ADDRLIST
------------------------------------------------------------------------------------------------------------------------------
-- 회원주소
SELECT * FROM ADDRLIST;

SELECT * FROM USER_SEQUENCES;

SELECT COUNT(*) FROM ADDRLIST WHERE CID='aaaa';

SELECT MAX( TO_NUMBER(ADDRCODE)) FROM ADDRLIST;

SELECT TO_CHAR(MAX(TO_NUMBER(ADDRCODE))) FROM ADDRLIST;

-- 회원주소등록(회원가입시 등록)
INSERT INTO ADDRLIST VALUES(ADDRLIST_SEQ.CURRVAL ,1,'11111','서울시','11-11번지','aaa');

-- 회원주소등록(주소 추가등록)
INSERT INTO ADDRLIST VALUES(ADDRLIST_SEQ.nextval,1,'11111','서울시','11-11번지','aaa');

-- 회원주소 수정
UPDATE ADDRLIST SET
    ADDRNAME = '3',
    CPOST = '33333',
    CADDR1 = '인천광역시',
    CADDR2 = '33-33번지'
WHERE ADDRCODE = 1;

-- 회원주소 삭제
DELETE FROM ADDRLIST WHERE ADDRCODE = 6;

COMMIT;