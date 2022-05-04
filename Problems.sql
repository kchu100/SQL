
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
