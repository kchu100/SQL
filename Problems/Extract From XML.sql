  /*
  https://app.codesignal.com/arcade/db/specialties/GvJFyTbHdFqWtXTxc
  */
  select ExtractValue(xml_doc, 'catalog/book[1]/author') as author 
	from catalogs
	order by author;
