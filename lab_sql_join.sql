-- Leonardo Olmos Saucedo / Lab SQL Join

-- 1. List the number of films per category.
SELECT C.NAME, COUNT(F.FILM_ID) as total_films
FROM CATEGORY C 
join FILM_CATEGORY FC 
on C.CATEGORY_ID = FC.CATEGORY_ID 
join FILM F 
on FC.FILM_ID = F.FILM_ID 
group by C.NAME ;

-- 2. Display the first and the last names, as well as the address, of each staff member.
select S.FIRST_NAME, S.LAST_NAME, A.ADDRESS 
from STAFF S 
join ADDRESS A 
on S.ADDRESS_ID = A.ADDRESS_ID;

-- 3. Display the total amount rung up by each staff member in August 2005.
select S.FIRST_NAME, S.LAST_NAME, SUM(P.AMOUNT) as TOTAL
from STAFF S 
join PAYMENT P 
on S.STAFF_ID = P.STAFF_ID
where DATE_FORMAT(convert(P.PAYMENT_DATE, date), '%M-%Y') = 'August-2005'
group by S.FIRST_NAME, S.LAST_NAME;

-- 4. List all films and the number of actors who are listed for each film.
select F.TITLE, COUNT(FA.ACTOR_ID) as TOTAL_ACTORS
from FILM F 
join FILM_ACTOR FA 
on FA.FILM_ID = F.FILM_ID 
join ACTOR A 
on FA.ACTOR_ID = A.ACTOR_ID 
group by F.TITLE
order by 1;

/* 5. Using the payment and the customer tables as well as the JOIN command, 
list the total amount paid by each customer. List the customers alphabetically by their last names.*/
select C.FIRST_NAME, C.LAST_NAME, SUM(P.AMOUNT) as 'TOTAL_PAID' 
from CUSTOMER C 
join PAYMENT P 
on C.CUSTOMER_ID = P.CUSTOMER_ID 
group by C.FIRST_NAME, C.LAST_NAME 
order by C.LAST_NAME ;