------------------------------------------------------------------------------------------------------------------------------
-- MARKET
------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM MARKET;

-- 전체 마켓 목록 가져오기
SELECT * FROM MARKET;

-- 마켓가입시 아이디 중복 검색
SELECT COUNT(*) FROM MARKET WHERE MID='aaa';

-- 로그인시 해당 마켓회원 검색
SELECT * FROM MARKET WHERE MID='aaa';

-- 마켓회원 가입하기
INSERT INTO MARKET VALUES('bbb','111','참좋은몰','010-111-1111','00234','서울시 종로구','234-24번지');

-- 마켓 회원정보 수정
UPDATE MARKET SET
    MPW = '111',
    MNAME = 'kang',
    MTEL = '',
    MPOST = '',
    MADDR1 = '2',
    MADDR2 = 'kang@mail.com'
WHERE MID = 'bbb';

-- 마켓회원 탈퇴
DELETE FROM MARKET WHERE MID = '';





