# Challenge 1
select *
from sales;

select *
from titles;

select *
from titleauthor;

# Step 1
select ta.title_id, ta.au_id, t.advance * ta.royaltyper / 100 as 'advance', t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as 'sales_royalty'
from titleauthor ta
inner join titles t on ta.title_id = t.title_id
inner join sales s on t.title_id = s.title_id;

# Step 2
select title_id, au_id, sum(sales_royalty) as Aggregated_Royalties, advance
from (
select ta.title_id, ta.au_id, t.advance * ta.royaltyper / 100 as 'advance', t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as 'sales_royalty'
from titleauthor ta
inner join titles t on ta.title_id = t.title_id
inner join sales s on t.title_id = s.title_id
) sub
group by au_id, title_id;

# Step 3
select au_id, advance + Aggregated_Royalties as 'Profits'
from (
select title_id, au_id, sum(sales_royalty) as Aggregated_Royalties, advance
from (
select ta.title_id, ta.au_id, t.advance * ta.royaltyper / 100 as 'advance', t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as 'sales_royalty'
from titleauthor ta
inner join titles t on ta.title_id = t.title_id
inner join sales s on t.title_id = s.title_id
) sub
group by au_id, title_id
) sub2
group by au_id, title_id limit 3;

# Challenge 2 - Alternative Solution
CREATE TEMPORARY TABLE publications.store_sub1
select ta.title_id, ta.au_id, t.advance * ta.royaltyper / 100 as 'advance', t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as 'sales_royalty'
from titleauthor ta
inner join titles t on ta.title_id = t.title_id
inner join sales s on t.title_id = s.title_id;

CREATE TEMPORARY TABLE publications.store_sub2
select title_id, au_id, sum(sales_royalty) as Aggregated_Royalties, advance
from publications.store_sub1
group by au_id, title_id;

select au_id, advance + Aggregated_Royalties as 'Profits'
from publications.store_sub2
group by au_id, title_id limit 3;

# Challenge 3
CREATE TABLE if not exists publications.most_profiting_authors as
select au_id, advance + Aggregated_Royalties as 'Profits'
from (
select title_id, au_id, sum(sales_royalty) as Aggregated_Royalties, advance
from (
select ta.title_id, ta.au_id, t.advance * ta.royaltyper / 100 as 'advance', t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as 'sales_royalty'
from titleauthor ta
inner join titles t on ta.title_id = t.title_id
inner join sales s on t.title_id = s.title_id
) sub
group by au_id, title_id
) sub2
group by au_id, title_id limit 3;

select *
from most_profiting_authors



