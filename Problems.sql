/*
Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
Write an SQL query to report all the duplicate emails.
Return the result table in any order.
Example 1:
Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times.
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




