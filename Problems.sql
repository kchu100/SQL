/*
Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. 
Note that you are supposed to write a DELETE statement and not a SELECT one.
After running your script, the answer shown is the Person table. The final order of the Person table does not matter.
Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
*/
delete p1
from person as p1 inner join person as p2
where p1.id > p2.id and p1.email = p2.email


/*
Write an SQL query to report all the duplicate emails
Return the result table in any order.
Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
*/
select email as Email
from Person
group by email
having count(email) > 1


/*
Extract from XML
https://app.codesignal.com/arcade/db/specialties/GvJFyTbHdFqWtXTxc
*/
select ExtractValue(xml_doc, 'catalog/book[1]/author') as author 
from catalogs
order by author;


/*
Calculate the distance between two points then total up the sum
https://app.codesignal.com/arcade/db/join-us-at-the-table/hYeHdGQAtPEXYxXaf
*/
select round(sum(sqrt(power(c2.x - c1.x, 2) + power(c2.y - c1.y, 2))), 9) as total
from cities as c1, cities as c2
where c2.id - c1.id = 1;


/*
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and 
displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.
Why MIN in the select statement?

After putting the select cases, add "ORDER BY Name" (Refer above code on where to add Order by clause). The result will look like this https://imgur.com/aBHUqN6
What changed? the names in all four columns are sorted as per alphabetical order.

Now, we only want the names and not the NULL values from our virtual table. 
How can we do that? - There may be multiple ways, lets us consider the MIN/MAX (Yes, you can replace MIN with MAX and you will get the same result)

Without GROUP BY clause - When a MIN/MAX is used in a Select statement, 
it will return The "LOWEST" element from each column 
(which happened to be the first element because we used ORDER BY, if you use MAX, you will get the last element from each column). 
It will look like this https://imgur.com/XDZzc4Z That means, you will always get a single row from a table.
https://www.hackerrank.com/challenges/occupations/copy-from/268538337
*/
set @r1 = 0, @r2 = 0, @r3 = 0, @r4 = 0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from 
(
    select
        case
            when Occupation = 'Doctor' then @r1:= @r1 + 1
            when Occupation = 'Professor' then @r2:= @r2 + 1
            when Occupation = 'Singer' then @r3:= @r3 + 1
            when Occupation = 'Actor' then @r4:= @r4 + 1
        end as rowNumber,
            case when Occupation = 'Doctor' then Name end as Doctor,
            case when Occupation = 'Professor' then Name end as Professor,
            case when Occupation = 'Singer' then Name end as Singer,
            case when Occupation = 'Actor' then Name end as Actor
    from occupations
    order by name
) as t
group by rowNumber


/*
Distinguish between the root, leaf and inner nodes in a binary search tree
Root = has no parent and have child nodes
Leaf = has no child nodes/has a parent node
Inner = has both parent and child nodes
https://www.hackerrank.com/challenges/binary-search-tree-1/problem
*/
select 
    case 
        when P is null then concat(N, ' Root')
        when N in (select distinct P from bst) then concat(N, ' Inner')
        else concat(N, ' Leaf')
    end
from bst
order by N


/*
Julia asked her students to create some coding challenges. 
Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, 
then exclude those students from the result.

Tables
Hackers: hacker_id, name
Challenges: challenge_id, hacker_id
*/
select h.hacker_id, h.name, count(c.challenge_id) as ct
from hackers as h inner join challenges as c on h.hacker_id = c.hacker_id
group by h.hacker_id, h.name
having ct = 
(
    select count(challenge_id) as co
    from challenges
    group by hacker_id
    order by co desc
    limit 1
)
or ct in 
(
    select t.cnt
    from 
    (
        select count(*) as cnt
        from challenges 
        group by hacker_id
    ) as t
    group by t.cnt
    having count(t.cnt) = 1
)
order by ct desc, h.hacker_id


/*
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!
The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of  from your result.

Tables
Hackers: hacker_id, name
Submissions: submission_id, hacker_id, challenge_id, score
*/
select h.hacker_id, h.name, sum(t.ma) as su
from 
hackers as h inner join
(
    select s1.hacker_id,
    case 
        when s1.challenge_id = s2.challenge_id then max(s1.score) end as ma
    from submissions as s1 left outer join submissions as s2 on s1.hacker_id = s2.hacker_id
    group by s1.challenge_id, s1.hacker_id, s2.challenge_id
) as t on h.hacker_id = t.hacker_id
group by h.hacker_id, h.name
having su > 0
order by su desc, h.hacker_id asc


/*
Write an SQL query to rearrange the Products table so that each row has (product_id, store, price). 
If a product is not available in a store, do not include a row with that product_id and store combination in the result table.
Return the result table in any order.
The query result format is in the following example.
Input: 
Products table:
+------------+--------+--------+--------+
| product_id | store1 | store2 | store3 |
+------------+--------+--------+--------+
| 0          | 95     | 100    | 105    |
| 1          | 70     | null   | 80     |
+------------+--------+--------+--------+
Output: 
+------------+--------+-------+
| product_id | store  | price |
+------------+--------+-------+
| 0          | store1 | 95    |
| 0          | store2 | 100   |
| 0          | store3 | 105   |
| 1          | store1 | 70    |
| 1          | store3 | 80    |
+------------+--------+-------+
*/
select product_id, "store1" as store, store1 as price
from products
where store1 is not null
UNION
select product_id, "store2" as store, store2 as price
from products
where store2 is not null
UNION
select product_id, "store3" as store, store3 as price
from products
where store3 is not null

    
/*
Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.
Output the host id and the guest id of matched pair.
Tables: airbnb_hosts, airbnb_guests
airbnb_hosts
host_id: int
nationality: varchar
gender: varchar
age: int
----------------------
airbnb_guests
guest_id: int
nationality: varchar
gender: varchar
age: int
*/

select distinct host_id, guest_id
from airbnb_hosts as h inner join airbnb_guests as g
using(nationality, gender); 
/*"using" CAN ONLY be used in MySQL ----- In MS SQL Server: "on h.nationality = g.nationalist and h.gender = g.gender"*/


/*
Find the email activity rank for each user. Email activity rank is defined by the total number of emails sent. 
The user with the highest number of emails sent will have a rank of 1, and so on. 
Output the user, total emails, and their activity rank. 
Order records by the total emails in descending order. 
Sort users with the same number of emails in alphabetical order.
In your rankings, return a unique value (i.e., a unique rank) even if multiple users have the same number of emails.
For tie breaker use alphabetical order of the user usernames.
*/
select from_user, count(from_user) as total_emails, row_number() over (order by count(*) desc, from_user asc) as row_number
from google_gmail_emails
group by from_user


/*
Find all numbers that appear at least three times consecutively.
Return the result table in any order.
The result format is in the following example.
Example 1:
Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
Explanation: 1 is the only number that appears consecutively for at least three times.
*/
/*This is essentially checking if the next num and the following num is the same as the first*/
SELECT distinct Num as ConsecutiveNums
FROM Logs
WHERE (Id + 1, Num) in (select * from Logs) and (Id + 2, Num) in (select * from Logs)






