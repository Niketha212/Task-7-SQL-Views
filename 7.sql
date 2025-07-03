USE LibraryDB;
CREATE VIEW MemberBorrowSummary AS
SELECT 
m.member_id,m.name,COUNT(br.borrow_id) AS total_borrowed
FROM Members m
LEFT JOIN BorrowRecords br ON m.member_id = br.member_id
GROUP BY m.member_id;

SELECT * FROM MemberBorrowSummary;

CREATE VIEW BorrowedBooksDetail AS
SELECT 
    br.borrow_id,b.title AS book_title,m.name AS member_name,br.borrow_date,br.return_date
FROM BorrowRecords br
JOIN Books b ON br.book_id = b.book_id
JOIN Members m ON br.member_id = m.member_id;

SELECT * 
FROM BorrowedBooksDetail
WHERE borrow_date >= '2024-06-01';

CREATE VIEW ActiveMembersView AS
SELECT * FROM Members
WHERE join_date >= '2023-01-01'
WITH CHECK OPTION;

INSERT INTO ActiveMembersView (name, join_date) VALUES ('Ravi', '2023-05-01');

 DROP VIEW IF EXISTS BorrowedBooksDetail;

