use library;
drop table book;
drop table books;
drop table member;
drop table members;
create table books( book_id int primary key, title varchar(99));
create table members( member_id int primary key, name varchar(50));
create table loans (loan_id int primary key, member_id int, book_id int, loan_date date, foreign key (member_id) references members(member_id), foreign key(book_id) references books(book_id));
insert into books values (2, 'The Alchemist'), (3, 'Digital Fortress'), (4, 'A Brief History of Time'), (5, 'To kill a Mockingbird');
insert into members values (2, 'Alice'), (3, 'Bob'), (4, 'Charlie'), (5, 'David');
insert into loans values (303, 2, 3, '2024-05-02'), (304,3,2, '2024-05-03'), (305,4,5, '2024-6-22');
select members.name, books.title, loans.loan_date from loans 
inner join members on loans.member_id=members.member_id
inner join books on loans.book_id = books.book_id;
select members.name, books.title, loans.loan_date from members left join loans on members.member_id = loans.member_id left join books on loans.book_id = books.book_id;
select members.name, books.title, loans.loan_date from books right join loans on books.book_id=loans.book_id right join members on loans.member_id=members.member_id;
select members.name, books.title, loans.loan_date from members left join loans on members.member_id=loans.member_id left join books on loans.book_id=books.book_id
union select members.name, books.title, loans.loan_date from books left join loans on books.book_id=loans.book_id
left join members on loans.member_id=members.member_id;
