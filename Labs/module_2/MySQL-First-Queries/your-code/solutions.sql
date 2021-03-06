Use ironhack_par;

SELECT * FROM Appstore;

# Question 1
select prime_genre from Appstore;

# Question 2 to finish
select prime_genre, rating_count_tot
from Appstore
where rating_count_tot is not null and rating_count_tot > 0
order by 2 desc
limit 1;

# Question 3
select prime_genre, count(id) as 'Number of apps per genre'
from Appstore
group by prime_genre
order by 2 desc limit 1;

# Question 4
select prime_genre, count(track_name) as 'Number of apps per genre'
from Appstore
group by prime_genre
order by count(track_name) asc limit 1;

# Question 5
select *
from Appstore
order by rating_count_tot desc limit 10;

# Question 6
select *
from Appstore
order by user_rating desc limit 10;

# Question 7
# Not a big surprise, the top 10 apps most rated are the most famous app. 

# Question 8
# That top 5 list using the value (user_rating) does not give us a good picture as it's not representative of all the app noted with 5.

# Question 9
# Hard to compare as top 5 list framed to 10 does not give us any clear picture. No correct correlation can be given by those two insights.

# Question 10
select track_name, user_rating, rating_count_tot
from Appstore
where user_rating = 5
order by rating_count_tot desc limit 3;

# Solution with two orders
select *
from Appstore
order by user_rating desc, rating_count_tot desc 
limit 3;

select *
from Appstore
where user_rating > 3
order by user_rating desc, rating_count_tot desc 
limit 3;


# Question 11
select track_name, user_rating, rating_count_tot, price
from Appstore
order by price desc;
# it will be interesting to establish correlation between price/rating_count_tot and else price/user_rating

select track_name, user_rating, rating_count_tot, price
from Appstore
order by rating_count_tot desc limit 10;
# that query shows us that the most downloaded apps are all free

select track_name, user_rating, rating_count_tot, price
from Appstore
order by price desc limit 10;
# that query shows us that the most expensive apps are not downloaded a lot !

select track_name, user_rating, rating_count_tot, price
from Appstore
order by user_rating desc limit 10;
# that query shows us the best rated apps cost between 0 and 9.99 

# Conclusion, people will massively prefer not paying for apps, but when the apps is really useful, users will be ok to pay for it.

