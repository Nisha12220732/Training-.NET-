USE pubs
Select * from Authors
Select * from TitleAuthor
Select * from Titles

SELECT au_lname, au_fname
FROM authors
WHERE au_id IN
   (SELECT au_id
   FROM titleauthor
   WHERE title_id IN
      (SELECT title_id
      FROM titles
      WHERE type = 'popular_comp'))

--2
USE pubs
SELECT DISTINCT city
FROM authors
WHERE EXISTS
   (SELECT *
   FROM publishers
   WHERE authors.city = publishers.city)

SELECT DISTINCT city
FROM authors
WHERE Not EXISTS
   (SELECT *
   FROM publishers
   WHERE authors.city = publishers.city)

Use Northwind
GO
Select Emp.*,(Select DName From Dept Where DeptNo=Emp.DeptNo) As 'DName' from Emp
USE pubs
SELECT DISTINCT t1.type
FROM titles t1
WHERE t1.type IN
   (SELECT t2.type
   FROM titles t2
   WHERE t1.pub_id = t2.pub_id)

--Demo for using subqueries with INSERT Statement
USE pubs
CREATE TABLE author_sales
( data_source   varchar(20),
  au_id         varchar(11),
  au_lname      varchar(40),
  sales_dollars smallmoney
)
INSERT author_sales
   SELECT 'SELECT', authors.au_id, authors.au_lname, 
      SUM(titles.price * sales.qty) 
   FROM authors INNER JOIN titleauthor 
      ON authors.au_id = titleauthor.au_id INNER JOIN titles
      ON titleauthor.title_id = titles.title_id INNER JOIN sales
      ON titles.title_id = sales.title_id
   WHERE authors.au_id LIKE '8%'
   GROUP BY authors.au_id, authors.au_lname

Select * from author_sales

Select * Into Customers1 from Customers Where 1=2 
Insert Customers1
Select * from Customers
Select * from Customers1
Drop Table Customers1
--Demo for using subqueries with UPDATE Statement
USE pubs
UPDATE titles
    SET ytd_sales = t.ytd_sales + s.qty
    FROM titles t, sales s
    WHERE t.title_id = s.title_id
    AND s.ord_date = (SELECT MAX(sales.ord_date) FROM sales)

--Demo for using subqueries with DELETE Statement
USE pubs
DELETE titleauthor
FROM titleauthor INNER JOIN titles 
   ON titleauthor.title_id = titles.title_id
WHERE titles.title LIKE '%computers%'