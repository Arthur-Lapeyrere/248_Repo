# Challenge 1
select district_id, count(distinct account_id) as 'ac_freq'
from account
group by district_id
order by ac_freq desc
limit 5;

# Challenge 2
select account_id, count(distinct amount) as diff, group_concat(distinct bank_to), group_concat(distinct amount)
from finance1.order
where k_symbol = 'SIPO'
group by account_id
having diff>1;

# Challenge 3
select l.account_id, l.amount, a.district_id, d.A2 as 'district_name'
from loan l
inner join account a on l.account_id = a.account_id
inner join district d on d.A1 = a.district_id
order by l.amount desc;

# Challenge 4
select a.district_id, d.A2, sum(l.amount) as Total_loans
from loan l
inner join account a on l.account_id = a.account_id
inner join district d on d.A1 = a.district_id
group by a.district_id
order by Total_loans desc;

# Challenge 5
select a.district_id, d.A2, avg(l.amount) as Avg_loans
from loan l
inner join account a on l.account_id = a.account_id
inner join district d on d.A1 = a.district_id
group by a.district_id
order by Avg_loans desc;

# median
/*
Median 
for every district:
	1. Sort the amount
    2. count the number of rows
    3. #2/2
    4. select the value that is #3
*/

create table xxx
select l.account_id, district_id, amount
from account a
inner join loan l on a.account_id=l.account_id;

select district_id, amount
from (
SELECT x.district_id, x.amount, count(y.amount) as ranking
from xxx x, xxx y
where x.district_id=y.district_id and x.amount<y.amount
group by x.district_id, x.amount) as ranked_table
where exists(
	select x1.district_id, ceil(count(x1.amount)/2) ranking
	from xxx x1
	group by district_id
    having ranked_table.district_id = x1.district_id and ranked_table.ranking=ranking)
order by 2 desc
limit 5;