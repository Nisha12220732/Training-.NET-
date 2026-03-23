CREATE SEQUENCE mySeq
START WITH 10
INCREMENT BY 5;

SELECT NEXT VALUE FOR mySeq;
SELECT NEXT VALUE FOR mySeq;
SELECT NEXT VALUE FOR mySeq;

create table myTable
(sid int, Sname varchar(15))

INSERT INTO myTable(sid, sname)
VALUES (NEXT VALUE FOR mySeq, 'Tom');

select * from myTable

INSERT INTO myTable(sid, sname)
VALUES (NEXT VALUE FOR mySeq, 'Moody');