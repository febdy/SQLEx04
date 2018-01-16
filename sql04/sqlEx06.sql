-- table 생성
CREATE TABLE author(
    author_id       number(10)       PRIMARY KEY,
    author_name     varchar2(100)    NOT NULL,
    author_desc     varchar2(500)
);

CREATE TABLE book(
    book_id     number(5)        PRIMARY KEY,
    title       varchar2(100)    NOT NULL,
    pubs        varchar2(100),
    pub_date    date,
    author_id   number(10),
    CONSTRAINT c_book_fk FOREIGN KEY(author_id)
    REFERENCES author(author_id)
); 


-- sequence 생성
CREATE SEQUENCE seq_author_id
INCREMENT BY 1
START WITH 1;

CREATE SEQUENCE seq_book_id
INCREMENT BY 1
START WITH 1; 


-- data 삽입
INSERT INTO author
VALUES(seq_author_id.nextVal, '이문열', '경북 영양');
INSERT INTO author
VALUES(seq_author_id.nextVal, '박경리', '경상남도 통영');
INSERT INTO author
VALUES(seq_author_id.nextVal, '유시민', '17대 국회의원');
INSERT INTO author
VALUES(seq_author_id.nextVal, '기안84', '웹툰작가');
INSERT INTO author
VALUES(seq_author_id.nextVal, '강풀', '온라인 만화가 1세대');
INSERT INTO author
VALUES(seq_author_id.nextVal, '김영하', '알쓸신잡');

INSERT INTO book(book_id, title, pubs, pub_date, author_id)
VALUES(seq_book_id.nextVal, '우리들의 일그러진 영웅', '다림', '1998-02-22', 1);
INSERT INTO book(book_id, title, pubs, pub_date, author_id)
VALUES(seq_book_id.nextVal, '삼국지', '민음사', '2002-03-01', 1);
INSERT INTO book(book_id, title, pubs, pub_date, author_id)
VALUES(seq_book_id.nextVal, '토지', '마로니에북스', '2012-08-15', 2);
INSERT INTO book(book_id, title, pubs, pub_date, author_id)
VALUES(seq_book_id.nextVal, '유시민의 글쓰기 특강', '생각의길', '2015-04-01', 3);
INSERT INTO book(book_id, title, pubs, pub_date, author_id)
VALUES(seq_book_id.nextVal, '패션왕', '중앙북스(books)', '2012-02-22', 4);
INSERT INTO book(book_id, title, pubs, pub_date, author_id)
VALUES(seq_book_id.nextVal, '순정만화', '재미주의', '2011-08-03', 5);
INSERT INTO book(book_id, title, pubs, pub_date, author_id)
VALUES(seq_book_id.nextVal, '오직두사람', '문학동네', '2017-05-04', 6);
INSERT INTO book(book_id, title, pubs, pub_date, author_id)
VALUES(seq_book_id.nextVal, '26년', '재미주의', '2012-02-04', 5);


-- 결과 보기
SELECT bo.book_id,
       bo.title, 
       bo.pubs, 
       bo.pub_date, 
       bo.author_id, 
       au.author_name, 
       au.author_desc
FROM book bo, author au
WHERE bo.author_id = au.author_id;

UPDATE author
SET author_desc = '서울특별시'
WHERE author_name = '강풀';

COMMIT;