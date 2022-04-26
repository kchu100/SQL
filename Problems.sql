
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
