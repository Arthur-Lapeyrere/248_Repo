use publications;
select * from authors;
select * from titleauthor;
select * from titles;
select * from publishers;
select * from sales;

# challenge 1
select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME' , t.title as 'TITLE', p.pub_name as 'PUBLISHER'
from  authors a
inner join titleauthor ta on a.au_id = ta.au_id
inner join titles t on ta.title_id = t.title_id
inner join publishers p on t.pub_id = p.pub_id;

select * from titleauthor;

# challenge 2
select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', p.pub_name as 'PUBLISHER', count(t.title_id) as 'TITLE COUNT'
from  authors a
inner join titleauthor ta on a.au_id = ta.au_id
inner join titles t on t.title_id = ta.title_id
inner join publishers p on t.pub_id = p.pub_id
group by a.au_id;

# challenge 3
select * from sales;

select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', count(s.title_id) as 'TOTAL'
from  authors a
inner join titleauthor ta on a.au_id = ta.au_id
inner join titles t on  ta.title_id = t.title_id
inner join sales s on t.title_id = s.title_id
group by a.au_id
order by TOTAL desc limit 3;

# challenge 4
select a.au_id as 'AUTHOR ID', a.au_lname as 'LAST NAME', a.au_fname as 'FIRST NAME', count(s.title_id) as 'TOTAL'
from  authors a 
left join titleauthor ta on a.au_id = ta.au_id
left join titles t on  ta.title_id = t.title_id
left join sales s on t.title_id = s.title_id
group by a.au_id
order by TOTAL desc;
