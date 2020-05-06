------------------------------------------------------------------------------------------------------------------------------
-- ADMIN
------------------------------------------------------------------------------------------------------------------------------

INSERT INTO ADMIN VALUES('admin','111');

SELECT * FROM ADMIN;

-- ADMIN 로그인
SELECT * FROM ADMIN WHERE AID = 'admin';



COMMIT;

SELECT COUNT(*) FROM CUSTOMER WHERE CSNSID = #{csnsid}